return {
  { import = "astrocommunity.completion.copilot-lua" },
  {
    -- GitHub Copilot 使用 OpenAI Codex 在 直接从您的编辑器实时访问。在数十亿条公共线路上接受培训 代码，GitHub Copilot 会启用自
    -- 然语言提示，包括注释和 方法名称转换为数十种语言的编码建议
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 150,
        keymap = {
          accept = "<C-;>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
  },
}
