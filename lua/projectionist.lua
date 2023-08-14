local M = {}

local config = {
  ["package.json"] = {
    ["*.ts"] = {
      type = "test",
      alternate = { "{}.test.ts", "{}.test.js", "{}.spec.js", "{}.spec.ts" }
    },
    ["*.tsx"] = {
      type = "src",
      alternate = { "{}.test.tsx", "{}.test.ts", "{}.test.js", "{}.spec.tsx", "{}.spec.ts", "{}.spec.js", "{}.spec.jsx" }
    },
    ["*.spec.tsx"] = {
      type = "test",
      alternate = { "{}.ts", "{}.tsx" }
    },
    ["*.spec.ts"] = {
      type = "test",
      alternate = { "{}.ts", "{}.tsx" }
    },
    ["*.test.tsx"] = {
      type = "test",
      alternate = { "{}.ts", "{}.tsx" }
    },
    ["*.test.ts"] = {
      type = "test",
      alternate = { "{}.ts", "{}.tsx" }
    },
    ["*.js"] = {
      type = "src",
      alternate = "{}.test.js"
    },
    ["*.jsx"] = {
      type = "src",
      alternate = "{}.test.js"
    },
    ["*.test.js"] = {
      type = "test",
      alternate = { "{}.js", "{}.jsx", "{}.ts", "{}.tsx" }
    },
    ["*.spec.js"] = {
      type = "test",
      alternate = { "{}.js", "{}.jsx", "{}.ts", "{}.tsx" }
    },
    ["*.py"] = {
      type = "src",
      alternate = { "{dirname}/test_{basename}.py" }
    },
    ["**/test_*.py"] = {
      type = "test",
      alternate = { "{dirname}/{basename}.py" }
    },
  }
}

function M.setup()
  local new_heuristics
  if vim.g.projectionist_heuristics then
    new_heuristics = vim.tbl_extend("force", vim.g.projectionist_heuristics, config)
  else
    new_heuristics = config
  end

  vim.g.projectionist_heuristics = new_heuristics
end

return M
