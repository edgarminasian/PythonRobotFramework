*** Variables ***
${CustomerTab}    xpath=//a[contains(text(), 'Customer')][@href='#']
${SearchForCustomer}    xpath=//a[contains(text(),'Search For Customer')]
${SearchForCustomerVer2}    css=a[href$='searchCustomerInitFromMenu']
${SFC-CustomerNumber}    id=customerNumber
${SFC-Search-Btn}    xpath=//input[@name='searchSubmit'][@value='search']
${SFC-CustName}    id=customerName
${SFC-InvoiceNo}    id=invoiceNo
${SFC-Territory}    id=territory
${SFC-MediaTypeId}    id=mediaTypeId
${SFC-BillingServiceOffice}    id=billingServicingOfficeID
${SFC-CashServicingOffice}    cashServicingOfficeID
${SFC-SAPProfitCenter}    SAPProfitCenterID
${SFC-SAPCompanyCode}    SAPCompanyID
${SFC-CashReportingTerritory}    cashReportingTerritory
${SFC-CustomerSalesStatus}    xpath=//input[@name='customer.customerSalesStatusIdDesc']
${SFC-CustomerSourceSys}    xpath=//input[@name='customer.sourceSystemDesc']
${SFC-HomeOfficeCust-CheckBox}    majorHomeOfficeCustomer1
${SFC-FieldOfficeCust-CheckBox}    majorFieldOfficeCustomer1
${SFC-AddRelation}    xpath=//input[@name='addRelation']
${SFC-EditCreditInfo-btn}    xpath=//input[@name='editCreditInfo']
${SFC-Save-btn}    saveBtn
${SFC-Cancel-btn}    cancelBtn
${SFC-City-Input}    city
${SFC-State-SelectFromList}    stateOrProvince
${SFC-SearchSubmit-btnv2}    xpath=//input[@name='searchSubmit']
${SFC-Account-Link}    xpath=//table[@id='resultTable']/tbody/tr[1]/td/a[text()='Account']
${SFC-Balance-btn}    buttonBalance1
${SFC-Performance-btn}    buttonPerformance1
${SFC-Collection-btn}    buttonCollection
${SFC-Last30DaySummary}    xpath=//td[text()='Last 30 Days Summary']
${SFC-CustAccPerformanceHist}    xpath=//td[text()='Customer Account Performance History']
${SFC-Balance-btn0}    buttonBalance
${SFC-CustAccBalanceDetials}    xpath=//td[text()='Customer Account Balance Details']
${SFC-ActiveStatusCheckbox}    xpath=//input[@id='customerStatusActive1']
${SFC-CustContractName}    xpath=//input[@id='customerContractName']
${SFC-CustTradingName}    xpath=//input[@id='customerTradingName']
${SFC-CustShortName}    xpath=//input[@id='customerShortName']
${SFC-Cust-PreviousName}    xpath=//input[@id='previousName']
${SFC-CustContractAddress}    xpath=//input[@id='contractAddress1']
${SFC-CustSourceSysDesc}    xpath=//input[@id='customer.sourceSystemDesc']
