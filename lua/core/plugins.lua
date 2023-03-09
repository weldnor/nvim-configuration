local ensure_packer = function()
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
vim.cmd [[packadd packer.nvim]]
return true
end
return false
end



local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- packet manager
    use 'wbthomason/packer.nvim'
    
    -- themes
    use 'ellisonleao/gruvbox.nvim'    
    use 'folke/tokyonight.nvim'

    -- highlighting 
    use 'nvim-treesitter/nvim-treesitter'

    -- completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-emoji'

    use 'jose-elias-alvarez/null-ls.nvim'

    -- lsp support
    use {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig", "glepnir/lspsaga.nvim"}

    -- search
    use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end
    })

    -- file explorer
    use {'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'}

    -- status bar 
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

    -- tabs
    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
