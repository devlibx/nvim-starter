
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
        },
    },
})

-- No-op
return {}
