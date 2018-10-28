﻿---@class TypeDefinition : TypeReference
---@field public Attributes number
---@field public BaseType TypeReference
---@field public Name string
---@field public HasLayoutInfo bool
---@field public PackingSize number
---@field public ClassSize number
---@field public HasInterfaces bool
---@field public Interfaces Collection`1
---@field public HasNestedTypes bool
---@field public NestedTypes Collection`1
---@field public HasMethods bool
---@field public Methods Collection`1
---@field public HasFields bool
---@field public Fields Collection`1
---@field public HasEvents bool
---@field public Events Collection`1
---@field public HasProperties bool
---@field public Properties Collection`1
---@field public HasSecurityDeclarations bool
---@field public SecurityDeclarations Collection`1
---@field public HasCustomAttributes bool
---@field public CustomAttributes Collection`1
---@field public HasGenericParameters bool
---@field public GenericParameters Collection`1
---@field public IsNotPublic bool
---@field public IsPublic bool
---@field public IsNestedPublic bool
---@field public IsNestedPrivate bool
---@field public IsNestedFamily bool
---@field public IsNestedAssembly bool
---@field public IsNestedFamilyAndAssembly bool
---@field public IsNestedFamilyOrAssembly bool
---@field public IsAutoLayout bool
---@field public IsSequentialLayout bool
---@field public IsExplicitLayout bool
---@field public IsClass bool
---@field public IsInterface bool
---@field public IsAbstract bool
---@field public IsSealed bool
---@field public IsSpecialName bool
---@field public IsImport bool
---@field public IsSerializable bool
---@field public IsWindowsRuntime bool
---@field public IsAnsiClass bool
---@field public IsUnicodeClass bool
---@field public IsAutoClass bool
---@field public IsBeforeFieldInit bool
---@field public IsRuntimeSpecialName bool
---@field public HasSecurity bool
---@field public IsEnum bool
---@field public IsValueType bool
---@field public IsPrimitive bool
---@field public MetadataType number
---@field public IsDefinition bool
---@field public DeclaringType TypeDefinition
---@public
---@return TypeDefinition
function TypeDefinition:Resolve() end
