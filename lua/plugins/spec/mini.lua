return {
  {
    "echasnovski/mini.files",
    event = "VeryLazy",
    config = function()
      local files = require "mini.files"
      files.setup {
        -- Customization of shown content
        content = {
          -- Predicate for which file system entries to show
          filter = nil,
          -- What prefix to show to the left of file system entry
          prefix = nil,
          -- In which order to show file system entries
          sort = nil,
        },

        -- Module mappings created only inside explorer.
        -- Use `''` (empty string) to not create one.
        mappings = {
          close = "q",
          go_in = "l",
          go_in_plus = "<CR>",
          go_out = "",
          go_out_plus = "h",
          mark_goto = "'",
          mark_set = "m",
          reset = "~",
          reveal_cwd = "_",
          show_help = "g?",
          synchronize = "=",
          trim_left = "<",
          trim_right = ">",
        },

        -- General options
        options = {
          -- Whether to delete permanently or move into module-specific trash
          permanent_delete = true,
          -- Whether to use for editing directories
          use_as_default_explorer = true,
        },

        -- Customization of explorer windows
        windows = {
          -- Maximum number of windows to show side by side
          max_number = math.huge,
          -- Whether to show preview of file/directory under cursor
          preview = false,
          -- Width of focused window
          width_focus = 50,
          -- Width of non-focused window
          width_nofocus = 15,
          -- Width of preview window
          width_preview = 25,
        },
      }

      local function toggle()
        if not files.close() then
          files.open(vim.fn.expand "%")
        end
      end

      local files_set_cwd = function(path)
        -- Works only if cursor is on the valid file system entry
        local cur_entry_path = files.get_fs_entry().path
        local cur_directory = vim.fs.dirname(cur_entry_path)
        vim.fn.chdir(cur_directory)
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          vim.keymap.set("n", "g~", files_set_cwd, { buffer = args.data.buf_id })
        end,
      })

      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local cur_target = files.get_explorer_state().target_window
          local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. " split")
            return vim.api.nvim_get_current_win()
          end)

          files.set_target_window(new_target)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = "Split " .. direction
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, "<C-s>", "belowright vertical")
          map_split(buf_id, "<C-x>", "belowright horizontal")
        end,
      })

      vim.keymap.set("n", "-", function()
        toggle()
        files.reveal_cwd()
      end, { desc = "Open directory" })
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local gen_spec = require("mini.ai").gen_spec

      return {
        custom_textobjects = {
          a = gen_spec.argument {
            brackets = { "%b()", "%b[]", "%b{}", "%b<>", "%b||" },
            separators = "%s*[,;]%s*",
          },
          c = gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          f = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          o = gen_spec.treesitter({
            a = { "@block.outer", "@loop.outer", "@conditional.outer" },
            i = { "@block.inner", "@loop.inner", "@conditional.inner" },
          }, {}),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^.->().*()</[^/]->$" },
        },
        n_lines = 500,
        -- search_method = "cover",
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)

      -- Register mini.ai keys in which-key
      local i = {
        [" "] = "Whitespace",
        ['"'] = 'Balanced "',
        ["'"] = "Balanced '",
        ["`"] = "Balanced `",
        ["("] = "Balanced (",
        ["["] = "Balanced [",
        ["{"] = "Balanced {",
        ["<lt>"] = "Balanced <",
        [")"] = "Balanced ) including white-space",
        ["}"] = "Balanced } including white-space",
        ["]"] = "Balanced ] including white-space",
        [">"] = "Balanced > including white-space",
        ["?"] = "User Prompt",
        _ = "Underscope",
        a = "Argument",
        b = "Balanced ) ] }",
        c = "Class",
        f = "Function",
        o = "Block, conditional, loop",
        q = "Quote `, \", '",
        t = "Tag",
      }

      local a = vim.deepcopy(i)
      for k, v in pairs(a) do
        a[k] = v:gsub(" including.*", "")
      end

      local ic = vim.deepcopy(i)
      local ac = vim.deepcopy(a)

      for key, name in pairs { n = "Next", l = "Last" } do
        i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
        a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesWindowOpen",
        callback = function(args)
          local win_id = args.data.win_id

          -- Customize window-local settings
          -- vim.wo[win_id].winblend = 10
          local config = vim.api.nvim_win_get_config(win_id)
          config.border = "solid"
          vim.api.nvim_win_set_config(win_id, config)
        end,
      })

      -- require("which-key").register(i, { mode = { "o", "x" }, i = i, a = a })
    end,
  },
}
