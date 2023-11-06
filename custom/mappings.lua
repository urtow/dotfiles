local M = {}

M.Dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue", opts = { silent = true } },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over", opts = { silent = true } },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into", opts = { silent = true } },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out", opts = { silent = true } },
    ["<leader>db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint", opts = { silent = true } },
    ["<leader>dB"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
      "Breakpoint Condition",
      opts = { silent = true },
    },
    ["<leader>dd"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Dap UI", opts = { silent = true } },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last", opts = { silent = true } },
  },
}

return M
