vim.opt.tabstop = 2
vim.opt.expandtab = true -- Convert tabs to spaces

-- remapping the ci and di behaviour
vim.keymap.set('n', "ci'", '"_ci\'', { noremap = true })
vim.keymap.set('n', "di'", '"_di\'', { noremap = true })
