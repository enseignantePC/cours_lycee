dofile("/home/astrale/Coding/latex/libs/preamble.lua")
Classe = dofile("../classes/class_seance.lua")


local function test_new_without_args_fails()
    local _6E = Classe:new()
end    

local function test_new_with_args_no_fail()
    local _6E = Classe:new("6e",24,"","","","","","","","")
end

local function test_dbg_function_aint_nil()
    local _6E = Classe:new("6e",24,"","","","","","","","")
    if (_6E.dbg == nil)
    then
        error("dbg is nil")
    end
end

local function test_dbg()
    local _6E = Classe:new("6e",24,"","","","","","","","")
    _6E:dbg()
end

local function test_bad_field()
    local _6E = Classe:new("6e",24,"","","","","","","","")
    if (_6E.new)
    then
    end
    _6E["foobar"] = 4
    print("_6E.foobar " .. _6E["foobar"])
end


prelude.test_fail(test_new_without_args_fails,"test_new_without_args_fails")
prelude.test(test_new_with_args_no_fail,"test_new_with_args_no_fail")
prelude.test(test_dbg_function_aint_nil,"test_dbg_function_aint_nil")
prelude.test(test_dbg,"test_dbg")
prelude.test_fail(test_bad_field,"test_bad_field","should emit error when accessing badfield")
