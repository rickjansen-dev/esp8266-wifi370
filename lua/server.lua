   -- create a server
    sv=net.createServer(net.TCP, 60)    -- 30s time out for a inactive client
    -- server listen on 80, if data received, print data to console, and send "hello world" to remote.
    sv:listen(5577, function(c)
      c:on("receive", function(c, pl) 
            if ((string.byte( pl, 1) == 239) and
                (string.byte( pl, 2) == 001) and
                (string.byte( pl, 3) == 119)) then
                -- reply with status                  
                c:send("\001\001\035\001\001\001" .. wanted_r .. wanted_g .. wanted_b .."\009")
            elseif ((string.byte(pl, 1) == 204) and
                    (string.byte(pl, 3) == 51)) then
                print("ONOFF: " .. string.byte(pl, 2))
                if (string.byte(pl,2) == 36) then
                    onoff = false
                    wanted_r = 0
                    wanted_g = 0
                    wanted_b = 0
                else
                    onoff = true
                end
            elseif ((string.byte( pl, 1) == 86) and
                (string.byte( pl, 5) == 170) and
                (onoff == true)) then
                -- set the wanted R,G,B values
                wanted_r = string.byte(pl, 2) * 4
                wanted_g = string.byte(pl, 3) * 4
                wanted_b = string.byte(pl, 4) * 4
                
                -- save values
                file.open("values", "w+")
                file.writeline(wanted_r)
                file.writeline(wanted_g)
                file.writeline(wanted_b)
                file.close() 
            else
                print(pl)
            end
          end)
      
      end)