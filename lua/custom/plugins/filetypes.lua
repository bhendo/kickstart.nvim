-- Filetype registrations Neovim doesn't ship by default.
--
-- gotmpl: Go templates (Helm charts, k8s manifests, Hugo). gopls advertises
-- support but Neovim has no built-in detection rule, so :checkhealth gopls
-- warns about the unknown filetype.

vim.filetype.add {
  extension = {
    gotmpl = 'gotmpl',
    tpl = 'gotmpl',
  },
}
