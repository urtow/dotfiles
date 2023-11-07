local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local path = util.path


local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  -- for _, pattern in ipairs({'*', '.*'}) do
  --   local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
  --   if match ~= '' then
  --     return path.join(path.dirname(match), 'bin', 'python')
  --   end
  -- end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  -- This is for getting python version from env, not global one
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir)
  end
})
