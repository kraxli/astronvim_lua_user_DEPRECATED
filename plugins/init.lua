return function(plugins)
  local my_plugins = {
    {
      "EdenEast/nightfox.nvim",
      config = function()
        require("nightfox").setup(require "user.plugins.nightfox")
      end,
    },
    { "andymass/vim-matchup" },
    {
      "danymat/neogen",
      module = "neogen",
      cmd = "Neogen",
      config = function()
        require("neogen").setup(require "user.plugins.neogen")
      end,
      requires = "nvim-treesitter/nvim-treesitter",
    },
    {
      "dhruvasagar/vim-table-mode",
      cmd = "TableModeToggle",
      config = function()
        vim.g.table_mode_corner = "|"
      end,
    },
    {
      "ellisonleao/glow.nvim",
      cmd = "Glow",
      config = function()
        vim.g.glow_border = "rounded"
      end,
    },
    {
      "ethanholz/nvim-lastplace",
      config = function()
        require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
      end,
    },
    {
      "folke/zen-mode.nvim",
      cmd = "ZenMode",
      config = function()
        require("zen-mode").setup(require "user.plugins.zen-mode")
      end,
    },
    { "glts/vim-textobj-comment" },
    {
      "hrsh7th/cmp-calc",
      after = "nvim-cmp",
      config = function()
        require("core.utils").add_cmp_source "calc"
      end,
    },
    {
      "hrsh7th/cmp-emoji",
      after = "nvim-cmp",
      config = function()
        require("core.utils").add_cmp_source "emoji"
      end,
    },
    { "jbyuki/nabla.nvim", module = "nabla" },
    {
      "jc-doyle/cmp-pandoc-references",
      after = "nvim-cmp",
      config = function()
        require("core.utils").add_cmp_source "pandoc_references"
      end,
    },
    { "kana/vim-textobj-indent" },
    { "kana/vim-textobj-line" },
    { "kana/vim-textobj-user" },
    {
      "kdheepak/cmp-latex-symbols",
      after = "nvim-cmp",
      config = function()
        require("core.utils").add_cmp_source "latex_symbols"
      end,
    },
    { "machakann/vim-sandwich" },
    {
      "mfussenegger/nvim-dap",
      module = "dap",
      config = function()
        local dap = require "dap"
        dap.adapters.python = {
          type = "executable",
          command = "/usr/bin/python",
          args = { "-m", "debugpy.adapter" },
        }
        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch file",

            program = "${file}",
            pythonPath = function()
              return "python"
            end,
          },
        }
      end,
    },
    {
      "mickael-menu/zk-nvim",
      module = { "zk", "zk.commands" },
      config = function()
        require("zk").setup(require "user.plugins.zk")
      end,
    },
    {
      "mrjones2014/smart-splits.nvim",
      module = "smart-splits",
    },
    {
      "mtikekar/nvim-send-to-term",
      cmd = "SendHere",
      config = function()
        vim.g.send_disable_mapping = true
      end,
    },
    { "nanotee/sqls.nvim" },
    {
      "phaazon/hop.nvim",
      branch = "v1",
      config = function()
        require("hop").setup()
      end,
    },
    {
      "preservim/vim-markdown",
      config = function()
        vim.g.vim_markdown_auto_insert_bullets = false
        vim.g.vim_markdown_new_list_item_indent = 0
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = function()
        local dap, dapui = require "dap", require "dapui"
        dapui.setup(require "user.plugins.dapui")
        -- add listeners to auto open DAP UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    { "sheerun/vim-polyglot" },
    { "skywind3000/asyncrun.vim" },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    {
      "nvim-telescope/telescope-bibtex.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "bibtex"
      end,
    },
    {
      "nvim-telescope/telescope-hop.nvim",
    },
    {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "media_files"
      end,
    },
    {
      "nvim-telescope/telescope-project.nvim",
      after = "telescope.nvim",
      config = function()
        require("telescope").load_extension "project"
      end,
    },
    {
      "vitalk/vim-simple-todo",
      config = function()
        vim.g.simple_todo_map_keys = false
      end,
    },
    { "wakatime/vim-wakatime" },
  }

  -- Disabled Default Plugins
  plugins["glepnir/dashboard-nvim"] = nil
  plugins["karb94/neoscroll.nvim"] = nil
  plugins["max397574/better-escape.nvim"] = nil

  -- Disabled Default Lazy Loading
  plugins["akinsho/nvim-toggleterm.lua"]["cmd"] = nil
  plugins["kyazdani42/nvim-tree.lua"]["cmd"] = nil

  -- Add Telescope loading on zk-nvim
  plugins["nvim-telescope/telescope.nvim"]["module"] = "zk"

  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
