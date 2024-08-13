require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- o.clipboard = ""

o.spell = false -- sets vim.opt.spell
o.spelllang = "es,en_us"
o.spellsuggest = "fast,5"
o.relativenumber = true
o.wrap = true

vim.filetype.add {
  filename = { ["docker-compose.yaml"] = "yaml.docker-compose", ["docker-compose.yml"] = "yaml.docker-compose" },
}

vim.filetype.add {
  extension = {
    ["http"] = "http",
  },
}

vim.opt.guifont = "Intel One Mono:w11:b:i, Symbols Nerd Font, Noto Color Emoji"
