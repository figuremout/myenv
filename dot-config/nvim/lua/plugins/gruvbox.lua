-- configuration for gruvbox.nvim

vim.o.background = "dark" -- or "light" for light mode

-- setup must be called before loading the colorscheme
require("gruvbox").setup({
    italic = { strings = false, comments = false, operators = false, folds = false, }, -- disable italic
    contrast = "",                                                                     -- can be "hard", "soft" or empty string
})

vim.cmd([[colorscheme gruvbox]])
