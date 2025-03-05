vim.keymap.set('n', '<leader>fi', function()
  vim.lsp.buf.code_action {
    filter = function(action)
      return action.kind and action.kind:match 'source.organizeImports'
    end,
    apply = true, -- Automatically apply the first match
  }
end, { noremap = true, silent = true })
