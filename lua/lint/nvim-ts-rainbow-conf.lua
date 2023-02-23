require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    --max_file_lines = nil, -- Do not enable for files with more than n lines, int
            colors = {
                "#cc241d",
                "#a89984",
                "#b16286",
                "#d79921",
                "#689d6a",
                "#d65d0e",
                "#458588",
            },
            termcolors = {
                "Red",
                "Green",
                "Yellow",
                "Blue",
                "Magenta",
                "Cyan",
                "White",
            },
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
--((()((()(()(()())))())))
