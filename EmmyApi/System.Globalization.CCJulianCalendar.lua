﻿---@class CCJulianCalendar
---@public
---@param year number
---@return bool
function CCJulianCalendar.is_leap_year(year) end
---@public
---@param day number
---@param month number
---@param year number
---@return number
function CCJulianCalendar.fixed_from_dmy(day, month, year) end
---@public
---@param date number
---@return number
function CCJulianCalendar.year_from_fixed(date) end
---@public
---@param month Int32&
---@param year Int32&
---@param date number
---@return void
function CCJulianCalendar.my_from_fixed(month, year, date) end
---@public
---@param day Int32&
---@param month Int32&
---@param year Int32&
---@param date number
---@return void
function CCJulianCalendar.dmy_from_fixed(day, month, year, date) end
---@public
---@param date number
---@return number
function CCJulianCalendar.month_from_fixed(date) end
---@public
---@param date number
---@return number
function CCJulianCalendar.day_from_fixed(date) end
---@public
---@param dayA number
---@param monthA number
---@param yearA number
---@param dayB number
---@param monthB number
---@param yearB number
---@return number
function CCJulianCalendar.date_difference(dayA, monthA, yearA, dayB, monthB, yearB) end
---@public
---@param day number
---@param month number
---@param year number
---@return number
function CCJulianCalendar.day_number(day, month, year) end
---@public
---@param day number
---@param month number
---@param year number
---@return number
function CCJulianCalendar.days_remaining(day, month, year) end
