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
vim.opt.termguicolors = true

require("lazy").setup('plugins')

require("custom.treesitter")

vim.cmd ([[
" always open help in vsplit 
autocmd FileType help wincmd L

" https://www.reddit.com/r/vim/comments/j9fijy/how_to_disable_showing_for_empty_line_in_difftool/
hi DiffDelete guibg=#514251 guifg=#514251
]])
