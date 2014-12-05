local type = type
local os = os
local awful = require("awful")

local today_format = '<span color="#535d6c" background="white">%s</span>'
local weekday_format = '<u>%s</u>'
local week_first_day = 1

module("cal")

function date(format, time)
    return os.date(format, os.time(time))
end

function attach(widget)
    local tooltip = awful.tooltip({})
    local now
    function tooltip:update(delta)
        if type(delta) == 'number' then
            now.month = now.month + delta
        else
            now = os.date('*t')
        end
        now.day = 1
        now = date('*t', now)
        local month = now.month
        local month_year = date('%B %Y', now)
        local weekdays = ' '
        local days = ''
        now.day = now.day - (now.wday - week_first_day) % 7
        now = date('*t', now)
        while (month - now.month) % 12 <= 1 do
            if weekdays:len() < 20 then weekdays = weekdays .. date('%a', now):sub(0,2) .. ' ' end
            if now.wday == week_first_day then days = days .. '\n ' end
            local day = now.month == month and date('%e', now) or '  '
            if os.date('%Y%m%d') == date('%Y%m%d', now) then day = today_format:format(day) end
            days = days .. day .. ' '
            now.day = now.day + 1
            now = date('*t', now)
        end
        now.month = now.month - 1
        now = date('*t', now)
        month_year = (' '):rep((22 - month_year:len()) / 2) .. month_year
        weekdays = weekday_format:format(weekdays)
        tooltip:set_text('<tt>' .. month_year .. '\n' .. weekdays .. days .. '\n</tt>')
    end
    widget:add_signal("mouse::enter", tooltip.update)
    tooltip:add_to_object(widget)
    widget:buttons(awful.util.table.join(
        awful.button({ }, 4, function() tooltip:update(-1) end),
        awful.button({ }, 5, function() tooltip:update(1)  end),
        awful.button({ 'Shift' }, 4, function() tooltip:update(-12) end),
        awful.button({ 'Shift' }, 5, function() tooltip:update(12)  end))
    )
end
