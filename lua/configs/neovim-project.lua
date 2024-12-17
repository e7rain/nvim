return {
  -- Project directories
  projects = {
    "~/Workspace/*",
    "~/Workspace/itg-dropshipping/packages/*",
  },
  -- Path to store history and sessions
  datapath = vim.fn.stdpath "data", -- ~/.local/share/nvim/
  -- Load the most recent session on startup if not in the project directory
  last_session_on_startup = false,
  -- Dashboard mode prevent session autoload on startup
  dashboard_mode = true,
  -- Timeout in milliseconds before trigger FileType autocmd after session load
  -- to make sure lsp servers are attached to the current buffer.
  -- Set to 0 to disable triggering FileType autocmd
  filetype_autocmd_timeout = 200,
  -- Keymap to delete project from history in Telescope picker
  forget_project_keys = {
    -- insert mode: Ctrl+d
    i = "<C-d>",
    -- normal mode: d
    n = "d",
  },
  -- Follow symbolic links in glob patterns (affects startup speed)
  -- "full" or true - follow symlinks in all matched directories
  -- "partial" - follow symlinks before any matching operators (*, ?, [])
  -- "none" or false or nil - do not follow symlinks
  follow_symlinks = "full",

  -- Overwrite some of Session Manager options
  session_manager_opts = {
    autosave_ignore_dirs = {
      vim.fn.expand "~", -- don't create a session for $HOME/
      "/tmp",
    },
    autosave_ignore_filetypes = {
      -- All buffers of these file types will be closed before the session is saved
      "gitcommit",
      "gitrebase",
      "qf",
      "toggleterm",
    },
  },
  -- Picker to use for project selection
  -- Options: "telescope", "fzf-lua"
  -- Fallback to builtin select ui if the specified picker is not available
  picker = {
    type = "telescope", -- or "fzf-lua"
    preview = {
      enabled = true, -- show directory structure in Telescope preview
      git_status = true, -- show branch name, an ahead/behind counter, and the git status of each file/folder
      git_fetch = false, -- fetch from remote, used to display the number of commits ahead/behind, requires git authorization
      show_hidden = true, -- show hidden files/folders
    },
    opts = {
      -- picker-specific options
    },
  },
}
