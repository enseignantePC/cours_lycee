Jour = Jour or error("dependancy Jour not satisfied for class Week")


-- week classe
local Week = {}
local meta = {
    __index = function (t,k,v)
            if (tostring(k) == "lundi") 
                or (tostring(k) == "mardi")
                or (tostring(k) == "mercredi")
                or (tostring(k) == "jeudi")
                or (tostring(k) == "vendredi")
            then
                return nil
            else
                error("reached week metatable:__index with key: ".. k  .." != lundi mardi mercredi jeudi or vendredi" )
            end
    end,
    __newindex = function (t,k,v)
        error("reached week metatable:new_index with fields (k,v) : (" .. tostring(k) .. " ,"  .. tostring(v) .. ") , something is wrong")
    end,
}

function Week:new(date,is_semaine_A)
        date = date or error("called Week:new without a date arg")

        local semaine
        if is_semaine_A
        then
            semaine = "A"
        else
            semaine = "B"
        end

        local week = {
            date=date,
            semaine=semaine
        }

    setmetatable(week,
        {
        __index = Week,
        __newindex = function (t,k,v)
            if (tostring(k) ~= "lundi") 
                and (tostring(k) ~= "mardi")
                and (tostring(k) ~= "mercredi")
                and (tostring(k) ~= "jeudi")
                and (tostring(k) ~= "vendredi")
            then
                error("Field " .. tostring(k) .. " Doesnt exist and shouldnt be set for class Week")
            else
                rawset(week,k,v)
            end
        end,
        })
    return week
end


--  return a string
function Week:display()
    local res = ""
    for k,v in ipairs({"lundi","mardi","mercredi","jeudi","vendredi"})
    do
        if (self[v] ~= nil)
        then
            res = res .. self[v].day_name  .. "\n\n"  
            for k,seance in ipairs(self[v])
            do    
                res = res .. seance:display()
            end
            res = res .. "\\newpage" .. "\n\n" 
        end
    end
    return res
end





function Week:display_as_table()
    local semaine_label = "Semaine " .. self.semaine
    local function before_each_day(self,key)
        return [[\multicolumn{3}{|c|}{\cellcolor{Gray0}\LARGE\textbf{]].. self[key].day_name  .. [[}}\\]]
    end
    local res = ""
    -- start of table
    res = res .. [[
\begin{center}
\begin{longtable}{|ll| p{14cm}|}
\hline
\multicolumn{1}{|c|}{\cellcolor{Gray0!50!black}]] .. semaine_label ..  [[} &
\multicolumn{2}{|c|}{\cellcolor{Gray0!70!black}\Large\textbf{Semaine du ]] .. self.date .. [[}}\\
\hline
    ]]
    -- for each day, if not null
    -- print("for")
    for k,v in ipairs({"lundi","mardi","mercredi","jeudi","vendredi"})
    do
        -- print(k,v,"k,v do")
        -- print("if (self[v] ~= nil) : ",self[v], "~=", nil," : ",(self[v] ~= nil))
        if (self[v] ~= nil)
        then
            -- print("then")
            -- res = res .. [[\vspace{0cm}]]
            res = res .. before_each_day(self,v)
        for k,seance in ipairs(self[v])
            do    
                res = res .. seance:display_as_table()
            end
        end
    end
    -- end table
    res = res .. [[
    \end{longtable}
    \end{center}]]
    return res
end

function Week:display_as_multiple_tables()
    local semaine_label = "Semaine " .. self.semaine

    res = [[
\setlength{\arrayrulewidth}{1mm}
\renewcommand{\arraystretch}{1}
\arrayrulecolor{red!50!orange!80!black}

\begin{center}
    \begin{tabular}{|ll| p{16cm}|}
        \hline
        \multicolumn{1}{|c|}{\cellcolor{Gray0!50!black}]] .. semaine_label ..  [[} &
        \multicolumn{2}{|c|}{\cellcolor{Gray0!70!black}\Large\textbf{Semaine du ]] .. self.date .. [[}}\\
        \hline
    \end{tabular}

    \setlength{\arrayrulewidth}{0.75mm}
    \renewcommand{\arraystretch}{0.9}
    \arrayrulecolor{blue!50!orange!80!black}


]]
    -- for each day, if not null
    for k,v in ipairs({"lundi","mardi","mercredi","jeudi","vendredi"})
    do
        if (self[v] ~= nil)
        then
            -- res = res .. [[\vspace{0cm}]]
            -- res = res .. before_each_day(self,v)
            res = res .. "\n {\\Large \\textbf{" .. v .. "}}\n"  
        for k,seance in ipairs(self[v])
            do  
                res = res .. seance:display_as_own_table()
            end
        end
    end
    res = res .. [[\end{center}]]
    return res
end


function Week:from_classe_list(classe_list, date, is_semaine_A)
    classe_list = classe_list or error("called Week:from_classe_list without arg classe_list")
    date = date or error("called Week:from_classe_list without arg date")
    local week = Week:new(date,is_semaine_A)
    
    local lundi = Jour:new("Lundi")
    lundi:insert(classe_list._6G)
    lundi:insert(classe_list._5F)
    lundi:insert(classe_list._5C)
    lundi:insert(classe_list._5G)
    lundi:insert(classe_list._5D)
    lundi:insert(classe_list._6A)
    if (is_semaine_A)
    then
        local mardi = Jour:new("Mardi")
        mardi:insert(classe_list._6D) 
        mardi:insert(classe_list._5G:groupe_with_horaire("15h55 et 17h05")) 

        local mercredi = Jour:new("Mercredi")
        mercredi:insert(classe_list._5H)
        mercredi:insert(classe_list._6B) 
        mercredi:insert(classe_list._6H) 
            
        local jeudi = Jour:new("Jeudi")
        jeudi:insert(classe_list._5F:groupe_with_horaire("14h55 et 15h55"))
    
        local vendredi = Jour:new("Vendredi")
        vendredi:insert(classe_list._6E)
        vendredi:insert(classe_list._5C:groupe_with_horaire("15h55 et 17h05"))
            
        week.lundi = lundi
        week.mardi = mardi
        week.mercredi = mercredi
        week.jeudi = jeudi
        week.vendredi = vendredi
    else
        -- semaineB
        local mercredi = Jour:new("Mercredi")
        mercredi:insert(classe_list._6B:copy_with_horaire("9h15"))
        mercredi:insert(classe_list._5H)
        mercredi:insert(classe_list._6D:copy_with_horaire("11h25"))
        mercredi:insert(classe_list._6H)

        local vendredi = Jour:new("Vendredi")
        vendredi:insert(classe_list._5H:groupe_with_horaire("11h25 et 12h25")) 
        vendredi:insert(classe_list._6E) 
        vendredi:insert(classe_list._5D:groupe_with_horaire("15h55 et 17h05")) 
        week.lundi=lundi
        week.mercredi=mercredi
        week.vendredi=vendredi
    end
    return week
end


setmetatable(Week,meta)

return Week