-- This test files prints some short examples so you can check sanity is here
-- It prints instances of seance and week classes
dofile("/home/astrale/Coding/lua/libs/init.lua")

Jour = dofile("../classes/class_jour.lua")
Seance = dofile("../classes/class_seance.lua")
Week = dofile("../classes/class_week.lua") 

local function test(func,name)
    print("------------------------------------")
    print("------------------------------------")
    print("new test : " .. name)
    print("------------------------------------")
    prelude.test(func,name)


    print("------------------------------------")
    print("------------------------------------")
end

local function simple_seance()
    return Seance:new(
        "6E", --name
        "this@nb@eleve", -- nb eleve
        "this@last@time", -- last time
        "this@for@today", -- for today
        "this@next@time", -- next_time
        "this@punition", --punition
        "this@remarque", -- remarque
        "this@creneau@retuenue", -- creneau retenue
        "this@horaire", -- horaire
        "this@prgm@du@jour" -- prgramme_du_jour
    )
end

local function simple_week()
    local w = Week:new()
    local j = Jour:new("Lundi")
    local s2 = simple_seance()
    s2.classe_name = "6B"
    table.insert(j,simple_seance())
    table.insert(j,s2)
    table.insert(j,simple_seance())
    table.insert(j,s2)
    table.insert(j,simple_seance())
    table.insert(j,s2)
    w.lundi = j
    return w
end

local function test_simple_seance_table_first_time_this_week()
    local s = simple_seance()
    print(s:_table_first_time_this_week())
end



local function test_simple_seance_as_table()
    local s = simple_seance()
    print(s:display_as_table())
end


local function test_simple_seance_as_own_table()
    local s = simple_seance()
    print(s:display_as_own_table())
end

local function test_simple_week_as_table()
    local w = simple_week()
    print(w:display_as_table("Todays date"))
end


local function test_simple_week_as_multiple_tables()
    local w = simple_week()
    print(w:display_as_multiple_tables("Today's date"))
end



-- test_simple_week_as_table()
test_simple_week_as_multiple_tables()


-- test(test_simple_seance_table_first_time_this_week,"test_simple_seance_table_first_time_this_week")
-- test(test_simple_seance_as_table,"test_simple_seance_as_table")
-- test(test_simple_seance_as_own_table,"test_simple_seance_as_own_table")
-- test(test_simple_week_as_table,"test_simple_week_as_table")
-- test(test_simple_week_as_multiple_tables,"test_simple_week_as_multiple_tables")