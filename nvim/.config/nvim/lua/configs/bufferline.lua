local status_ok, bufferline = pcall(require, "bufferline")
if status_ok then
  bufferline.setup(astronvim.user_plugin_opts("plugins.bufferline", {
    options = {
      offsets = {
        { filetype = "NvimTree", text = "", padding = 1 },
        { filetype = "neo-tree", text = "", padding = 1 },
        { filetype = "Outline", text = "", padding = 1 },
      },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      separator_style = "thick",
      diagnostics = "nvim_lsp",
      show_close_icon = false,
      right_mouse_command = nil,
      middle_mouse_command = nil,
      left_mouse_command = nil,
    },
  }))
end
