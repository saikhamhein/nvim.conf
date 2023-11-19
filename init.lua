local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- remapping
vim.g.mapleader = " "

-- settings
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars = "tab:🡢 ,trail:·,extends:>,precedes:<,space:·"
require("lazy").setup("plugins")
vim.cmd.colorscheme "catppuccin"

--telescope bindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--telscope extensions
require('telescope').load_extension('fzf')
