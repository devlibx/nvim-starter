return {
  -- Rust tolling
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
    config = function()
      local mason_registry = require('mason-registry')
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      local cfg = require('rustaceanvim.config')

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  },

  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- local dap_config = require('configs.dap-config')

      -- Listener before an event occurs
      --dap.listeners.before['event_initialized'] = function()
      --  print("Debugger is initializing...")
      -- dap_config.set_debug_keys()
      --end

      vim.fn.sign_define('DapBreakpoint', {
        text = '●', -- Replace this with an appropriate icon or symbol
        texthl = 'DapBreakpoint',
        linehl = '',
        numhl = ''
      })
      vim.cmd [[highlight DapBreakpoint guifg=#FF0000 gui=bold]]

      -- Define the current line marker with the red highlight
      vim.fn.sign_define('DapCurrentLine', {
        text = '→', -- Use the arrow symbol for the current line marker
        texthl = 'DapCurrentLine', -- Use the custom highlight group
        linehl = '',
        numhl = ''
      })
      vim.cmd [[ highlight DapCurrentLine guifg=#FF0000 gui=bold]]
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  {
    'saecki/crates.nvim',
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" } }
      })
    end
  },
}
