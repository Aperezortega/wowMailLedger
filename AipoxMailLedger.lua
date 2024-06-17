local AipoxMailLedger = CreateFrame("Frame")

if not AipoxMailLedgerDB then
    AipoxMailLedgerDB = {}
end


local function EventHandler(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == "AipoxMailLedger" then
            print("Addon cargado: AipoxMailLedger")
            AipoxMailLedgerDB = AipoxMailLedgerDB or {}
        end
    elseif event == "MAIL_INBOX_UPDATE" then

        RegisterMails()
        isOpeningAllMails = false 
    end
end


function RegisterMails()
    print("Registrando correos...")
    local numItems, totalItems = GetInboxNumItems()
    for i = 1, numItems do
        local packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, itemCount, wasRead, wasReturned, text, isGM = GetInboxHeaderInfo(i)
        if not string.find(subject, "Auction cancelled:") then
            local bodyText = GetInboxInvoiceInfo(i)
            local invoiceType, itemName, playerName, bid, buyout, deposit, consignment = GetInboxInvoiceInfo(i)
            if sender and (sender == "Horde Auction House" or sender == "Alliance Auction House") and subject then
                local key = sender .. "-" .. subject .. "-" .. tostring(i)
                AipoxMailLedgerDB[key] = {
                    timestamp = time(),
                    transaction = invoiceType,
                    item = itemName,
                    amount = buyout,
                }
            end
        end
    end
end

AipoxMailLedger:RegisterEvent("ADDON_LOADED")
AipoxMailLedger:RegisterEvent("MAIL_INBOX_UPDATE")
AipoxMailLedger:SetScript("OnEvent", EventHandler)