local pluginConfs = require "custom.plugins.configs"

local M = {}

M.ui = {
   theme = "nord",
}

M.options = {
  user = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
  end
}

M.plugins = {
  user = {
    ["github/copilot.vim"] = {
      config = function()
      end
    },
    ["ray-x/go.nvim"] = {
      config = function()
      end
    },
    ["ruifm/gitlinker.nvim"] = {
      config = function()
        require "gitlinker".setup()
      end
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require("custom.plugins.null_ls").setup()
        end
    },
    ["nmac427/guess-indent.nvim"] = {
        config = function()
        end
    }
  },
  override = {
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  remove = {
    "windwp/nvim-autopairs"
  }
}

return M
