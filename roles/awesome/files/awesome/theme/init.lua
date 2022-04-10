---------------------------
-- Default awesome theme --
---------------------------

local function merge(v)
    local r = {}
    for _,t in pairs(v) do
        for k,v in pairs(t) do
            r[k] = v
        end
    end
    return r
end

local v = {
    require("theme.general"),
    require("theme.menu"),
    require("theme.notifications"),
    -- require("theme.titlebar"),
    require("theme.bar"),
    require("theme.layouts")
}

return merge(v)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
