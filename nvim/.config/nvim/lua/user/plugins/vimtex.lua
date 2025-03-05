local M = {
  'lervag/vimtex',
  lazy = false,
}

function M.config()
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = 'zathura'
  end
end

return M
