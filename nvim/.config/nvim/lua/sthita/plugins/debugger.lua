return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',

        -- optional
        -- 'mason-org/mason.nvim',
        -- 'jay-babu/mason-nvim-dap.nvim',

        -- Language-specific debuggers
        'leoluz/nvim-dap-go', -- Golang

        -- Shows variable values inline as virtual text
        'theHamsta/nvim-dap-virtual-text',
    },
    

       keys = {
    {
        '<leader>dc',
        function() require('dap').continue() end,
        desc = 'Debug: Start/Continue',
    },
    {
        '<leader>di',
        function() require('dap').step_into() end,
        desc = 'Debug: Step Into',
    },
    {
        '<leader>do',
        function() require('dap').step_over() end,
        desc = 'Debug: Step Over',
    },
    {
        '<leader>dO',
        function() require('dap').step_out() end,
        desc = 'Debug: Step Out',
    },
    {
        '<leader>dt',
        function() require('dap').toggle_breakpoint() end,
        desc = 'Debug: Toggle Breakpoint',
    },
    {
        '<leader>dB',
       function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end,
        desc = 'Debug: Set Conditional Breakpoint',
    },
    {
        '<leader>du',
        function() require('dapui').toggle() end,
        desc = 'Debug: Toggle UI',
    },
    {
        '<leader>dl',
        function() require('dap').run_last() end,
        desc = 'Debug: Run Last Configuration',
    },
},

   config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        -- optional
        -- require('mason-nvim-dap').setup {
        --     automatic_installation = true,
        --     handlers = {},
        --     ensure_installed = {
        --         'delve',
        --     },
        -- }

        -- Dap UI setup
         
       require('dapui').setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
      enabled = true,
      element = "controls", -- ✅ match layout above
      icons = {
      pause = "⏸",
      play = "▶",
      step_into = "⏎",
      step_over = "⏭",
      step_out = "⏮",
      step_back = "b",
      run_last = "▶▶",
      terminate = "⏹",
      disconnect = "⏏",
    },
  },
}


  -- Automatically open/close DAP UI
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Setup virtual text to show variable values inline
        require("nvim-dap-virtual-text").setup()

        require('dap-go').setup()
    end,
}
