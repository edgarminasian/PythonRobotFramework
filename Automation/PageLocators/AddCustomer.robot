*** Variables ***
${CustomerTab}    xpath=//a[contains(text(),'Customer')][@href='#']
${AddCustomer}    xpath=//a[contains(text(),'Add C2C Customer')]
${AC-CustomerName-Input}    id=customerName
${AC-btn}         id=add
${AC-editCreditInfo-btn}    xpath=//input[@type='button'][@name='editCreditInfo']
${AC-LimitCurrent-Input}    id=arLimitCurrent
${AC-LimitSixMonths-Input}    id=arLimitSixMonths
${AC-Limit12Months-Input}    id=arLimitTwelveMonths
${AC-CreditRating-Select}    id=creditRating
${AC-CreditStatus-Select}    id=creditStatus
${AC-CreditReviewDate-Input}    id=lastCreditReviewDate
${AC-AddContract-Input}    xpath=//input[@value='add contact']
${AC-ContractType1-Select}    id=contactType1
${AC-Address-Input}    id=address1
${AC-Country-Select}    id=country
${AC-ContractStatus-Select}    id=contactStatus
${AC-CustomerShortName-Input}    id=customerShortName
${AC-ContractAddress-Input}    id=contractAddress1
${AC-City-Input}    id=city
${AC-State-Select}    id=stateOrProvince
${AC-PostalCode-Input}    id=postalCode
${AC-SaveBtn}     id=saveBtn
${AC-InvoiceTemplate}    id=invoiceTemplate
${AC-InvoiceDelivery}    id=invoiceDelivery
${AC-InvoiceDetail-Select}    id=invoiceDetail
${AC-SaveBtn}     id=saveBtn
${AC-SearchForCust}    xpath=//input[@name='searchForCustomer']
${AC-Update-Element}    xpath=//td[contains(text(),'Update')]
${AC-BillingServicingOffice-btn}    id=billingServicingOfficeSelect
${AC-CashServicingOffice-btn}    id=cashServicingOfficeSelect
${AC-SAPProfic-Btn}    id=SAPProfitCenterSelect
${AC-SAPCompany-btn}    id=SAPCompanyIdSelect
${AC-BillingCurrency-btn}    id=billingCurrency
${AC-RemitTo-btn}    id=remitTo
${AC-TaxArea-btn}    id=taxArea
${AC-TaxCurrency-btn}    id=taxCurrency
${AC-TaxRemitTo-btn}    id=taxRemitTo
${AC-AccMethod-btn}    id=accountingMethod
${AC-CashReceiptType-btn}    id=cashReceiptType
${AC-productPerInvoice}    id=productsPerInvoice
${AC-SeasonOneProduct}    id=considerSeasonOneProduct
${AC-payStatement}    id=payStatementRptFrequency
${AC-payStatementDayDue}    id=payStatementDaysDue
${AC-payStatementStartDate}    id=payStatementStartDate
${AC-payStatementEndDate}    id=payStatementEndDate
${AC-speCollectionsContact}    id=SPECollectionsContact
${AC-speBillingContact}    id=SPEBillingContact
${AC-statementDetail}    id=statementDetail
${AC-UnbilledOnStatement-btn}    id=showUnbilledOnStatement
${AC-SelectedCustomer}    xpath=//table[@id='myTable']/tbody/tr[1]/td/input[contains(@id,'selectedCustomer')]
${AC-ConfirmMassUpdate}    xpath=//input[@name='confirmMassUpdate']
${AC-CancelMassUpdate}    xpath=//input[@name='cancelMassUpdate']
${AC-CustomerInvoicePrefConfirm}    xpath=//span[contains(text(),'Customer Invoice Preferences Confirm')]
${AC-SaveMassUpdate}    xpath=//input[@name='saveMassUpdate']
${AC-CustInvoicePreferences}    xpath=//span[contains(text(),'Customer Invoice \ Preferences')]
${AC-ReturnToHomePage}    xpath=//span[contains(text(),'Home Page')]
