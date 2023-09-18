local status, tabby = pcall(require, 'tabby.tabline')

if (not status) then return end

-- Colors
local primary_color = '#00abab'
local accent_color = '#3b3537'

-- Background colors
local main_bg = '#15141b'
local active_bg = accent_color
local inactive_bg = main_bg

-- Font colors
local main_fg = '#000000'
local active_fg = primary_color
local inactive_fg = accent_color

local theme = {
  fill = { bg = main_bg },

  head = { fg = main_fg, bg = primary_color, style = 'bold' },
  tail = { fg = main_fg, bg = primary_color, style = 'bold' },

  tab = {
    active = { fg = active_fg, bg = active_bg },
    inactive = { fg = inactive_fg, bg = inactive_bg },
  },

  left_sep = {
    active = {
      hl = { bg = inactive_bg },
      back_hl = { bg = active_bg },
    },
    inactive = {
      hl = { bg = inactive_bg },
      back_hl = { bg = inactive_bg },
    },
  },
  right_sep = {
    active = {
      hl = { bg = active_bg },
      back_hl = { bg = inactive_bg },
    },
    inactive = {
      hl = { bg = inactive_bg },
      back_hl = { bg = inactive_bg },
    },
  },
}

local getCurrentTubNumber = function(tabs)
  local currentTabNumber = 1
  tabs.foreach(function(tab)
    if (tab.is_current()) then
      currentTabNumber = tab.number()
    end
  end)
  return currentTabNumber
end

local getTabsCount = function(tabs)
  local count = 0
  tabs.foreach(function(_)
    count = count + 1
  end)
  return count
end

tabby.set(function(line)
  return {
    {
      { ' Tabs ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      return {
        line.sep(
          '',
          tab.is_current() and theme.left_sep.active.hl or theme.left_sep.inactive.hl,
          tab.is_current() and theme.left_sep.active.back_hl or theme.left_sep.inactive.back_hl
        ),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
        tab.close_btn(''),
        line.sep(
          '',
          tab.is_current() and theme.right_sep.active.hl or theme.right_sep.inactive.hl,
          tab.is_current() and theme.right_sep.active.back_hl or theme.right_sep.inactive.back_hl
        ),
        hl = tab.is_current() and theme.tab.active or theme.tab.inactive,
        margin = ' ',
      }
    end),
    line.spacer(),
    {
      line.sep('', theme.tail, theme.fill),
      { ' ' .. getCurrentTubNumber(line.tabs()) .. '/' .. getTabsCount(line.tabs()) .. ' ', hl = theme.tail },
    },
  }
end)
