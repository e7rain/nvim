require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- resize windows
map({ "n", "t" }, "<c-left>", require("smart-splits").resize_left)
map({ "n", "t" }, "<c-down>", require("smart-splits").resize_down)
map({ "n", "t" }, "<c-up>", require("smart-splits").resize_up)
map({ "n", "t" }, "<c-right>", require("smart-splits").resize_right)
-- moving between splits
map("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move left window" })
map("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move down window" })
map("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move up window" })
map("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move right window" })
map("n", "<C-[>", require("smart-splits").move_cursor_previous, { desc = "Move preview window" })

-- telescope
map("n", "<leader>fF", function()
  require("telescope.builtin").find_files { hidden = true, no_ignore = true }
end, { desc = "Find all files" })
map("n", "<leader>fa", function()
  require("telescope.builtin").find_files {
    prompt_title = "Config File Nvim",
    cwd = vim.fn.stdpath "config",
    follow = true,
  }
end, { desc = "Find config files nvim" })

map("n", "<leader>o", "<cmd>Oil --float<cr>", { desc = "Oil 🖿" })

-- Test
map("n", "<leader>tt", require("neotest").run.run, { desc = "Run test" })
map("n", "<leader>td", function()
  require("neotest").run.run { strategy = "dap" }
end, { desc = "Debug test" })
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run all test file" })
map("n", "<leader>ts", require("neotest").summary.toggle, { desc = "Summary test" })
map("n", "<leader>tp", require("neotest").output.open, { desc = "Preview test" })
map("n", "<leader>tP", require("neotest").output_panel.toggle, { desc = "Preview all test" })
map("n", "[t", require("neotest").jump.prev, { desc = "Jump prev test" })
map("n", "]t", require("neotest").jump.next, { desc = "Jump next test" })

map("n", "<leader>gg", "<cmd>Git<cr>", { desc = "Git" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branchs" })
map("n", "<leader>gp", require("gitsigns").preview_hunk_inline, { desc = "preview hunk inline" })
map("n", "<leader>gP", require("gitsigns").preview_hunk, { desc = "preview hunk" })
map("n", "<leader>gd", "<cmd>Gvdiff<cr>", { desc = "Git diff" })

-- Disable mappings
nomap("n", "<leader>rn")
nomap("n", "<leader>cc")
nomap("n", "<leader>ch")
nomap("n", "<leader>cm")

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- Toggles
map("n", "<leader>un", function()
  require("toggles").number()
end, { desc = "Toggle numbers" })
map("n", "<leader>us", function()
  require("toggles").spell()
end, { desc = "Toggle spell" })
map("n", "<leader>uw", function()
  require("toggles").wrap()
end, { desc = "Toggle spell" })
map("n", "<leader>up", function()
  require("toggles").autopairs()
end, { desc = "Toggle autopair" })

map("n", "<leader>q", "<cmd>q!<cr>", { desc = "Quit window" })
map("t", "<esc>", "<C-\\><C-n>")

-- Pegado especial
vim.keymap.set("n", "<leader>p", function()
  local val = vim.fn.getreg "+"
  vim.api.nvim_command [[normal! p]]
  vim.fn.setreg("+", val)
end, { desc = "Paste 📋" })
