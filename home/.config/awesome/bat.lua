local path = '/sys/class/power_supply/'
local io = io
local math = math
local tonumber = tonumber
local tostring = tostring

module('bat')

function capacity(bat)
   local f, cap, lv
   f = io.open(path .. bat .. '/capacity')
   if f == nil then return 0 end
   cap = f:read()
   f:close()
   return tonumber(cap) or 0
end

function attach(widget)
    function update()
        local cap = math.floor((capacity('BAT0') + capacity('BAT1')) / 2)
        widget.text = tonumber(cap) .. widget.text
    end
    widget:add_signal("timeout", update)
    widget:emit_signal("timeout");
end
