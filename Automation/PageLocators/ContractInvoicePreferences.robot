*** Variables ***
${ContractInvoicePreferencesTab}    xpath=//a[contains(text(),'Contract Invoice Preferences')]
${BillingTab}     xpath=//ul[@id='menu']/li[3]/a
${CIP_SearchForCust_btn}    xpath=//input[@name='searchForCustomer']
${CIP_CustNo_Input}    id=customerNo
${CIP_SearchForCustomer_Btn}    xpath=//input[@name='searchForCustomer']
${CIP_SearchResults}    xpath=//td[text()='Search Results']
${CIP_Update}     xpath= //td[text()=' Update ']
${CIP_SelectAll_Btn}    xpath=//input[@value='Select all']
${CIP_ClearAll_Btn}    xpath=//input[@value='Clear all']
${CIP-ContractNum}    xpath=//input[@name='contractNo']
${CIP-CustomerName-btn}    xpath=//input[@name='customerNameBtn']
${CIP-CustSearch-CustNumber}    xpath=//label[contains(text(),'Customer No.')]
${CIP-CustSearch-SearchSubmit}    xpath=//input[@name='searchSubmit']
${CIP-SelectedCustomer}    xpath=//input[@type='checkbox'][@name='selectedCustomer']
${CIP-MultipleCustomer}    xpath=//input[@value='Select'][@name='multipleCustomers']
${CIP-SearchForCust-V2}    xpath=//input[@name='searchForCustomer'][@value='search']
${CIP-PayStatementStartDate}    id=payStatementStartDate
${CIP-PayStatementEndDate}    id=payStatementEndDate
${CIP-SelectedContract}    id=selectedContract1
${CIP-ProductPerInvoice}    xpath=//input[@name='productsPerInvoice']
${CIP-LicenseFreeOnHoldSelect}    id=licenseFeeOnHold
${CIP-CreditOnHold-Select}    id=creditsOnHold
${CIP-AccMethod-Select}    id=accountingMethod
${CIP-ConfirmMassUpdate-Btn}    xpath=//input[@name='confirmMassUpdate']
${CIP-SaveMassUpdate}    xpath=//input[@name='saveMassUpdate']
