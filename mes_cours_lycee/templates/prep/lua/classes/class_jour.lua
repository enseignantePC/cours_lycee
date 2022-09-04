-- class containing, the name of the day and a list of seance that are not null
local Jour = {}
-- local meta = {
--     __index = function (k,v)
--         error("Field " .. tostring(v) .. " Doesnt exist for class Jour")
--     end
-- }

function Jour:new(
        day_name
        )
    local res = {
        day_name = day_name or error("no name set")
    }

    setmetatable(res, {
                __index = Jour,
                __newindex = function (t,k,v)
                    -- print(k,v,z)
                    if (type(k) ~= type(1))
                    then
                        -- print(k,v,z)
                        error("Field " .. tostring(k) .. " of type ".. type(k) .. " Doesnt exist and shouldnt be set for class Jour")
                    end
                    if (v == nil)
                    then
                        error("Cant insert nil element in class Jour at pos " .. tostring(k))
                    else
                        rawset(res,k,v)
                    end    
                end 
                })

    return res
end

function Jour:insert(elem)
    table.insert(self,elem)
end

setmetatable(Jour,meta)
return Jour