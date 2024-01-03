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

vim.cmd([[
syntax on

set rnu
set number
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smarttab
set nobackup
set nowritebackup
set clipboard=unnamed " share clipboard
set autoread
set cmdheight=2
let mapleader=","
set mouse=""
set cursorline
set noswapfile
set updatetime=100

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" My shortcuts
nmap _ :NvimTreeToggle<cr>
nmap z= :Telescope spell_suggest<cr>
nmap <C-f> :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nmap <C-p> :lua require"custom.telescope".project_files()<cr>
nmap <C-l> :Telescope treesitter<cr>
nmap <leader>- :NvimTreeFindFile!<cr>
nmap <leader>f :Telescope filetypes<cr>
nmap <leader>r :luafile %<cr>
nmap <leader>c :tabe ~/.config/nvim_lazy/init.lua<cr>
nmap <leader>p :lua require'telescope'.extensions.projects.projects{}<cr>
"nmap <leader>w :WinResizerStartResize<cr> " use <C-e> instead
nmap <leader>tr :Neotest run<cr>
nmap <leader>ts :Neotest summary<cr>
nmap gsn :Gitsigns next_hunk<cr>
nmap gsp :Gitsigns preview_hunk<cr>
nmap gsr :Gitsigns reset_hunk<cr>
nmap <leader>lg :LazyGit<cr>
"command! D :DiffviewOpen
"command! Dfh :DiffviewFileHistory
"command! Dc :tabc
]])
vim.opt.termguicolors = true

require("lazy").setup('config')
require("custom.notes-scratch")
require("custom.treesitter")

