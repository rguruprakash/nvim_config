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
let mapleader=","
set mouse=""
set cursorline
set noswapfile
set updatetime=100

" fugitive
let g:github_enterprise_urls = ['https://github.bus.zalan.do']

" My shortcuts
" cnoremap h vert bo help
nmap _ :NvimTreeToggle<cr>
nmap z= :Telescope spell_suggest<cr>
nmap <C-f> :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nmap <C-p> :lua require"custom.telescope".project_files()<cr>
nmap <C-l> :Telescope treesitter<cr>
nmap <C-h> :Telescope help_tags<cr>
nmap <leader>- :NvimTreeFindFile!<cr>
nmap <leader>f :Telescope filetypes<cr>
nmap <leader>r :luafile %<cr>
nmap <leader>c :e ~/.config/nvim/lua/plugins/init.lua<cr>
nmap <leader>p :lua require'telescope'.extensions.projects.projects{}<cr>
nmap <leader>tr :Neotest run<cr>
nmap <leader>ts :Neotest summary toggle<cr>
nmap <leader>nh :Telescope noice<cr>
nmap gsn :Gitsigns next_hunk<cr>
nmap gsp :Gitsigns preview_hunk<cr>
nmap gsr :Gitsigns reset_hunk<cr>
nmap <leader>lg :LazyGit<cr>
nmap <leader>ass :Autosession search<cr>
"command! D :DiffviewOpen
"command! Dfh :DiffviewFileHistory
"command! Dc :tabc

autocmd FileType help wincmd L
]])

-- Move line blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor on middle when scrolling
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor on middle when searching
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- paste without losing what was in the register
-- vim.keymap.set("x", "<space>p", "\"_dP")

-- Find and replace text under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

return {
  "simeji/winresizer",
  "mg979/vim-visual-multi",
  "tpope/vim-commentary",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "nvim-lua/plenary.nvim",
  "tpope/vim-surround",
  "nvim-treesitter/nvim-treesitter",
  "easymotion/vim-easymotion",
  "mbbill/undotree",
  -- {
  --   "m4xshen/hardtime.nvim",
  --   config = function()
  --     require("hardtime").setup()
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- "github/copilot.vim",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({ --[[ your config ]]
      })
    end,
  },
}
