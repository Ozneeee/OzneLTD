


-- ###### amélioration et débug en cour ####### --





ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--EVENTS--

RegisterServerEvent('burger:pourboire') AddEventHandler('burger:pourboire', function(pourboire) local _source = source local xPlayer = ESX.GetPlayerFromId(_source) xPlayer.addMoney(pourboire) end) RegisterServerEvent("burger:paiefinale") AddEventHandler("burger:paiefinale", function() local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local flouzefin = math.random(10, 100) xPlayer.addMoney(flouzefin) TriggerClientEvent("pNotify:SendNotification", source, { text = "Voici votre petit bonus final : " .. flouzefin .. "$", type = "success", queue = "global", timeout = 4000, layout = "bottomRight" }) end) RegisterServerEvent("burger:itemadd") AddEventHandler("burger:itemadd", function(nbburger) local _source = source local xPlayer = ESX.GetPlayerFromId(_source) xPlayer.addInventoryItem('burger', tonumber(nbburger)) end) RegisterServerEvent("burger:itemrm") AddEventHandler("burger:itemrm", function() local _source = source local xPlayer = ESX.GetPlayerFromId(_source) xPlayer.removeInventoryItem('burger', 1) end) RegisterServerEvent("burger:deleteAllBurger") AddEventHandler("burger:deleteAllBurger", function() local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local burgernbr = xPlayer.getInventoryItem('burger').count xPlayer.removeInventoryItem('burger', burgernbr) end)