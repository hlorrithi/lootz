SLASH_SHOWLOOTZ1 = "/lootz";
SLASH_LOOTZHELP1 = "/lootzhelp";
SLASH_ADDLOOTZ1 = "/lootzadd";
SLASH_REMOVELOOTZ1 = "/lootzremove";

SlashCmdList["ADDLOOTZ"] = function(args)
    if LootzSelected == nil then
	    LootzSelected = {}
	end
    if args == nil then
        print("Need currency name")
    elseif string.match(args, "%W") then
        print("Invalid argument")
    else
        table.insert(LootzSelected,args)
        print(args .. " added")
    end
end

SlashCmdList["REMOVELOOTZ"] = function(args)
    if args == nil then
        print("Need ID")
    elseif args == "all" then
        LootzSelected = nil
    else
        for i in LootzSelected do
            if i == args then
                table.remove(LootzSelected,i)
                print(i .. " removed")
            end
        end
    end
end

SlashCmdList["SHOWLOOTZ"] = function(args)
    local TotalCurrency = GetCurrencyListSize()
    for i=1,TotalCurrency do
        local _name, _, _, _, _, _count = GetCurrencyListInfo(i)
        if args == "all" then
            print(_name .. ": " .. _count)
        elseif args == nil then
            if LootzSelected == {} or LootzSelected == nil then
                print("No currencies pre-selected. Use /lootzadd")
            else
                for j in LootzSelected do
                    if j == _name then
                        print(_name .. ": " .. _count)
                    end
                end
            end
        else
            if args == _name then
                print(_name .. ": " .. _count)
            end
        end
    end
end

SlashCmdList["LOOTZHELP"] = function(args)
    print("/lootz: prints pre-selected currencies")
    print("/lootz <currency_name>: prints specified currency")
    print("/lootz all": prints all currencies")
    print("/lootzadd <currency_name>: adds currency to selection")
    print("/lootzremove: removes currency from selection")
    print("/lootzhelp: prints this help page")

end
