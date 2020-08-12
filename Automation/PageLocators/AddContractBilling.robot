*** Variables ***
${BillingTab}     xpath=//a[contains(text(), 'Billing')][@href='#']
${AddContractBilling}    xpath=//a[contains(text(),'Add Credit Contract Billing')]
${ACB-ContractNo-Input}    id=contractNo
${ACB-Search-btn}    xpath=//input[@value='Search'][@class='formButton']
${ACB-ContractNo-Link}    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[2]/a[1]
${ACB-ReasonForSubmit-Input}    id=reasonForSubmit
${ACB-Selected-btn}    id=selectedBI1
${ACB-SubmitForApp-btn}    xpath=//input[@value='Submit For Approval']
${ACB-SearchBtn}    ${ACCB-Search-btn}
