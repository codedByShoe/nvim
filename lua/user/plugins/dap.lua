return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      local pythonPath = function()
        local cwd = vim.loop.cwd()
        if vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/home/linuxbrew/.linuxbrew/bin/python3'
        end
      end

      require("dapui").setup()
      require("dap-go").setup()
      require("dap-python").setup(pythonPath())
      require("nvim-dap-virtual-text").setup({})

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { silent = true, desc = "debug toggle breakpoint" })
      vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { silent = true, desc = "debug to cursor" })

      -- Eval var under cursor
      vim.keymap.set("n", "<leader>dv", function()
        require("dapui").eval(nil, { enter = true })
      end, { silent = true, desc = "debug var under cursor" })

      vim.keymap.set("n", "<leader>dc", dap.continue, { silent = true, desc = "debug continue" })
      vim.keymap.set("n", "<leader>du", "<CMD> DapUiToggle<CR>", { silent = true, desc = "debug UI toggle" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { silent = true, desc = "debug step into" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { silent = true, desc = "debug step over" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { silent = true, desc = "debug step out" })
      vim.keymap.set("n", "<leader>dB", dap.step_back, { silent = true, desc = "debug step back" })
      vim.keymap.set("n", "<leader>dr", dap.restart, { silent = true, desc = "debug restart" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
