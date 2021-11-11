local markerPos = vector3(1693.97, 3590.6, 35.62)
local HasAlreadyGotMessage = false

Citizen.CreateThread(function()

   while true do
   local ped = GetPlayerPed(-1)	
	Citizen.Wait(0)
	local playerCoords = GetEntityCoords(ped)
	local distance = #(playerCoords - markerPos)
	local isInMarker = false	

		if distance < 5.0 then
		DrawMarker(27, markerPos.x, markerPos.y, markerPos.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 50, false, false, 2, nil, nil, false)
	    		if distance < 2.0 then
				isInMarker = true
				else
				HasAlreadyGotMessage = false
				end
		else
			Citizen.Wait(2000)
		end
	
		if isInMarker and not HasAlreadyGotMessage then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			SetVehicleDirtLevel(vehicle, 0.1)
			
			TriggerEvent('chatMessage', 'Your vehicle has been washed. Try to keep it clean.')
			HasAlreadyGotMessage = true
			Citizen.Wait(5000)
			
		end
	end
end)
