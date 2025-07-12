return {
  name = "ocamllsp",
  cmd = { "ocamllsp" },
  filetypes = { "ocaml", "ocaml.interface", "ocaml.menhir" },
  root_dir = vim.fs.dirname(vim.fs.find({
    "dune-project", "dune-workspace", ".git"
  }, { upward = true })[1]),
}

