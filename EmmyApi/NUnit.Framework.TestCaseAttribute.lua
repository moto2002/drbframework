﻿---@class TestCaseAttribute : NUnitAttribute
---@field public TestName string
---@field public RunState number
---@field public Arguments Object[]
---@field public Properties IPropertyBag
---@field public ExpectedResult Object
---@field public HasExpectedResult bool
---@field public Description string
---@field public Author string
---@field public TestOf Type
---@field public Ignore string
---@field public Explicit bool
---@field public Reason string
---@field public IgnoreReason string
---@field public IncludePlatform string
---@field public ExcludePlatform string
---@field public Category string
---@public
---@param method IMethodInfo
---@param suite Test
---@return IEnumerable`1
function TestCaseAttribute:BuildFrom(method, suite) end
