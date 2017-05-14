SLASH_CHECKLOOTZ1 = "/lootz";
SLASH_LISTOFLOOTZ1 = "/lootzlist";
SLASH_LOOTZHELP1 = "/lootzhelp";
SLASH_BCKPCKLOOTZ1 = "/lootzbckpck";
SlashCmdList["CHECKLOOTZ"] = function(args)
	local LegionCurrencies = {1155, 1226, 1342}
    for i,id in ipairs(LegionCurrencies) do
        local name, currentAmount = GetCurrencyInfo(id)
        print(name .. ": " .. currentAmount)
    end
end

SlashCmdList["LISTOFLOOTZ"] = function(args)
    local TotalCurrency = GetCurrencyListSize()
    for i=1,TotalCurrency do
        local _name,_,_,_,_,_count = GetCurrencyListInfo(i)
        print(_name .. ": " .. _count)
    end
end

SlashCmdList["BCKPCKLOOTZ"] = function(args)
    local TotalCurrency = GetNumWatchedTokens()
    for i=1,TotalCurrency do
        local foo1, foo2, foo3, foo4, foo5 = GetBackpackCurrencyInfo(i)
		print(foo1, foo2, foo3, foo4, foo5)
    end
end

SlashCmdList["LOOTZHELP"] = function(args)
    print("/lootz: prints selected Legion currencies")
    print("/lootzlist: prints list of all currencies")
    print("/lootzbckpck: prints id of backpack currencies for /lootz selection")
    print("/lootzhelp: prints this help page")

end
