-- lazy.nvim spec for noice.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- optional, fallback to mini if not available
  },
  opts = {
    lsp = {
      -- override markdown rendering so cmp and other plugins use Treesitter
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    presets = {
      bottom_search = true,     -- use classic bottom cmdline for search
      command_palette = true,   -- position cmdline and popupmenu together
      long_message_to_split = true, -- send long messages to a split
      inc_rename = false,       -- disable inc-rename.nvim input dialog
      lsp_doc_border = false,   -- no border for hover/signature
    },
    routes = {
      {
        filter = {
          event = "msg_show",
        },
        opts = { skip = true }, -- block all "messages" output
      },
      {
        filter = {
          event = "msg_showmode",
        },
        opts = { skip = true }, -- block showmode like -- INSERT --
      },
      {
        filter = {
          event = "msg_ruler",
        },
        opts = { skip = true }, -- block ruler messages
      },
    },
  },
}

