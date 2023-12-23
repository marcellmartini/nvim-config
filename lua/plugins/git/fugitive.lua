local function showFugitiveGit()
  if vim.fn.FugitiveHead() ~= '' then
    vim.cmd [[
        Git
        " wincmd H  " Open Git window in vertical split
        " setlocal winfixwidth
        " vertical resize 31
        " setlocal winfixwidth
        setlocal nonumber
        setlocal norelativenumber
      ]]
  end
end

local function toggleFugitiveGit()
  -- inside a normal git repo.
  if vim.fn.buflisted(vim.fn.bufname('fugitive:///*/.git//$')) ~= 0 then
    vim.cmd [[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]]

    -- inside a .dotfile bare repo.
  elseif vim.fn.buflisted(vim.fn.bufname('fugitive:///*/.dotfiles/*//$')) ~= 0 then
    vim.cmd [[ execute ":bdelete" bufname('fugitive:///*/.dotfiles/*//$') ]]

    -- if fugitivi isn't open.
  else
    showFugitiveGit()
  end
end

return {
  'tpope/vim-fugitive',
  config = function()
    Map("n", "<leader>gp", "<cmd>Git push <CR>", { desc = '[G]it [P]ush' })
    Map("n", "<leader>gp!", "<cmd>Git push -f<CR>", { desc = '[G]it [P]ush [F]orce' })


    Map('n', '<C-g>', toggleFugitiveGit, { desc = 'Open Fugitive' })
  end
}
