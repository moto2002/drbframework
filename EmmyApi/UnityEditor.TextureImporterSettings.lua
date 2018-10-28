﻿---@class TextureImporterSettings
---@field public textureType number
---@field public textureShape number
---@field public mipmapFilter number
---@field public mipmapEnabled bool
---@field public generateMipsInLinearSpace bool
---@field public sRGBTexture bool
---@field public fadeOut bool
---@field public borderMipmap bool
---@field public mipMapsPreserveCoverage bool
---@field public alphaTestReferenceValue number
---@field public mipmapFadeDistanceStart number
---@field public mipmapFadeDistanceEnd number
---@field public convertToNormalMap bool
---@field public heightmapScale number
---@field public normalMapFilter number
---@field public alphaSource number
---@field public singleChannelComponent number
---@field public readable bool
---@field public streamingMipmaps bool
---@field public streamingMipmapsPriority number
---@field public npotScale number
---@field public generateCubemap number
---@field public cubemapConvolution number
---@field public seamlessCubemap bool
---@field public filterMode number
---@field public aniso number
---@field public mipmapBias number
---@field public wrapMode number
---@field public wrapModeU number
---@field public wrapModeV number
---@field public wrapModeW number
---@field public alphaIsTransparency bool
---@field public spriteMode number
---@field public spritePixelsPerUnit number
---@field public spritePixelsToUnits number
---@field public spriteTessellationDetail number
---@field public spriteExtrude number
---@field public spriteMeshType number
---@field public spriteAlignment number
---@field public spritePivot Vector2
---@field public spriteBorder Vector4
---@field public spriteGenerateFallbackPhysicsShape bool
---@field public linearTexture bool
---@field public normalMap bool
---@field public textureFormat number
---@field public maxTextureSize number
---@field public lightmap bool
---@field public rgbm number
---@field public grayscaleToAlpha bool
---@field public cubemapConvolutionSteps number
---@field public cubemapConvolutionExponent number
---@field public compressionQuality number
---@public
---@param a TextureImporterSettings
---@param b TextureImporterSettings
---@return bool
function TextureImporterSettings.Equal(a, b) end
---@public
---@param target TextureImporterSettings
---@return void
function TextureImporterSettings:CopyTo(target) end
---@public
---@param type number
---@param applyAll bool
---@return void
function TextureImporterSettings:ApplyTextureType(type, applyAll) end
---@public
---@param type number
---@return void
function TextureImporterSettings:ApplyTextureType(type) end
