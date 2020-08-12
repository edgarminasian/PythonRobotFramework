*** Settings ***
Variables         ../Date.py

*** Variables ***
${AppStatus_Locator}    //table[@id='dataTable1']/tbody/tr[1]/td[10]/a
${TrackNum_Locator}    //table[@id='dataTable1']/tbody/tr[1]/td[1]/span/a
${CustomerNumber}    81491
${BankAccId}      (12570-02663) Bank of America (checks) - USD
${CompanyCode}    5301 - SONY PICTURES ENTERTAINMENT IBERIA, S.L.U.
${DeposDate}      ${dates.CurrentDate}
#----------------------Approve-RejectCashReceipts--------------------------------------
${AddContractBilling}    xpath=//a[contains(text(),'Add Credit Contract Billing')]
${CustomerTab}    xpath=//a[contains(text(),'Customer')][@href='#']
${AddCustomer}    xpath=//a[contains(text(),'Add C2C Customer')]
