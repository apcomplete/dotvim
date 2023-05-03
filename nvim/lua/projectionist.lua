local M = {}

local config = {
  ["package.json"] = {
    ["*.ts"] = {
      type = "test",
      alternate = { "{}.test.ts", "{}.test.js" }
    },
    ["*.tsx"] = {
      type = "test",
      alternate = { "{}.test.tsx", "{}.test.ts", "{}.test.js" }
    },
    ["*.test.ts"] = {
      type = "src",
      alternate = { "{}.ts", "{}.tsx" }
    },
    ["*.js"] = {
      type = "test",
      alternate = "{}.test.js"
    },
    ["*.jsx"] = {
      type = "test",
      alternate = "{}.test.js"
    },
    ["*.test.js"] = {
      type = "src",
      alternate = { "{}.js", "{}.jsx", "{}.ts", "{}.tsx" }
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
