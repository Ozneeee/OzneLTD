ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
-- if Config.EnableESXService then
-- 	TriggerEvent('esx_service:activateService', 'burgershot', Config.MaxInService)
-- end


TriggerEvent('esx_society:registerSociety', 'burgershot', 'BurgerShot', 'society_burgershot', 'society_burgershot', 'society_burgershot', {type = 'public'})

-- Ingrédients

RegisterNetEvent('buySandwich') AddEventHandler('buySandwich', function() local _source = source local xPlayer = ESX.GetPlayerFromId(source) local price = 18 local xMoney = xPlayer.getMoney() if xMoney >= price then xPlayer.removeMoney(price) xPlayer.addInventoryItem('sandwich', 1) TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Sandwich ~w~ pour ~g~$"..price.." !") else TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!") end end) RegisterNetEvent('buyHamburger') AddEventHandler('buyHamburger', function() local _source = source local xPlayer = ESX.GetPlayerFromId(source) local price = 25 local xMoney = xPlayer.getMoney() if xMoney >= price then xPlayer.removeMoney(price) xPlayer.addInventoryItem('hamburger', 1) TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Hamburger ~w~ pour ~g~$"..price.." !") else TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!") end end)

--- Boissons

RegisterNetEvent('buyEau') AddEventHandler('buyEau', function() local _source = source local xPlayer = ESX.GetPlayerFromId(source) local price = 2 local xMoney = xPlayer.getMoney() if xMoney >= price then xPlayer.removeMoney(price) xPlayer.addInventoryItem('water', 1) TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Vitel ~w~ pour ~g~$"..price.." !") else TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!") end end) RegisterNetEvent('buyIceTea') AddEventHandler('buyIceTea', function() local _source = source local xPlayer = ESX.GetPlayerFromId(source) local price = 5 local xMoney = xPlayer.getMoney() if xMoney >= price then xPlayer.removeMoney(price) xPlayer.addInventoryItem('icetea', 1) TriggerClientEvent('esx:showNotification', source, "~g~Vous avez ~w~ reçu ~b~1x Ice Tea ~w~ pour ~g~$"..price.." !") else TriggerClientEvent('esx:showNotification', source, "~r~Il vous manque $~g~"..price-xMoney.."~w~!") end end)

-- Notification

RegisterServerEvent('AnnounceBurgershotRecrutement') AddEventHandler('AnnounceBurgershotRecrutement', function() local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local xPlayers = ESX.GetPlayers() for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD', "~r~Annonce", "Nous recrutons des personnes motiver à la Cuisine , Serveur & Livreur", 'CHAR_ANTONIA', 1) end end) 


--#####################--
--notif ouvert fermé NORD
--#####################--



RegisterServerEvent('AnnounceBurgershotOn') 
AddEventHandler('AnnounceBurgershotOn', function() 
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source) 
	local xPlayers = ESX.GetPlayers() for i=1, #xPlayers, 1 do 
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) 
	TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD NORD', "~r~Annonce", "Le LTD NORD est ~g~Ouvert~s~ !", 'CHAR_ANTONIA', 1) 
	end 
end) 


RegisterServerEvent('AnnounceBurgershotOff') 
AddEventHandler('AnnounceBurgershotOff', function() 
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source) 
	local xPlayers = ESX.GetPlayers() for i=1, #xPlayers, 1 do 
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) 
	TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD NORD', "~r~Annonce", "Le LTD NORD est ~r~Fermer~s~ !", 'CHAR_ANTONIA', 1) 
	end 
end)



--#####################--
--notif ouvert fermé SUD
--#####################--


RegisterServerEvent('AnnounceBurgershotOn2') 
AddEventHandler('AnnounceBurgershotOn2', function() 
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source) 
	local xPlayers = ESX.GetPlayers() for i=1, #xPlayers, 1 do 
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) 
	TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD SUD', "~r~Annonce", "Le LTD SUD est ~g~Ouvert~s~ !", 'CHAR_ANTONIA', 1) 
	end 
end) 


RegisterServerEvent('AnnounceBurgershotOff2') 
AddEventHandler('AnnounceBurgershotOff2', function() 
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source) 
	local xPlayers = ESX.GetPlayers() for i=1, #xPlayers, 1 do 
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) 
	TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LTD SUD', "~r~Annonce", "Le LTD SUD est ~r~Fermer~s~ !", 'CHAR_ANTONIA', 1) 
	end 
end)



-- Appelle

RegisterServerEvent('HelpPolice') AddEventHandler('HelpPolice', function(PriseOuFin) local _source = source local xPlayer = ESX.GetPlayerFromId(_source) local xPlayers = ESX.GetPlayers() for i = 1, #xPlayers, 1 do local thePlayer = ESX.GetPlayerFromId(xPlayers[i]) if thePlayer.job.name == 'police' then TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'LSPD', '~o~Demande Importante', 'Un Employer du BurgerShot à ~r~besoin d\'aide~s~ venez ~r~vite~s~ !', 'CHAR_CALL911', 8) end end end)


RegisterServerEvent('burgershot:PriseEtFinservice')
AddEventHandler('burgershot:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'burgershot' then
			TriggerClientEvent('burgershot:InfoService', xPlayers[i], _raison, name)
		end
	end
end)