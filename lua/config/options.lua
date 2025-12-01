vim.g.root_spec = { ".git" }

-- Auto-run Biome on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.js", "*.ts", "*.tsx", "*.jsx", "*.json", "*.astro" }, -- adjust as needed
  callback = function()
    local file_path = vim.fn.expand("%:p")
    if vim.fn.filereadable(file_path) == 0 then
      vim.notify("File not readable: " .. file_path, vim.log.levels.WARN)
      return
    end

    -- Run with output capture (non-silent for debugging)
    local cmd = { "biome", "check", "--write", file_path }
    local result = vim.system(cmd, { cwd = vim.fn.getcwd() }):wait() -- Uses project cwd

    if result.code ~= 0 then
      vim.notify(
        "Biome failed (code " .. result.code .. "):\n" .. (result.stdout or result.stderr or "No output"),
        vim.log.levels.ERROR
      )
    else
      vim.notify("Biome success: " .. (result.stdout or "Fixed!"), vim.log.levels.INFO)
    end

    vim.cmd("edit!") -- Reload
  end,
})
