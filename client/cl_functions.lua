function startmihra(atm)
    exports["memorygame"]:thermiteminigame(3, 4, 5, 2,
            function() -- success
                exports["mythic_notify"]:SendAlert("success", "You got through the first stage!")
                exports["memorygame"]:thermiteminigame(3, 4, 5, 2,
                function() -- success
                    exports["mythic_notify"]:SendAlert("success", "You got through the second stage!")
                    Citizen.Wait(500)
                    exports["memorygame"]:thermiteminigame(3, 4, 5, 2,
                    function()
                        exports["mythic_notify"]:SendAlert("success", "Wait for the money!")
                        Citizen.Wait(10000)
                        TriggerEvent("luci-atm:server:getcash")
                    end,
                    function() -- failure
                        exports["mythic_notify"]:SendAlert("error", "You failed the third stage!")
                    end)
                end,
                function() -- failure
                    exports["mythic_notify"]:SendAlert("error", "You failed the second stage!")
                end)
            end,
            function() -- failure
                exports["mythic_notify"]:SendAlert("error", "You failed the first stage!")
    end)
end
