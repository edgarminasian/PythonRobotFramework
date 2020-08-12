*** Variables ***
${AccountingTab}    xpath=//ul[@id='menu']/li[5]/a
${SearchForEntityTrialBalance}    css=a[href$='searchEntTrialBalInit']
${Element-EntryTrialBalance}    xpath=//span[text()='Entity Trial Balance Search']
${profitCenter-Select}    profitCenterId
${entity-Select}    entity
${ledger-Select}    ledger1
${currency-Select}    currency1
${endDate-Select}    endDate1
${Search-btn}     xpath=//input[@name='search']
${BatchNumber}    id=batchNumber
${Acc-FromDateRange}    xpath=//input[@name='fromDateRange']
${Acc-toDateRange}    xpath=//input[@name='toDateRange']
${Acc-DownArrowImage}    css=input[src$='downArrow.png']
${Acc-Status}     id=status
${Acc-UserId}     id=userId
${Acc-DownArrowbtn}    xpath=//input[@src='/c2c/images/downArrow.png']
