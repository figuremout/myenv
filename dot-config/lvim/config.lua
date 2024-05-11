--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- Original default config: ~/.local/share/lunarvim/lvim/utils/installer/config.example.lua
-- TODO PROBLEMS:
-- 解决看linux源码报错问题，直接搜 gen_compile_commands.py not work
-- Basic vim configs for both nvim and lvim
require("basic")

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua,", -- add filetypes need to auto-format here, no space
    timeout = 1000,
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- -- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.normal_mode["g/"] = ":HopPatternMW<CR>"
lvim.keys.normal_mode["<c-f>"] = ":Telescope live_grep<CR>"  -- search contents
lvim.keys.normal_mode["<c-p>"] = ":Telescope find_files<CR>" -- search filename
lvim.builtin.terminal.open_mapping = "<leader>\\"

-- -- to make it transparent, uncomment the following
-- lvim.transparent_window = true

-- -- Enable / Disable icons
-- -- to disable icons and use a minimalist setup, uncomment the following
-- -- If there are still some weird chars, need to install DroidSansMono Nerd Font
-- -- WSL: install on windows, and set terminal emulator font setting
lvim.use_icons = false
lvim.builtin.lualine.options = { section_separators = '', component_separators = '' } -- disable separators
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Core Plugins
lvim.builtin.lualine.style = "default"      -- use lualine
lvim.builtin.lualine.sections.lualine_b = { -- custom lualine component to show codeium status
    function() return "AI" .. vim.api.nvim_call_function("codeium#GetStatusString", {}) end,
}
lvim.builtin.lualine.sections.lualine_c = {
    {
        'filename',
        file_status = true,
        newfile_status = true, -- Display new file status (new file means no write after created)
        path = 3               -- 0: Just the filename 1: Relative path 2: Absolute path 3: Absolute path, with tilde as the home directory
    },
    'searchcount',
}
lvim.builtin.lualine.sections.lualine_x = {
    'encoding',
    'fileformat',
    'filetype',
    'filesize',
}

lvim.builtin.alpha.active = true -- greeter page
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.gitsigns.active = true -- show git diff sign on the sign column
lvim.builtin.gitsigns.opts.signs.add.text = '+'
lvim.builtin.gitsigns.opts.signs.change.text = '~'
lvim.builtin.gitsigns.opts.signs.delete.text = '-'
lvim.builtin.gitsigns.opts.signs.topdelete.text = '‾'
lvim.builtin.gitsigns.opts.signs.changedelete.text = '~'
lvim.builtin.telescope.active = true
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120 -- when columns less than this value, the preview will be disabled
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
lvim.builtin.telescope.defaults.layout_config.width = 0.75
lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.bufferline.options.numbers = function(opts)
    return string.format('%s', opts.raise(opts.id))
end -- show buffer id on bufferline
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<CR>", "Find Files" }

-- -- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- Ignore to install module "comment" which will hugely lag the performance in large block comments. (If already installed, exec `:TSUninstall comment`, see https://github.com/nvim-treesitter/nvim-treesitter/issues/1267)
lvim.builtin.treesitter.ignore_install = { "haskell", "comment" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_servers_installation = true

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- NOTICE: In order to lazy-load the linter/formatter/code_actions,
-- the settings have moved to $LUNARVIM_CONDIG_DIR/after/ftplugin folder

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                italic = { strings = false, comments = false, operators = false, folds = false, }, -- disable italic
                contrast = "",                                                                     -- can be "hard", "soft" or empty string
            })
            lvim.colorscheme =
            'gruvbox' -- Change theme settings
        end,
    },
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup {          -- must call setup to make hop work
                keys = 'jklfdsahguiowervn' -- my favor seq
            }
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup(
            -- { "css", "scss", "html", "javascript" },
                { "*" },
                {
                    RGB      = true,         -- #RGB hex codes
                    RRGGBB   = true,         -- #RRGGBB hex codes
                    names    = true,         -- "Name" codes like Blue
                    RRGGBBAA = true,         -- #RRGGBBAA hex codes
                    rgb_fn   = true,         -- CSS rgb() and rgba() functions
                    hsl_fn   = true,         -- CSS hsl() and hsla() functions
                    css      = true,         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn   = true,         -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Available modes: foreground, background
                    mode     = 'background', -- Set the display mode.
                }
            )
        end,
    },
    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function()
            vim.g.codeium_no_map_tab = true     -- disable tab for accept key
            vim.keymap.set('i', '<M-;>', function() return vim.fn['codeium#Accept']() end,
                { expr = true, silent = true }) -- remap accept key
        end
    }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
