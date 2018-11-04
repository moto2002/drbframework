﻿---@class IPInterfaceProperties
---@field public AnycastAddresses IPAddressInformationCollection
---@field public DhcpServerAddresses IPAddressCollection
---@field public DnsAddresses IPAddressCollection
---@field public DnsSuffix string
---@field public GatewayAddresses GatewayIPAddressInformationCollection
---@field public IsDnsEnabled bool
---@field public IsDynamicDnsEnabled bool
---@field public MulticastAddresses MulticastIPAddressInformationCollection
---@field public UnicastAddresses UnicastIPAddressInformationCollection
---@field public WinsServersAddresses IPAddressCollection
---@public
---@return IPv4InterfaceProperties
function IPInterfaceProperties:GetIPv4Properties() end
---@public
---@return IPv6InterfaceProperties
function IPInterfaceProperties:GetIPv6Properties() end