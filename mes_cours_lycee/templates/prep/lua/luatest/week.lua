-- This test files prints some short examples so you can check sanity is here
-- It prints instances of seance and week classes
dofile("/home/astrale/Coding/lua/libs/init.lua")

Jour = dofile("../classes/class_jour.lua")
Seance = dofile("../classes/class_seance.lua")
Week = dofile("../classes/class_week.lua") 


function cant_instance_new_without_date()
    local w = Week:new()
end

function can_instance_new_with_date()
    local w = Week:new("Today's date",true)
end

function can_access_non_existent_fields_if_lundi_or_mardi_etc()
    local w = Week:new("Today's date",true)
    local x = w.lundi
    local x = w.mardi
    local x = w.mercredi
    local x = w.jeudi
    local x = w.vendredi
end

function cant_access_non_existent_fields()
    local w = Week:new("Today's date",true)
    local x = w.patate
end

function can_set_field_lundi_mardi_etc()
    local w = Week:new("Today's date",true)
    w.lundi = 9 -- ofc dont actually put nine here please
    -- print(w.lundi)
end

function can_display_as_table()
    local w = Week:new("Todays Date",true)
    w:display_as_table()
end

function can_instance_from_class_list()
    cl = dofile("../this_week.lua")
    local w = Week:from_classe_list(cl,"Today",true)
    return w
end

function can_display_as_table_from_class_list()
    local w = can_instance_from_class_list()
    print("-------")
    print(w.new)
    -- print(w.lundi)
    w:display_as_table()
end


prelude.test_fail(cant_instance_new_without_date,"cant_instance_new_without_date")
prelude.test(can_instance_new_with_date,"can_instance_new_with_date")
prelude.test(can_access_non_existent_fields_if_lundi_or_mardi_etc,"can_access_non_existent_fields_if_lundi_or_mardi_etc")
prelude.test_fail(cant_access_non_existent_fields,"cant_access_non_existent_fields")
prelude.test(can_set_field_lundi_mardi_etc,"can_set_field_lundi_mardi_etc")
prelude.test(can_display_as_table,"can_display_as_table")

prelude.test(can_instance_from_class_list,"can_instance_from_class_list")
prelude.test(can_display_as_table_from_class_list,"can_display_as_table_from_class_list")