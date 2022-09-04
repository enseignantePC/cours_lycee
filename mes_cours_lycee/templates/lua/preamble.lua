dofile(os.getenv("path_to_lua_init"))

if not (tex)
then
    tex = {
        print=print,
        debug=print,
        try = function (func,msg)
            msg = msg or ""
            local x,y = pcall(func)
            if (x)
            then
                print( "passed")
            else
                print("ERROR OCCURED :")
                print(y)
                print(msg)
            end
        end

    }
    local function try(func,msg)
        msg = msg or ""
        local x,y = pcall(func)
        if (x)
        then
            print("@@@This should be printed to latex:@@@")
            func()
        else
            print("@@@This ERROR should be printed to latex:@@@")
            print("\\begin{verbatim}")
            print(y)
            print(msg)
            print("\\end{verbatim}")
        end
    end

    my_tex = {
        print=print,
        debug=print,
        try=try,
    }
else
    local function tex_print(str)
        for k,v in ipairs(prelude.split(str,"\n"))
        do
            tex.print(v)
        end
    end

    local function try(func,is_verbatim,msg)
        is_verbatim = is_verbatim or false
        msg = msg or ""
        if is_verbatim
        then
            tex_print("\\begin{verbatim}")
        end
        local x,y,z = pcall(func)
        if is_verbatim
        then
            tex_print("\\end{verbatim}")
        end
        if (x)
        then
            print( "passed")
        else
            tex_print("\\begin{verbatim}")
            tex_print("ERROR OCCURED :")
            tex_print(y)
            tex_print(debug.traceback())
            tex_print(msg)
            tex_print("\\end{verbatim}")
        end
    end
    my_tex = {
        print=tex_print,
        debug=texio.write_nl,
        try=try,
    }
end

