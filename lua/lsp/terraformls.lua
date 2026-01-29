vim.lsp.config("terraformls", {
    filetypes = { "tf", "terraform", "terraform-vars" },
    root_markers = { ".terraform", ".git" },
})
