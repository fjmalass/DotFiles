local status_ok, markdown = pcall(require, "markdown-preview")
if not status_ok then
  return
end

markdown.setup()


