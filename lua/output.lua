pwm.setup(gpio_red, 100, r)
pwm.setup(gpio_green, 100, g)
pwm.setup(gpio_blue, 100, b)
pwm.start(gpio_red)
pwm.start(gpio_green)
pwm.start(gpio_blue)

tmr.alarm(6, 10, 1, function ()
        if (r > wanted_r) then
                r = r - 1 
                pwm.setduty(gpio_red,r)
        end
        if (r < wanted_r) then
                r = r + 1    
                pwm.setduty(gpio_red,r)     
        end
        if (g > wanted_g) then
                g = g - 1
                pwm.setduty(gpio_green,g)
        end
        if (g < wanted_g) then
                g = g + 1   
                pwm.setduty(gpio_green,g)       
        end
        if (b > wanted_b) then
                b = b - 1
                pwm.setduty(gpio_blue,b)
        end
        if (b < wanted_b) then
                b = b + 1    
                pwm.setduty(gpio_blue,b)      
        end   

end)