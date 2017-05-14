SLASH_CHECKLOOTZ1 = "/lootz";
SLASH_LISTOFLOOTZ1 = "/lootzlist";
SLASH_LOOTZHELP1 = "/lootzhelp";
SLASH_BCKPCKLOOTZ1 = "/lootzbckpck";
SLASH_ADDLOOTZ1 = "/lootzadd";

SlashCmdList["CHECKLOOTZ"] = function(args)
    if LootzToFollow == nil or LootzToFollow == {} then
        print("No currencies selected. Use /lootzadd <id> to select currency.")
    else
        for i,id in ipairs(LootzToFollow) do
            local name, currentAmount = GetCurrencyInfo(id)
            print(name .. ": " .. currentAmount)
        end
    end
end

SlashCmdList["ADDLOOTZ"] = function(args)
    if LootzToFollow == nil then
	    LootzToFollow = {}
	end
    if args == nil then
        print("Need ID")
    else
        table.insert(LootzToFollow,args)
    end
end

SlashCmdList["LISTOFLOOTZ"] = function(args)
    local TotalCurrency = GetCurrencyListSize()
    for i=1,TotalCurrency do
        local _name, _, _, _, _, _count = GetCurrencyListInfo(i)
        print(_name .. ": " .. _count)
    end
end

SlashCmdList["BCKPCKLOOTZ"] = function(args)
    local TotalWatchedCurrency = GetNumWatchedTokens()
    for i=1,TotalWatchedCurrency do
        local foo1, foo2, foo3, foo4, foo5 = GetBackpackCurrencyInfo(i)
		print(foo1, foo2, foo3, foo4, foo5)
    end
end

SlashCmdList["LOOTZHELP"] = function(args)
    print("/lootz: prints selected currencies")
    print("/lootzadd <id>: add currency to selection")
    print("/lootzlist: bitch does nothing")
    print("/lootzbckpck: prints id of backpack currencies for /lootz selection")
    print("/lootzhelp: prints this help page")

end
