-- Personal keymaps that don't belong to a specific plugin.

local function copy_path(path_type)
  local path_to_copy
  local msg_suffix

  if path_type == 'full' then
    path_to_copy = vim.fn.expand '%:p'
    msg_suffix = 'full path'
  elseif path_type == 'relative' then
    path_to_copy = vim.fn.expand '%:.'
    msg_suffix = 'relative path'
  elseif path_type == 'filename' then
    path_to_copy = vim.fn.expand '%:t'
    msg_suffix = 'filename'
  else
    print 'Invalid path type specified for copy_path'
    return
  end

  vim.fn.setreg('+', path_to_copy)
  print('Copied ' .. msg_suffix .. ' to clipboard')
end

vim.keymap.set('n', '<leader>cp', function() copy_path 'full' end, { desc = 'Copy full file path' })
vim.keymap.set('n', '<leader>cr', function() copy_path 'relative' end, { desc = 'Copy relative file path' })
vim.keymap.set('n', '<leader>cf', function() copy_path 'filename' end, { desc = 'Copy filename' })
