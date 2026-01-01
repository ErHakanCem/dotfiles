require("mactag"):setup {
    -- Keys used to add or remove tags
    keys = {
        r = "Red",
        o = "Orange",
        y = "Yellow",
        g = "Green",
        b = "Blue",
        p = "Purple",
    },
    -- Colors used to display tags
    colors = {
        Red    = "#ee7b70",
        Orange = "#f5bd5c",
        Yellow = "#fbe764",
        Green  = "#91fc87",
        Blue   = "#5fa3f8",
        Purple = "#cb88f8",
    },
}

-- Tmux integration configuration
local function is_tmux()
    return os.getenv("TMUX") ~= nil
end

local function tmux_escape_key(key)
    if is_tmux() then
        -- Handle tmux popup specific key bindings
        return key
    end
    return key
end

-- Configure for tmux popup usage
if is_tmux() then
    -- Ensure proper terminal integration
    os.execute("printf '\\033]0;yazi\\007'")
end
