dofile("/home/astrale/Coding/latex/libs/preamble.lua")
Jour = dofile("../classes/class_jour.lua")


local function test_init()
    local lundi = Jour:new("Lundi")
end

local function test_init_bad()
    local lundi = Jour:new()
end

local function test_cant_add_named_field()
    local lundi = Jour:new("lundi")
    lundi.prout = "mardi"
end

local function test_can_add_non_empty_fields()
    local lundi = Jour:new("lundi")
    table.insert(lundi,4)
    table.insert(lundi,6)
    print(lundi[1])
    print(lundi[2])
    print(lundi[3])
end

local function test_cant_add_empty_fields()
    local lundi = Jour:new("lundi")
    table.insert(lundi,nil)
    table.insert(lundi,nil)
    print(lundi[1])
    print(lundi[2])
end

prelude.test(test_init,"test_init","with args this should pass")
prelude.test(test_can_add_non_empty_fields,"test_can_add_non_empty_fields")
prelude.test_fail(test_init_bad,"test_init_bad","without args this should fail")
prelude.test_fail(test_cant_add_named_field,"test_cant_add_named_field","any field cannot be set (except 'jour)")
prelude.test_fail(test_cant_add_empty_fields,"test_cant_add_empty_fields","when appends an empty element, should fail")