-- vim options
local opt = vim.opt

-- show
opt.number = true
opt.relativenumber = true
opt.signcolumn = "auto" -- show the sign column only when there is a sign to display
opt.showmode = false    -- not show mode status like -- INSERT --
opt.list = true
opt.listchars = { space = '.', tab = '>-', eol = '$', trail = '#' }
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.cursorline = true
opt.cursorcolumn = true
opt.colorcolumn = '81'
opt.wrap = true               -- wrap the line and continue to display it on the next line
opt.whichwrap = '<,>,[,],b,s' -- delete h, l to avoid moving cursor out of line limit
opt.scrolloff = 8             -- mini lines to keep above and below the cursor
opt.termguicolors = true      -- set term gui colors (most terminals support this)

-- indent
opt.tabstop = 4      -- indentation appearence length
opt.shiftwidth = 4   -- the number of spaces inserted after every tab pressed
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true

-- operation
opt.mouse = ""             -- disallow the mouse to be used in neovim
opt.clipboard = ""         -- system clipboard accessibily. DISABLE it implicitly to avoid SEVERE PERFORMANCE ISSUE!!!
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.ignorecase = true
opt.smartcase = true
opt.timeoutlen = 512 -- time to wait for a mapped sequence to complete (in milliseconds)

-- MUST keep this. Terminal will be flushed after reopening without it.
opt.hidden = true -- required to keep multiple buffers and open multiple buffers
