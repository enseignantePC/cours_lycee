dofile("/home/astrale/Coding/lua/libs/init.lua")

local Seance = {}
local meta = {
    __index = function (k,v,z)
        error("Field " .. tostring(v) .. " Doesnt exist for class Seance")
    end,
    __newindex = function (k,v,z)
        error("Field " .. tostring(v) .. " Doesnt exist and shouldnt be set for class Seance")
    end,
}

function Seance:new(
        classe_name,
        nb_eleve,
        done_last_time,
        due_for_today,
        due_for_next_time_potentially,
        punition,
        remarque,
        creneau_retenue,
        horaire,
        programme_du_jour
        )
    local res = {
        classe_name = classe_name or error("missing name field in init of class Seance"),
        nb_eleve = nb_eleve or error("missing number field in init of class Seance"),
        horaire=horaire or error("missing horaire field in init of class Seance"),
        programme_du_jour=programme_du_jour or error("missing programme_du_jour field in init of class Seance"),
        done_last_time = done_last_time or "",
        due_for_today = due_for_today or "",
        due_for_next_time_potentially = due_for_next_time_potentially or "",
        punition = punition or "",
        remarque = remarque or "",
        creneau_retenue = creneau_retenue or "",
        first_time_this_week = true,
    }
    setmetatable(res,{
        __index = Seance,
        __newindex = Seance})
    return res
end

function Seance:dbg()
    print("classe_name is " .. tostring(   self.classe_name))
    print("nb_eleve is " .. tostring(      self.nb_eleve))
    print("done_last_time is " .. tostring(self.done_last_time))
    print("due_for_today is ".. tostring( self.due_for_today))
    print("due_for_next_time_potentially is ".. tostring(self.due_for_next_time_potentially))
    print("punition is ".. tostring(       self.punition))
    print("remarque is ".. tostring(       self.remarque))
    print("creneau_retenue is ".. tostring(self.creneau_retenue))
end

function Seance:display()
    error("Seance:display() is broken now")
    res = ""
    res = res .. tostring(self.nb_eleve) .. "Élèves" .. "\n\n" 
    res = res .. "à avoir fait: " .. self.due_for_today .. "\n\n" 
    res = res .. "La dernière fois nous avons: " .. self.done_last_time .. "\n\n" 
    res = res .. "Classe: " .. self.classe_name .. "\n\n" 
    res = res .. "\\vspace{5pt}" -- on tire un trait 
    res = res .. "Remarque: " .. self.remarque .. "\n\n" 
    res = res .. "Punitions: " .. self.punition .. "\n\n"
    res = res .. "Créneau retenue: " .. self.creneau_retenue .. "\n\n"
    res = res .. "\\vspace{5pt}" -- on tire un trait 
    res = res .. "Pour la prochaine fois? " .. self.due_for_next_time_potentially .. "\n\n" 
    res = res .. "...................." .. "\n\n" 
    return res
end

function Seance:display_as_table()
    local res
    if (self.first_time_this_week)
    then
        res =  self:_table_first_time_this_week()
    else
        res = self:_table_not_first_time_this_week()
    end
    return res
end

function Seance:_table_first_time_this_week()
    local due_for_today_table = [[
\multicolumn{3}{|l|}{\textbf{à avoir fait:} ]].. self.due_for_today .. [[}\\    
\hline  
]]
    return [[
\multicolumn{2}{|l|}{\cellcolor{Gray0}\textbf{Classe}: ]].. self.classe_name .. [[} & \multicolumn{1}{|r|}{]].. self.horaire .. [[}\\    
\hline]] .. [[
\hline
\multicolumn{2}{|l|}{]].. self.nb_eleve .. [[Élèves} & {\textbf{La dernière fois on a:} ]].. self.done_last_time .. [[}\\    
\hline
    ]] .. due_for_today_table .. [[
\textbf{Créneau retenue: }: & \multicolumn{2}{|l|} { \textbf{Punitions:} ]].. self.punition .. [[} \\
\hline
\multicolumn{1}{|l|}{]].. self.creneau_retenue .. [[} & \multicolumn{2}{|l|} { \textbf{Remarque:} ]].. self.remarque .. [[} \\    
\hline
\multicolumn{3}{|l|}{\textbf{Pour la prochaine fois?} ]].. self.due_for_next_time_potentially .. [[}\\    
\hline
\multicolumn{3}{|l|}{\textbf{Ajd nous allons :} ]].. self.programme_du_jour .. [[}\\    
\hline
\hline]]
end

function Seance:_table_not_first_time_this_week()
    return [[
\multicolumn{2}{|l|}{\cellcolor{Gray0}\textbf{Groupe}: ]].. self.classe_name .. [[} & \multicolumn{1}{|r|}{]].. self.horaire .. [[}\\    
\hline]] .. [[
\hline
\multicolumn{2}{|l|}{]].. self.nb_eleve .. [[Élèves} & {La dernière fois, voir ce que nous avons fait cette semaine.}\\    
\hline
]] .. [[
\textbf{Créneau retenue: }& \multicolumn{2}{|l|} { \textbf{Punitions:} ]].. self.punition .. [[} \\
\hline
\multicolumn{1}{|l|}{]].. self.creneau_retenue .. [[} & \multicolumn{2}{|l|} { \textbf{Remarque:} ]].. self.remarque .. [[} \\    
\hline
\multicolumn{3}{|l|}{\textbf{Pour la prochaine fois?} ...}\\
\hline
\multicolumn{3}{|l|}{\textbf{Ajd nous allons :} ... + }\\
\hline]]
end


function Seance:copy_with_horaire(horaire)
    local t = prelude.copy(self)
    t.horaire = horaire
    return t
end

function Seance:groupe_with_horaire(horaire)
    local t = prelude.copy(self)
    t.first_time_this_week = false
    t.horaire = horaire
    return t
end



function Seance:display_as_own_table()
    local res = [[
%\begin{center}
\begin{tabular}{|ll| p{16cm}|}
\hline

]]
    if (self.first_time_this_week)
    -- if (true)
    then
        res = res .. self:_table_first_time_this_week()
    else
        res = res .. self:_table_not_first_time_this_week()
    end
    res = res .. [[
\end{tabular}
%\end{center}
]]
    return res
end




setmetatable(Seance,meta)
return Seance
