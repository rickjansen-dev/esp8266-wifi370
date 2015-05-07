gpio_red = 6
gpio_green = 7
gpio_blue = 5

onoff = true

-- r,g,b contain the actual current PWM values
r = 1023
g = 1023
b = 1023

-- wanted_r, wanted_g, wanted_b contain the PWM values 
-- that we want and should move to over time
wanted_r = 1023
wanted_g = 1023
wanted_b = 1023 

opened = file.open("values","r")
if (opened) then
    wanted_r = tonumber(file.readline())
    wanted_g = tonumber(file.readline())
    wanted_b = tonumber(file.readline())
    file.close()
end

dofile("output.lua")
dofile("server.lua")