-- A snippet to automatically install and set up packer.nvim,
-- which is provided by Bootstrapping section of README.md in packer.nvim repo
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'       -- install & manage plugins
    -- My plugins here
    use { "ellisonleao/gruvbox.nvim" } -- color theme
    -- use {
    --     'nvim-treesitter/nvim-treesitter', -- highlight & indent with language parsers
    --     run = function()
    --         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    --         ts_update()
    --     end,
    -- }
    use { -- auto complete pairs
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    --use { 'lewis6991/gitsigns.nvim' }     -- show git diff
    --use 'voldikss/vim-floaterm'           -- float terminal

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
