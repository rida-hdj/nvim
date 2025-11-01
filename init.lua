vim.opt.fillchars = { eob = " " }
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")
require('lspconfig')
vim.cmd([[
  autocmd BufEnter * setlocal formatoptions-=o
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=c
]])
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.cursorline = true
