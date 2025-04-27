return {
  {
    "ggandor/leap.nvim",
    config = function()
      -- require("leap").create_default_mappings()
      vim.keymap.set('n', 's', '<Plug>(leap)')
      -- require('leap').opts.safe_labels = {}
      -- Or just set to grey directly, e.g. { fg = '#777777' },
      -- if Comment is saturated.
      vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    end
  }
}
