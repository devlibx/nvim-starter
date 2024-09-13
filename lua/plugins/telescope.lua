-- Disable file in search window
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      "%.git/objects/",
      "%.cache/",
      "%.log",
      "%.tmp",
      -- Add more patterns as needed

      -- Idea
      ".idea/",

      -- Rust
      "target/debug/"

    },
  },
})

-- No-op
return {}
