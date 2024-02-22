local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { command = "black", filetypes = { "python" } }, -- By default a formatter will attach to all the filetypes it supports
}
