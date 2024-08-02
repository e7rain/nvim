-- lazy.nvim example:
return {
  {
    "tim-harding/neophyte",
    tag = "0.3.0",
    event = "VeryLazy",
    opts = {
      fonts = {
        {
          name = "Cascadia Code PL",
          features = {
            {
              name = "calt",
              value = 1,
            },
            -- Shorthand to set a feature to 1
            "ss01",
            "ss02",
          },
        },
        -- Fallback fonts
        {
          name = "Monaspace Radon",
          -- Variable font axes
          variations = {
            {
              name = "slnt",
              value = -11,
            },
          },
        },
        -- Shorthand for no features or variations
        "Symbols Nerd Font",
        "Noto Color Emoji",
      },
      font_size = {
        kind = "width", -- 'width' | 'height'
        size = 10,
      },
      -- Multipliers of the base animation speed.
      -- To disable animations, set these to large values like 1000.
      cursor_speed = 2,
      scroll_speed = 2,
      -- Increase or decrease the distance from the baseline for underlines.
      underline_offset = 1,
    },
  },
}
