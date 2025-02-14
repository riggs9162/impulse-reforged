--- Logging utilities for the gamemode.
-- @module impulse.Logs

LOG_LEVEL_ERROR = 4 --- Only print out errors.
LOG_LEVEL_WARNING = 3 --- Print out warnings and errors.
LOG_LEVEL_INFO = 2 --- Print out info, warnings, and errors.
LOG_LEVEL_DEBUG = 1 --- Print out all log levels.

impulse.Logs = impulse.Logs or {
    --- The header for all log messages. Typically the name of the gamemode.
    Header = "[impulse-reforged]",
    LogLevel = impulse.Config.LogLevel or LOG_LEVEL_INFO
}

-- Localize some functions for performance.
local MsgC = MsgC
local Color = Color

-- Colors for different log levels.
local clrInfo = Color(125, 173, 250)
local clrError = Color(255, 0, 0)
local clrWarning = Color(255, 255, 0)
local clrSuccess = Color(0, 255, 0)
local clrDatabase = Color(115, 0, 255)
local clrWhite = Color(255, 255, 255)
local clrDebug = Color(150, 150, 150)
local logHeader = impulse.Logs.Header

--- Log an Info-level message. Used for general debug messages.
-- @realm shared
-- @string text The message to log.
function impulse.Logs:Info(text)
    if ( impulse.Logs.LogLevel > LOG_LEVEL_INFO ) then return end

    MsgC(clrInfo, logHeader .. " [INFO] ", clrWhite, text, "\n")
end

--- Log a Debug-level message. Used for detailed debug messages.
-- @realm shared
-- @string text The message to log.
function impulse.Logs:Debug(text)
    if ( impulse.Logs.LogLevel > LOG_LEVEL_DEBUG ) then return end

	MsgC(clrDebug, logHeader .. " [DEBUG] ", clrWhite, text, "\n")
end

--- Log an Error-level message. Used for critical errors.
-- @realm shared
-- @string text The message to log.
function impulse.Logs:Error(text)
    if ( impulse.Logs.LogLevel > LOG_LEVEL_ERROR ) then return end

	MsgC(clrError, logHeader .. " [ERROR] ", clrWhite, text, "\n")
end

--- Log a Warning-level message. Used for non-critical errors.
-- @realm shared
-- @string text The message to log.
function impulse.Logs:Warning(text)
    if ( impulse.Logs.LogLevel > LOG_LEVEL_WARNING ) then return end

	MsgC(clrWarning, logHeader .. " [WARNING] ", clrWhite, text, "\n")
end

--- Log a Success-level message. Used for successful operations.
-- @realm shared
-- @string text The message to log.
function impulse.Logs:Success(text)
    if ( impulse.Logs.LogLevel > LOG_LEVEL_INFO ) then return end

	MsgC(clrSuccess, logHeader .. " [SUCCESS] ", clrWhite, text, "\n")
end

--- Log a Database-level message. Used for database operations.
-- @realm shared
-- @string text The message to log.
function impulse.Logs:Database(text)
    if ( impulse.Logs.LogLevel > LOG_LEVEL_INFO ) then return end

	MsgC(clrDatabase, logHeader .. " [DB] ", clrWhite, text, "\n")
end

--- A list of log levels.
-- @realm shared
-- @table LOG_LEVELS
-- @field LOG_LEVEL_ERROR Only print out errors.
-- @field LOG_LEVEL_WARNING Print out warnings and errors.
-- @field LOG_LEVEL_INFO Print out info, warnings, and errors.
-- @field LOG_LEVEL_DEBUG Print out all log levels.