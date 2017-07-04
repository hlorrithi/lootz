SLASH_SHOWLOOTZ1 = "/lootz";
SLASH_LOOTZHELP1 = "/lootzhelp";
SLASH_ADDLOOTZ1 = "/lootzadd";
SLASH_REMOVELOOTZ1 = "/lootzremove";
SLASH_SELECTEDLOOTZ1 = "/lootzselect";

SlashCmdList["SELECTEDLOOTZ"] = function(args)
    if LootzSelected == nil then
        LootzSelected = {}
    end
    if LootzSelected == {} then
        print("No currencies pre-selected. Use /lootzadd")
    else
        print("Pre-selected currencies:")
	for i,j in ipairs(LootzSelected) do
            print(j)
        end
    end
end

SlashCmdList["ADDLOOTZ"] = function(args)
    if LootzSelected == nil then
	LootzSelected = {}
    end
    if args == nil then
        print("Need currency name")
    elseif string.match(args, ",") then
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
        table.remove(LootzSelected,args)
        print(args .. " removed")
    end
end

SlashCmdList["SHOWLOOTZ"] = function(args)
    local TotalCurrency = GetCurrencyListSize()
    for i=1,TotalCurrency do
        local _name, _, _, _, _, _count = GetCurrencyListInfo(i)
        if args == "all" then
            print(_name .. ": " .. _count)
        elseif args == "" then
            if LootzSelected == {} or LootzSelected == nil then
                print("No currencies pre-selected. Use /lootzadd")
            else
                for j,k in ipairs(LootzSelected) do
                    if k == _name then
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
    print("/lootz all: prints all currencies")
    print("/lootzadd <currency_name>: adds currency to selection")
    print("/lootzremove: removes currency from selection")
    print("/lootzhelp: prints this help page")
    print("/lootzselect: prints pre-selected currency list")
end
