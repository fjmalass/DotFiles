local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- bootstrap installation
if not vim.loop.fs_stat(lazypath) then
  -- vim.print("Installing lazy.nvim in " .. lazypath)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- vim.print("lazy.nvim installed in " .. lazypath)
