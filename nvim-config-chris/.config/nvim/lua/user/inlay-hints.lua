local status_ok, inlay_hints = pcall(require, "inlay-hints")
if not status_ok then
  print("'inlay-hints' plugin not installed")
  return
end

local icons_ok, icons = pcall(require, "user.icons")
if not icons_ok then
  print("'inlay-hints -> icons' plugin not installed")
  return
end


local config = {
  --[[ renderer = "inlay-hints/render/dynamic", ]]
  only_current_line = true,
  eol = {
    -- whether to align to the extreme right or not
    right_align = false,
--
    -- padding from the right if right_align is true
    right_align_padding = 7,
--
    parameter = {
      separator = ", ",
      format = function(hints)
        return string.format(icons.ui.ArrowRight .. "  (%s)", hints)
      end,
    },
--
    type = {
      separator = ", ",
      format = function(hints)
        return string.format(" " .. icons.ui.AngleDoubleLeft .." (%s)", hints)
      end,
    },
  }
}
inlay_hints.setup(config)

-- Autogroups and AutoCommands
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end
--
    local client = vim.lsp.get_client_by_id(args.data.client_id)
--
    if client.server_capabilities.inlayHintProvider then
      -- require("lsp-inlayhints").on_attach(args.buf, client)
--
      inlay_hints.on_attach(client, args.buf)
    end
  end,
})

--[[ inlay_hints.setup {
  -- renderer to use
  -- possible options are dynamic, eol and virtline
  renderer = "inlay-hints/render/dynamic",
--
  hints = {
    parameter = {
      show = true,
      highlight = "Comment",
    },
    type = {
      show = true,
      highlight = "Comment",
    },
  },
--
  -- Only show inlay hints for the current line
  only_current_line = false,
--
  eol = {
    -- whether to align to the extreme right or not
    right_align = false,
--
    -- padding from the right if right_align is true
    right_align_padding = 7,
--
    parameter = {
      separator = ", ",
      format = function(hints)
        return string.format(" <- (%s)", hints)
      end,
    },
--
    type = {
      separator = ", ",
      format = function(hints)
        return string.format(" » (%s)", hints)
      end,
    },
  },
} ]]

