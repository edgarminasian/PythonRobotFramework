*** Variables ***
${AccTab}         xpath=//a[contains(text(), 'Accounting')][@href='#']
${AddManualJournalTransaction}    xpath=//a[contains(text(), 'Add Manual Journal Transactions')]
${AMJT-TransacCurrency}    id=transactionCurrency
${AMJT-Desc}      xpath=//input[@type='text'][@name='description']
${AMJT-Update-btn}    xpath=//input[@class='formButton'][@value='Update']
${AMJT-ProjectCenter-Select}    id=profitCenter
${AMJT-JelEntity-Select}    id=JELEntityId
${AMJT-AccNo-Input}    xpath=//input[@name='COAccountNo']
${AMJT-Amt-Input}    xpath=//input[@name='amount']
${AMJT-UpdateLine-Btn}    xpath=//input[@name='updateLine']
${AMJT-ProfirCenter}    id=profitCenter
${AMJT-SubmitForApp}    xpath=//input[@value='submit for approval']
