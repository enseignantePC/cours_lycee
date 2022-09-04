local function gsplit(text, pattern, plain)
    local splitStart, length = 1, #text
    return function ()
      if splitStart then
        local sepStart, sepEnd = string.find(text, pattern, splitStart, plain)
        local ret
        if not sepStart then
          ret = string.sub(text, splitStart)
          splitStart = nil
        elseif sepEnd < sepStart then
          -- Empty separator!
          ret = string.sub(text, splitStart, sepStart)
          if sepStart < length then
            splitStart = sepStart + 1
          else
            splitStart = nil
          end
        else
          ret = sepStart > splitStart and string.sub(text, splitStart, sepStart - 1) or ''
          splitStart = sepEnd + 1
        end
        return ret
      end
    end
  end


local function copy(table)
    a = {}
    for k,v in pairs(table)
    do
       a[k]=v 
    end
    setmetatable(a,getmetatable(table))
    return a
end

local function print_kv(table,iter_)
    local iter_ = iter_ or 0
    local sep = "    "
    for k,v in pairs(table)
    do
        if type(v)=="table"
        then
            local str_res = tostring(k)
            for i=1,iter_ 
            do
                str_res = sep .. str_res    
            end
            print(str_res," :")
            print_kv(v,iter_+1)
            -- print("-----")
        else
            local str_res = tostring( k) .. " -> ".. tostring( v) 
            for i=1,(iter_+1) 
            do
                str_res = sep .. str_res    
            end
            print(str_res)
        end
    end
end

local function read_file(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

local function split(text, pattern, plain)
  local ret = {}
  for match in gsplit(text, pattern, plain) do
    table.insert(ret, match)
  end
  return ret
end


local function test(func,test_name,msg_if_error)
  local test_name = test_name or "UNAMED TEST"
  local msg_if_error = msg_if_error or ""
  local x,y = pcall(func)
  if (x)
  then
      print( test_name .. "::passed")
  else
      print( test_name .. "::FAILED " .. msg_if_error .. " " .. y)
      print(debug.traceback())
  end
end

local function test_fail(func,test_name,msg_if_error)
  local test_name = test_name or "UNAMED TEST"
  local msg_if_error = msg_if_error or ""
  local x,y = pcall(func) 
  if (not x)
  then
      print( test_name .. "::failed_and_thats_ok"  .. " " .. y)
      print(debug.traceback())
  else
    print( test_name .. "::PASSED_AND_THATS_BAD " .. msg_if_error)
  end
end

-- to be tested
--  required a file relative to current script
-- local function prelude.requireRel()
--   if arg and arg[0] then
--       package.path = arg[0]:match("(.-)[^\\/]+$") .. "?.lua;" .. package.path
--       requireRel = require
--   elseif ... then
--       local d = (...):match("(.-)[^%.]+$")
--       function requireRel(module) 
--         return require(d .. module) 
--       end
--   end
-- end


prelude = {
  test = test,
  test_fail = test_fail,
  copy = copy,
  print_kv = print_kv,
  read_file = read_file,
  split = split,
  serpent = dofile("/home/astrale/Coding/lua/libs/serpent.lua")
}
