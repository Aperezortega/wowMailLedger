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
    local packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, itemCount, wasRead, wasReturned, text, isGM = GetInboxHeaderInfo(1) -- Assuming we only process the first item
    if not string.find(subject, "Auction cancelled:") or not string.find(subject, "Auction expired:") then
        local bodyText = GetInboxInvoiceInfo(1)
        local invoiceType, itemName, playerName, bid, buyout, deposit, consignment = GetInboxInvoiceInfo(1)
        if sender and (sender == "Horde Auction House" or sender == "Alliance Auction House") and subject and (string.find(subject, "Auction won") or string.find(subject, "Auction successful")) then
            local key = sender .. "-" .. subject .. "-" .. tostring(1)
            AipoxMailLedgerDB[key] = {
                timestamp = time(),
                transaction = invoiceType,
                item = itemName,
                amount = buyout,
            }
        end
    end
end

AipoxMailLedger:RegisterEvent("ADDON_LOADED")
AipoxMailLedger:RegisterEvent("MAIL_INBOX_UPDATE")
AipoxMailLedger:SetScript("OnEvent", EventHandler)