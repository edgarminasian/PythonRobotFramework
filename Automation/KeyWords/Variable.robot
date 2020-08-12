*** Settings ***
Library           DatabaseLibrary
Library           OracleLibrary
Library           Selenium2Library
Library           Collections
Library           re
Resource          2FALogin.robot
Resource          ../PageLocators/AddCashReceiptLog.robot
Resource          ../PageLocators/SearchForCash.robot
Resource          ../PageLocators/ContractInvoicePreferences.robot
Resource          ../PageLocators/ApproveCashApplication.robot
Resource          ../PageLocators/Add-AR-Adjustments.robot
Resource          ../PageLocators/SearchForInvoice_CreditMemo.robot
Resource          ../PageLocators/AddContractBilling.robot
Resource          ../PageLocators/AddCustomer.robot
Resource          ../PageLocators/AddManualJournalTransaction.robot
Resource          ../PageLocators/ApproveSpecialBillRun.robot
Resource          ../PageLocators/SearchForBillingSchedule.robot
Resource          ../PageLocators/AddManualJournalTransactions.robot
Resource          ../PageLocators/ApproveManualJournalTransactions.robot
Resource          ../PageLocators/SearchForJournalTransaction.robot
Resource          ../PageLocators/AddMiscellaneousBilling.robot
Resource          ../PageLocators/SearchForMiscellaneousBilling.robot
Resource          ../PageLocators/ApproveMiscellaneousBilling.robot
Resource          ../PageLocators/AddMiscellaneousCreditMemo.robot
Resource          ../PageLocators/SearchForMiscellaneousCredit.robot
Resource          ../PageLocators/ApproveARAdjustments.robot
Resource          ../PageLocators/SearchForMiscellaneousCredit.robot
Resource          ../PageLocators/ContractInvoicePreferences.robot
Resource          Global_Variables.robot
Variables         ../Date.py

*** Variables ***
${CashAppStatus}    Unapplied
${CashAppStatusLocator}    xpath=//table[@id='dataTable1']//tbody[1]//tr[1]//td[10]//a
${ErMsg}          Condition Failed!
${CashReceiptsAppStatus}    Submitted
@{OpenBrowser}    https://spti-qa.spe.sony.com/c2c/login/    https://c2c-qa.spe.sony.com/c2c/

*** Keywords ***
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

DB Connection
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','3u$C2ce_c2c','uspxh006d1.spe.sony.com:30513/COSQC2CE'
    Connect To Database Using Custom Params    cx_Oracle    'dbo/c0nn_9ad80@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=uspxh006d1.spe.sony.com)(PORT=30513))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=COSQITSM)))'
    #Connect To Database Using Custom Params    cx_Oracle    'dbo/c0nn_Stgd80@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=uspxh006d1.spe.sony.com)(PORT=30513))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=COSQC2C3)))'
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','c0nnc2cd3v_c2c','uspxh007d3.spe.sony.com:30513/COSDC2C3'
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','c0nn_rpms33tc','uspxh020d4.spe.sony.com:30513/COSDRPM8'
    #Connect To Database Using Custom Params    cx_Oracle    'c2c','c0nn_9r9mc2','uspxh006d1.spe.sony.com:30513/COSQRPM1'

Error
    Log To Console    No data found

Success
    Log To Console    Record fetched successfully

Close Browser TC
    Close All Browsers

Cash Receipt Not Found
    Log To Console    No cash receipt logs found

Login
    Comment    Open Browser    https://spti-dev3.spe.sony.com/c2c/    Chrome
    Comment    Open Browser    https://c2c-qa3.spe.sony.com/c2c/    Chrome
    Comment    Open Browser    https://c2c-qa5.spe.sony.com/c2c/    Chrome
    Comment    Open Browser    https://c2c-qa.spe.sony.com/c2c/    Chrome
    Open Browser    @{OpenBrowser}[1]    Chrome
    Comment    Open Browser    https://c2c-qa4.spe.sony.com/c2c/    Chrome
    Set Selenium Speed    .1
    Maximize Browser Window

AppCreditContractBilling
    Click Element    xpath=//input[@src='/c2c/images/downArrow.png']

TC11_Reject credit contract from Approve Credit Contract screen
    Select From List By Label    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[13]/select[1]    Reject
    Click Element    xpath=//input[@class='formButton'][@name='saveCredit']
    Wait Until Element Is Visible    xpath=//input[@class='formButton'][@name='cancel']    timeout=45s
    Click Element    xpath=//input[@class='formButton'][@name='cancel']
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Home Page
    Close Browser

TC35_Error
    Click Button    id=add

TC33_Error
    Log to Console    Please Try Different Contract Number

TC33_TRUE
    Select Checkbox    id=specialBillRunList1
    Click Element    xpath=//input[@name='create_special_bill_run'][@value='create special bill run']
    ${Check}    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//td[contains(text(),'The following contracts')]
    Run Keyword If    "${Check}" == "True"    TC33_Request for SBR at contract level
    ...    ELSE    TC33_Error

TC37_TRUE
    Click Element    ${SFB-SpecialBillRun3-btn}
    Click Element    xpath=//input[@name='create special bill run']
    ${Check}    Run Keyword And Return Status    Element Should Be Visible    id=reasonForRequest
    Run Keyword If    "${Check}" == "True"    TC37-WithNoError
    ...    ELSE    TC33_Error

DEV2 DB Connection
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','3u$C2ce_c2c','uspxh006d1.spe.sony.com:30513/COSQC2CE'
    Connect To Database Using Custom Params    cx_Oracle    'dbo/c0nn_9ad80@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=uspxh006d1.spe.sony.com)(PORT=30513))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=COSQITSM)))'
    #Connect To Database Using Custom Params    cx_Oracle    'dbo/c0nn_Stgd80@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=uspxh006d1.spe.sony.com)(PORT=30513))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=COSQC2C3)))'
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','c0nnc2cd3v_c2c','uspxh007d3.spe.sony.com:30513/COSDC2C3'
    #Connect To Database Using Custom Params    cx_Oracle    'c2c','c0nn_9r9mc2','uspxh006d1.spe.sony.com:30513/COSQRPM1'

Oracle DB Connection
    #OracleLibrary.Connect To Database    C2C    3u$C2ce_c2c    uspxh006d1.spe.sony.com    30513    service=COSQC2CE
    OracleLibrary.Connect To Database    C2C    c0nn_9ac2iqt$M    uspxh006d1.spe.sony.com    30513    service=COSQITSM
    #OracleLibrary.Connect To Database    C2C    c0nnc2cd3v_c2c    uspxh007d3.spe.sony.com    30513    service=COSDC2C3
    #OracleLibrary.Connect To Database    C2C    c0nn_rpms33tc    uspxh020d4.spe.sony.com    30513    service=COSDRPM8
    #OracleLibrary.Connect To Database    c2c    c0nn_9r9mc2    uspxh006d1.spe.sony.com    30513    service=COSQRPM1

TC001_Approve cash application with auto cash lift via full amount credit memo
    Wait Until Element Is Visible    id=specialBillRunList1
    Select Checkbox    id=specialBillRunList1
    Click Element    xpath=//input[@name='create_special_bill_run']
    ${RowCheck}    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//td[contains(text(),'The following contracts')]
    Run Keyword iF    "${RowCheck}" == "True"    TC001-WithError
    ...    ELSE    SFB-FALSE
    Close Browser

ContractNoError
    Log To Console    Try Different Parameter! As there is no SBR Button with this particular parameter!

SBRScenario
    Click Link    xpath=//table[@id='ContractSearchTable']/tbody[1]/tr[1]/td[3]
    Sleep    3s
    Scroll Page To Location    0    1000
    Click Element    xpath=//form[@id='paymentTermByContractForm']/table[1]/tbody[1]/tr[3]/td[1]/div[2]/table[1]/tbody[1]/tr[2]/td[1]/input[1]

Post & Reject
    Wait Until Element Is Visible    xpath=//input[@type='search']    timeout=45s
    Input Text    xpath=//input[@type='search']    ${DeposDate}
    Select From List By Label    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[8]/select[1]    Posted
    Select From List By Label    xpath=//table[@id='dataTable1']/tbody[1]/tr[2]/td[8]/select[1]    Posted
    Select From List By Label    xpath=//table[@id='dataTable1']/tbody[1]/tr[3]/td[8]/select[1]    Posted
    Comment    Select From List By Label    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[8]/select[1]    Rejected
    Comment    Select From List By Label    xpath=//table[@id='dataTable1']/tbody[1]/tr[2]/td[8]/select[1]    Rejected
    Select From List By Label    xpath=//table[@id='dataTable1']/tbody[1]/tr[3]/td[8]/select[1]    Rejected

Click On Link
    Click Link    xpath=//table[@id='dataTable1']//tbody[1]//tr[1]//td[10]//a

Cash Receipt Log
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Cash')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Cash')][@href='#']
    Click Element    xpath=//a[contains(text(), 'Add Cash Receipt Log')]
    Wait Until Keyword Succeeds    100s    .2s    Element Should Be Visible    id=bankAccountId
    Select From List By Label    id=bankAccountId    (12570-02663) Bank of America (checks) - USD
    Input Text    id=depositDate    ${DeposDate}
    Input Text    id=bankControlTotal    30.00
    Click Button    id=addBtn
    Wait Until Keyword Succeeds    100s    .2s    Element Should Be Visible    id=checkNo
    Input Text    id=checkNo    59
    Input Text    id=payor    Geo
    Input Text    xpath=//td[@id='CustomerNo']//input[@id='customerNo']    81491
    Input Text    id=amount    30.00

LaunchBrowserAndLogin
    Login
    Login_To_SailPoint_2FA

TC34-Error
    Log To Console    Try Different Parameter! As there is no SBR Button with this particular parameter!

TC36-Error
    Log To Console    Try Different Parameter! As there is no SBR Button with this particular parameter!

TC34-True
    Wait Until Element Is Visible    ${SFB-SpecialBillRun1-btn}    timeout=45s
    Select Checkbox    ${SFB-SpecialBillRun1-btn}
    Select Checkbox    ${SFB-SpecialBillRun2-btn}
    Click Element    ${SFB-CreateSpecialBillRun-Btn}
    ${RowCheck}    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//td[contains(text(),'The following contracts')]
    Run Keyword iF    "${RowCheck}" == "True"    TC34-WithNoError
    ...    ELSE    SFB-FALSE
    Sleep    2s

TC36-True
    Wait Until Element Is Visible    ${SFB-SpecialBillRun1-btn}    timeout=45s
    Select Checkbox    ${SFB-SpecialBillRun1-btn}
    Comment    Select Checkbox    ${SFB-SpecialBillRun2-btn}
    Click Element    ${SFB-CreateSpecialBillRun-Btn}
    ${RowCheck}    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//td[contains(text(),'The following contracts')]
    Run Keyword iF    "${RowCheck}" == "True"    TC36-WithNoError
    ...    ELSE    SFB-FALSE

TC02-TRUE
    Input Text    ${SFB-ReasonForRequest}    automfa5
    Click Button    id=submitApprv
    Wait Until Element Is Visible    ${BillingTab}    timeout=45s
    Mouse Over    ${BillingTab}
    Click Element    ${AppSpecialBillRun}
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[8]/select[1]
    Input Text    ${SBR-Search-Input}    automfa5
    Press Key    ${SBR-Search-Input}    \\09
    Select From List By Label    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[8]/select[1]    Posted
    Click Button    ${SBR-Submit}
    Element Text Should Be    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[7]    Submitted
    Wait Until Element Is Visible    ${BillingTab}    timeout=45s
    Mouse Over    ${BillingTab}
    Click Element    ${SearchForInvoice-CreditMemo}
    Wait Until Element Is Visible    ${SFI-FormDate-Input}
    Comment    Input Text    id=fromDate    ${CurrentDate}
    Input Text    ${SFI-ContractNum-Input}    FCN14S001Y
    Click Element    xpath=//div[@id='searchTable']/table[1]/tbody[1]/tr[2]/td[1]/input[1]
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]    timeout=45s
    ${Invoice1}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]
    ${Invoice2}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[2]/td[1]/a[1]
    ${Contract1}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[7]
    ${Contract2}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[2]/td[7]
    Wait Until Element Is Visible    ${CashTab}    timeout=45s
    Mouse Over    ${CashTab}
    Click Element    ${AddCashReceiptLog}
    Wait Until Element Is Visible    ${bAccountId}    timeout=45s
    Select From List By Label    ${bAccountId}    (12570-02663) Bank of America (checks) - USD
    Input Text    ${DepositDate}    ${DeposDate}
    Input Text    ${bankControlTotal}    30.00
    Click Button    ${addBtn}
    Wait Until Element Is Visible    ${ChkNo}    timeout=45s
    Input Text    ${ChkNo}    222
    Input Text    ${Payor}    Ed
    Input Text    ${CustomerNo}    202330
    Input Text    ${AMOUNT}    30.00
    Click Button    ${SaveBtn}
    Wait Until Element Is Visible    ${PostLogBtn}    timeout=45s
    ${TrackNo}    Get Text    xpath=//table[@id='dataTable1']/tbody/tr[1]/td[1]/span/a
    Click Button    ${PostLogBtn}
    Handle Alert    action=ACCEPT
    Wait Until Element Is Visible    ${Unapplied_Link}    timeout=45s
    Sleep    5
    Run Keyword If    "${CashAppStatus}" == "Unapplied"    Variable.Click On Link
    ...    ELSE    ${ErMsg}
    Scroll Page To Location    0    1000
    Click Button    ${SearchForInvoice-btn}
    Wait Until Page Contains Element    xpath=//table[@id='myTable']    timeout=45s
    Wait Until Keyword Succeeds    45s    .2s    Click Element    xpath= //table[@id='myTable']//tbody[1]//tr[1]//td[13]//input[1]
    Click Button    ${CashAppMode}
    Wait Until Element Is Visible    xpath=//table[@id='resultTable']//tr[@class='resultsData odd']//td[13]//input[@id='invoiceTaxAmounts']    timeout=45s
    Input Text    xpath=//table[@id='resultTable']//tr[@class='resultsData odd']//td[13]//input[@id='invoiceTaxAmounts']    2.00
    Checkbox Should Be Selected    xpath=//table[@id='resultTable']//tr[@class='resultsData odd']//td[11]//input[@id='invoiceInFull']
    Clear Element Text    xpath=//table[@id='resultTable']//tr[@class='resultsData odd']//td[12]//input[@id='invoiceGrossAmounts']
    Input Text    xpath=//table[@id='resultTable']//tr[@class='resultsData odd']//td[12]//input[@id='invoiceGrossAmounts']    30.00
    Press Key    xpath=//table[@id='resultTable']//tr[@class='resultsData odd']//td[12]//input[@id='invoiceGrossAmounts']    \\13
    Wait Until Keyword Succeeds    100s    .2s    Element Text Should Be    ${BalanceTxt}    0.00
    Click Button    id=submitApprv
    Handle Alert    action=ACCEPT
    Run Keyword If    "${CashReceiptsAppStatus}" == "Submitted"    Variable.Click On Link
    ...    ELSE    ${ErMsg}
    Scroll Page To Location    0    1000
    Wait Until Page Contains Element    ${Post}
    Click Button    ${Post}
    Handle Alert    action=ACCEPT
    Sleep    5s
    Log To Console    Verifying Informatio In The Database
    ${CA_WORKSHEET}    DatabaseLibrary.Check If Exists In Database    select CA_WORKSHEET_ID,CASH_RECEIPT_ID, CREDIT_MEMO_ID, CA_WORKSHEET_STATUS_ID, WITHHOLDING_TAX_AMOUNT from c2c.ca_worksheet where CASH_RECEIPT_ID = ${TrackNo} AND CURRENT_WORKSHEET_FLAG='Y'
    ${CashReceipt}    DatabaseLibrary.Check If Exists In Database    SELECT A.RECEIPT_STATUS, A.DEPOSIT_DATE,A.CUSTOMER_NUMBER, A.CASH_RECEIVED, A.GROSSED_UP_AMOUNT, A.UNAPPLIED_AMOUNT, A.ON_ACCOUNT_AMOUNT, A.WITHHOLDING_TAX_AMOUNT, A.APPLIED_AMOUNT, A.CASH_APP_STATUS, A.DEDUCTION_AMOUNT,A.CASH_RECEIPT_LOG_NUMBER FROM c2c.CASH_RECEIPT_VW A, c2c.CUSTOMER B , c2c.CASH_RECEIPT_LOG C,DBO.LOOKUP D WHERE CASH_RECEIPT_ID = ${TrackNo} AND A.CUSTOMER_ID = B.CUSTOMER_ID AND A.CASH_RECEIPT_LOG_ID=C.CASH_RECEIPT_LOG_ID AND A.CASH_RECEIPT_STATUS_ID = D.LOOKUPID
    ${on_account}    DatabaseLibrary.Check If Not Exists In Database    select CASH_RECEIPT_ID,CUSTOMER_ID,AMOUNT,CREATE_DATE FROM c2c.on_account WHERE CASH_RECEIPT_ID=${TrackNo}
    ${InvoiceTable}    DatabaseLibrary.Query    select A.INVOICE_ID,A.INVOICE_NUMBER,A.CONTRACT_NUMBER,B.CUSTOMER_ID,A.AMOUNT_DUE,A.BALANCE_DUE,A.INVOICE_DATE,A.DUE_DATE,A.IS_SPECIAL_VAT FROM c2c.INVOICE A,c2c.CASH_RECEIPT B where invoice_number='${Invoice1}' OR invoice_number='${Invoice2}'
    ${ACC_TRANSAC_VW}    DatabaseLibrary.Check If Exists In Database    SELECT SOURCE_JOURNAL_TYPE, TRANSACTION_TYPE, SAP_COMPANY_CODE,sum(TRANSACTION_AMOUNT), CUSTOMER_NUMBER, CONTRACT_NUMBER, INVOICE_NUMBER, CREDIT_MEMO_NUMBER FROM c2c.accounting_transaction_vw at WHERE SOURCE_JOURNAL_TYPE='CSA' AND TRANSACTION_TYPE='CA' AND INVOICE_NUMBER='${Invoice1}' GROUP BY SOURCE_JOURNAL_TYPE, TRANSACTION_TYPE, SAP_COMPANY_CODE,CUSTOMER_NUMBER, CONTRACT_NUMBER, INVOICE_NUMBER, CREDIT_MEMO_NUMBER
    ${Billing_Item}    DatabaseLibrary.Check If Exists In Database    SELECT CONTRACT_NUMBER,INVOICE_ID,CREDIT_MEMO_ID,sum(CONTRACT_AMOUNT) as contract_Amount,sum(BILLING_AMOUNT)as billing_amount,sum(WITHHOLDING_TAX_AMOUNT)as WITHHOLDING_TAX_AMOUNT,sum(GROSS_AMOUNT_APPLIED)as GROSS_AMOUNT_APPLIED,WITHHOLDING_TAX_APPLIED,sum(BALANCE_DUE) as BALANCE_DUE,REVENUE_PROCESSED_FLAG FROM c2c.billing_item WHERE invoice_id='${InvoiceTable[0][0]}' AND WITHHOLDING_TAX_AMOUNT=0 AND REVENUE_PROCESSED_FLAG='Y' group by CONTRACT_NUMBER,INVOICE_ID,CREDIT_MEMO_ID,WITHHOLDING_TAX_APPLIED,REVENUE_PROCESSED_FLAG
    Log To Console    Waiting for Credit Memo T-SQL Query Results
    ${Credit_Memo}    DatabaseLibrary.Execute Sql String    begin c2c.generate_cm_by_invoice('${Contract1}','${Invoice1}','N'); end;
    ${commit-CreditMemo}    DatabaseLibrary.Set Auto Commit
    Log To Console    Results Fetched Successfully
    Mouse Over    ${BillingTab}
    Click Element    ${SearchForInvoice-CreditMemo}
    Wait Until Element Is Visible    ${Type2Element}
    Click Element    ${Type2Element}
    Input Text    ${SFI-FormDate-Input}    ${dates.CurrentDate}
    Input Text    ${SFI-ContractNum-Input}    ${Contract1}
    Click Element    ${SFI-SearchSubmit}
    Wait Until Element Is Visible    xpath=//table[@id='myTable1']/tbody[1]/tr[1]/td[1]/a[1]    timeout=45s
    ${MemoNo}    Get Text    xpath=//table[@id='myTable1']/tbody[1]/tr[1]/td[1]/a[1]
    Log To Console    Verifying Information In The Databse
    ${CA_WORKSHEET}    DatabaseLibrary.Check If Exists In Database    select CA_WORKSHEET_ID,CASH_RECEIPT_ID, CREDIT_MEMO_ID, CA_WORKSHEET_STATUS_ID, WITHHOLDING_TAX_AMOUNT from c2c.ca_worksheet where CASH_RECEIPT_ID = ${TrackNo} AND CURRENT_WORKSHEET_FLAG='Y'
    ${CashReceipt}    DatabaseLibrary.Check If Exists In Database    SELECT A.RECEIPT_STATUS, A.DEPOSIT_DATE,A.CUSTOMER_NUMBER, A.CASH_RECEIVED, A.GROSSED_UP_AMOUNT, A.UNAPPLIED_AMOUNT, A.ON_ACCOUNT_AMOUNT, A.WITHHOLDING_TAX_AMOUNT, A.APPLIED_AMOUNT, A.CASH_APP_STATUS, A.DEDUCTION_AMOUNT,A.CASH_RECEIPT_LOG_NUMBER FROM c2c.CASH_RECEIPT_VW A, c2c.CUSTOMER B , c2c.CASH_RECEIPT_LOG C,DBO.LOOKUP D WHERE CASH_RECEIPT_ID = ${TrackNo} AND A.CUSTOMER_ID = B.CUSTOMER_ID AND A.CASH_RECEIPT_LOG_ID=C.CASH_RECEIPT_LOG_ID AND A.CASH_RECEIPT_STATUS_ID = D.LOOKUPID
    ${on_account}    DatabaseLibrary.Check If Not Exists In Database    select CASH_RECEIPT_ID,CUSTOMER_ID,AMOUNT,CREATE_DATE FROM c2c.on_account WHERE CASH_RECEIPT_ID=${TrackNo}
    ${InvoiceTable}    DatabaseLibrary.Query    SELECT INVOICE_ID,INVOICE_NUMBER,CONTRACT_NUMBER,BILLING_STYLE_ID,AMOUNT_DUE,BALANCE_DUE,INVOICE_DATE,DUE_DATE,IS_SPECIAL_VAT FROM c2c.INVOICE WHERE INVOICE_NUMBER = '${Invoice1}'
    ${ACC_TRANSAC_VW}    DatabaseLibrary.Check If Exists In Database    SELECT SOURCE_JOURNAL_TYPE, TRANSACTION_TYPE, SAP_COMPANY_CODE,sum(TRANSACTION_AMOUNT), CUSTOMER_NUMBER, CONTRACT_NUMBER, INVOICE_NUMBER, CREDIT_MEMO_NUMBER FROM c2c.accounting_transaction_vw at WHERE SOURCE_JOURNAL_TYPE='CSA' AND TRANSACTION_TYPE='CA' AND INVOICE_NUMBER='${Invoice1}' AND CREDIT_MEMO_NUMBER='${MemoNo}' GROUP BY SOURCE_JOURNAL_TYPE, TRANSACTION_TYPE, SAP_COMPANY_CODE,CUSTOMER_NUMBER, CONTRACT_NUMBER, INVOICE_NUMBER, CREDIT_MEMO_NUMBER
    ${Billing_Item}    DatabaseLibrary.Check If Exists In Database    SELECT CONTRACT_NUMBER,INVOICE_ID,CREDIT_MEMO_ID,sum(CONTRACT_AMOUNT) as contract_Amount,sum(BILLING_AMOUNT)as billing_amount,sum(WITHHOLDING_TAX_AMOUNT)as WITHHOLDING_TAX_AMOUNT,sum(GROSS_AMOUNT_APPLIED)as GROSS_AMOUNT_APPLIED,WITHHOLDING_TAX_APPLIED,sum(BALANCE_DUE) as BALANCE_DUE,REVENUE_PROCESSED_FLAG FROM c2c.billing_item WHERE invoice_id='${InvoiceTable[0][0]}' AND WITHHOLDING_TAX_AMOUNT=0 AND REVENUE_PROCESSED_FLAG='Y' group by CONTRACT_NUMBER,INVOICE_ID,CREDIT_MEMO_ID,WITHHOLDING_TAX_APPLIED,REVENUE_PROCESSED_FLAG
    DatabaseLibrary.Disconnect From Database
    Log To Console    Datas are visible in DB
    Sleep    2s

SFB-FALSE
    Log To Console    Try Different Parameter

TC001-WithError
    Wait Until Element Is Visible    xpath=//textarea[@name='reasonForRequest']    timeout=90s
    Input Text    xpath=//textarea[@name='reasonForRequest']    TC017_Auto cash lift when catch up billing runs
    Click Button    id=submitApprv
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Approve Special Bill Runs')]
    Wait Until Element Is Visible    xpath=//input[@type='search']
    Input Text    xpath=//input[@type='search']    TC017_Auto cash lift when catch up billing runs
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[6]
    ${ContractNo}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[6]
    Select From List By Label    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[8]/select[1]    Posted
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[7]
    ${CustomerNo}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[3]
    Element Text Should Be    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[7]    Posted
    Element Should Be Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Invoice / Credit Memo')]
    Wait Until Element Is Visible    xpath=//input[@name='contractNumber']
    Log To Console    Waiting For Database
    Sleep    30s
    Input Text    xpath=//input[@name='contractNumber']    ${ContractNo}
    Input Text    xpath=//input[@name='fromDate']    ${dates.CurrentDate}
    Comment    Input Text    xpath=//input[@name='toDate']    ${dates.CurrentDate}
    Click Element    xpath=//input[@name='search']
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]
    ${InvoiceNo}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Cash')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Cash')][@href='#']
    Click Element    xpath=//a[contains(text(), 'Add Cash Receipt Log')]
    Sleep    15s
    Element Should Be Visible    id=bankAccountId
    Select From List By Label    id=bankAccountId    (12570-02663) Bank of America (checks) - USD
    Input Text    id=depositDate    05-Oct-2017
    Input Text    id=bankControlTotal    50.00
    Click Button    id=addBtn
    Sleep    10
    Element Should Be Visible    id=checkNo
    Input Text    id=checkNo    59
    Input Text    id=payor    Robert
    Input Text    xpath=//td[@id='CustomerNo']//input[@id='customerNo']    ${CustomerNo}
    Input Text    id=amount    50.00
    Click Button    id=saveBtn
    Sleep    10
    ${TrackNo}    Get Text    xpath=//table[@id='dataTable1']/tbody/tr[1]/td[1]/span/a
    Element Should Be Visible    id=postLogBtn
    Click Button    id=postLogBtn
    Get Alert Message    Confirm Action
    Sleep    20
    Wait Until Element Is Visible    xpath=//table[@id='dataTable1']//tbody[1]//tr[1]//td[10]/a
    Sleep    5
    Run Keyword If    "${CashAppStatus}" == "Unapplied"    Variable.Click On Link
    ...    ELSE    ${ErMsg}
    Scroll Page To Location    0    1000
    Click Button    id=searchForInvoices
    Wait Until Page Contains Element    xpath=//table[@id='myTable']
    Input Text    xpath=//input[@type='search']    ${InvoiceNo}
    Click Element    xpath= //table[@id='myTable']//tbody[1]//tr[1]//td[13]//input[1]
    Click Button    id=cashAppMode
    Sleep    7s
    Scroll Page To Location    0    1000
    Checkbox Should Be Selected    id=invoiceInFull
    Clear Element Text    id=invoiceGrossAmounts
    Input Text    id=invoiceGrossAmounts    50.00
    Press Key    id=invoiceGrossAmounts    \\13
    Sleep    3s
    Element Text Should Be    id=balanceText    0.00
    Click Button    id=submitApprv
    Get Alert Message    Confirm Action
    Sleep    15s
    Run Keyword If    "${CashReceiptsAppStatus}" == "Submitted"    Variable.Click On Link
    ...    ELSE    ${ErMsg}
    Scroll Page To Location    0    1000
    Wait Until Element Is Visible    xpath=//input[@name='post']
    Click Element    xpath=//input[@name='post']
    Get Alert Message    Confirm Action
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Add Miscellaneous Billing')]
    Wait Until Element Is Visible    xpath=//input[@name='customerNo']
    Input Text    xpath=//input[@name='customerNo']    ${CustomerNo}
    Press Key    xpath=//input[@name='customerNo']    \\13
    Sleep    3s
    Comment    Select From List By Label    id=media    36300 - Network
    Select From List By Label    id=billType    Merchandising
    Click Button    id=BI11add
    Comment    Sleep    10s
    Wait Until Element Is Visible    xpath=//input[@name='amountDue']
    Click Element    xpath=//input[@name='amountDue']
    Repeat Keyword    4times    Press Key    xpath=//input[@name='amountDue']    \\127
    Input Text    xpath=//input[@name='amountDue']    200
    Input Text    id=productNo    F8201500000
    Wait Until Element Is Visible    xpath=//textarea[@name='description']
    Input Text    xpath=//textarea[@name='description']    TC001_Approve cash application with auto cash lift via full amount credit memo
    Click Button    id=save
    Scroll Page To Location    0    1000
    Wait Until Element Is Visible    id=BI11submitApprv
    Sleep    5s
    ${MiscNo}    Get Text    xpath=//td[@class='data3'][@id='MiscBillingScheduleID']
    Click Button    id=BI11submitApprv
    Title Should Be    Home Page
    Element Should Be Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Miscellaneous Billing')]
    Wait Until Element Is Visible    id=referenceNumber
    Input Text    id=referenceNumber    ${MiscNo}
    Click Element    xpath=//input[@class='formButton'][@name='search']
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[10]/a[1]
    Click Link    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[10]/a[1]
    Scroll Page To Location    0    1000
    Wait Until Element Is Visible    id=BI11approve
    Click Button    id=BI11approve
    Sleep    5s
    Element Should Be Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Invoice / Credit Memo')]
    Wait Until Element Is Visible    id=fromDate
    Input Text    id=fromDate    ${dates.CurrentDate}
    Input Text    id=contractNumber    ${MiscNo}
    Click Element    xpath=//input[@type='submit'][@name='search']
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]
    ${InvoiceNo}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]
    Element Should Be Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Add Miscellaneous Credit Memo')]
    Sleep    4s
    Wait Until Element Is Visible    xpath=//input[@name='customerNumber'][@type='text']
    Input Text    xpath=//input[@name='customerNumber'][@type='text']    ${CustomerNo}
    Click Element    xpath=//label[@for='customerNumber']
    Input Text    xpath=//textarea[@name='userComments']    TC001_Approve cash application with auto cash lift via full amount credit memo
    Input Text    xpath=//textarea[@name='creditMemoComment']    TC001_Approve cash application with auto cash lift via full amount credit memo
    Click Button    id=BI14save
    Get Alert Message    Confirm Action
    Click Button    id=BI14add
    Get Alert Message    Confirm Action
    Wait Until Element Is Visible    id=fromDate
    Input Text    id=fromDate    ${dates.CurrentDate}
    Input Text    id=invoiceNumber    ${InvoiceNo}
    Click Element    xpath=//input[@type='submit'][@name='search']
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[13]/input[1]
    Click Element    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[13]/input[1]
    Click Button    id=cashAppMode
    Wait Until Element Is Visible    id=creditFull1
    Click Element    id=creditFull1
    Sleep    3s
    Click Button    id=BI14submitApprv
    Get Alert Message    Confirm Action
    Element Should Be Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Approve Miscellaneous Credit Memo')]
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[13]/select[1]
    Select From List By Label    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[13]/select[1]    Post
    Click Button    id=submitForApprove
    Wait Until Element Is Visible    xpath=//table[@id='myTable1']/tbody[1]/tr[1]/td[7]
    Element Text Should Be    xpath=//table[@id='myTable1']/tbody[1]/tr[1]/td[7]    Approved
    Element Should Be Visible    xpath=//a[contains(text(), 'Customer')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Customer')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Customer')]
    Wait Until Element Is Visible    xpath=//input[@name='customerNumber']
    Input Text    xpath=//input[@name='customerNumber']    ${CustomerNo}
    Click Element    xpath=//input[@name='searchSubmit']
    Wait Until Element Is Visible    xpath=//table[@id='resultTable']/tbody[1]/tr[1]/td[5]/a[1]
    Click Link    xpath=//table[@id='resultTable']/tbody[1]/tr[1]/td[5]/a[1]
    Wait Until Element Is Visible    id=transactionStatus1
    Select Checkbox    id=transactionStatus1
    Select Checkbox    id=transactionTypes3
    Click Button    id=buttonRefresh1
    Wait Until Element Is Visible    xpath=//input[@type='search']
    Input Text    xpath=//input[@type='search']    ${InvoiceNo}
    Wait Until Element Is Visible    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[2]/a[1]
    Click Link    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[2]/a[1]
    Comment    Wait Until Element Is Visible    id=CashAppStatus
    Comment    Element Text Should Be    id=CashAppStatus    Posted
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Invoice / Credit Memo')]
    Wait Until Element Is Visible    xpath=//input[@name='invoiceNumber']
    Input Text    xpath=//input[@name='invoiceNumber']    ${InvoiceNo}
    Click Element    xpath=//input[@value='search'][@name='search']
    Wait Until Element Is Visible    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]
    Click Link    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[1]/a[1]
    Close Browser

TC36-WithNoError
    Input Text    ${SFB-ReasonForRequest}    This is a test - TC34
    ${ContractNo}    Get Text    xpath=//table[@id='installmentData']/tbody[1]/tr[1]/td[1]
    Click Button    id=submitApprv
    Wait Until Element Is Visible    ${BillingTab}    timeout=45s
    Mouse Over    ${BillingTab}
    Click Element    ${SearchForBilling}
    Wait Until Element Is Visible    ${SFB-ContractNum-Input}    timeout=45s
    Input Text    ${SFB-ContractNum-Input}    ${ContractNo}
    Click Button    ${SFB-SearchSubmit-Btn}
    Wait Until Element Is Visible    xpath=//table[@id='ContractSearchTable']/tbody[1]/tr[1]/td[3]/a[1]    timeout=40s
    Click Link    xpath=//table[@id='ContractSearchTable']/tbody[1]/tr[1]/td[3]/a[1]

TC34-WithNoError
    Wait Until Element Is Visible    ${SFB-ReasonForRequest}    timeout=45s
    Input Text    ${SFB-ReasonForRequest}    This is a test - TC34
    ${ContractNo}    Get Text    xpath=//table[@id='installmentData']/tbody[1]/tr[1]/td[1]
    Click Button    id=submitApprv
    Wait Until Element Is Visible    ${BillingTab}    timeout=45s
    Mouse Over    ${BillingTab}
    Click Element    ${SearchForBilling}
    Wait Until Element Is Visible    ${SFB-ContractNum-Input}    timeout=45s
    Input Text    ${SFB-ContractNum-Input}    ${ContractNo}
    Click Button    ${SFB-SearchSubmit-Btn}
    Wait Until Element Is Visible    xpath=//table[@id='ContractSearchTable']/tbody[1]/tr[1]/td[3]/a[1]    timeout=40s
    Click Link    xpath=//table[@id='ContractSearchTable']/tbody[1]/tr[1]/td[3]/a[1]
    Sleep    2s

TC33_Request for SBR at contract level
    Wait Until Element Is Visible    id=reasonForRequest    timeout=45s
    Input Text    id=reasonForRequest    This is a test - EM
    Click Button    id=submitApprv
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']    timeout=45s
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Approve Special Bill Runs')]
    Wait Until Element Is Visible    xpath=//div[@id='myTable_filter']/label[1]/input[1]    timeout=45s
    Input Text    xpath=//div[@id='myTable_filter']/label[1]/input[1]    This is a test - EM
    Press Key    xpath=//div[@id='myTable_filter']/label[1]/input[1]    \\09
    Sleep    5s
    Select From List By Label    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[8]/select[1]    Posted
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//td[contains(text(),'Posted')]    timeout=45s
    Sleep    3s
    ${Misc}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[6]
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']    timeout=45s
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Billing Schedule')]
    Sleep    10s
    Wait Until Element Is Visible    id=contractNumber    timeout=45s
    Checkbox Should Be Selected    id=searchType1
    Input Text    id=referenceNumber    ${Misc}
    Click Button    id=searchSubmit
    Wait Until Element Is Visible    xpath=//table[@id='ContractSearchTable']/tbody[1]/tr[1]/td[2]    timeout=45s

TC37-WithNoError
    Wait Until Element Is Visible    id=reasonForRequest    timeout=45s
    Input Text    id=reasonForRequest    TC37_TEST_RequestForSBR
    Click Button    id=submitApprv
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']    timeout=45s
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Approve Special Bill Runs')]
    Wait Until Element Is Visible    xpath=//div[@id='myTable_filter']/label[1]/input[1]    timeout=45s
    Comment    Input Text    xpath=//div[@id='myTable_filter']/label[1]/input[1]    TC37_TEST_RequestForSBR
    Comment    Press Key    xpath=//div[@id='myTable_filter']/label[1]/input[1]    \\09
    Wait Until Keyword Succeeds    45s    .2s    Input Text    xpath=//input[@type='search']    TC37_TEST_RequestForSBR
    Wait Until Keyword Succeeds    45s    .2s    Select From List By Label    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[8]/select[1]    Posted
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//td[contains(text(),'Submitted')]    timeout=45s
    Sleep    3s
    ${Misc}    Get Text    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[6]
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Billing')][@href='#']    timeout=45s
    Mouse Over    xpath=//a[contains(text(), 'Billing')][@href='#']
    Click Element    xpath=//a[contains(text(),'Search For Billing Schedule')]
    Wait Until Keyword Succeeds    45s    .2s    Wait Until Element Is Visible    id=contractNumber
    Click Element    id=searchType1
    Input Text    id=referenceNumber    ${Misc}
    Click Button    id=searchSubmit
    Wait Until Element Is Visible    xpath=//a[contains(text(),'${Misc}')]    timeout=45s

TC39_ViewInvoiceViaViewBillingSchedule-True
    Wait Until Element Is Visible    ${SFB-ReasonForRequest}    timeout=45s
    Input Text    ${SFB-ReasonForRequest}    This is a test
    Click Button    id=submitApprv
    Mouse Over    ${BillingTab}
    Click Element    ${SearchForBilling}
    Wait Until Keyword Succeeds    100s    .2s    Input Text    ${SFB-ContractNum-Input}    ${ContractNo}
    Click Element    ${SFB-OutputContract}
    Click Button    ${SFB-SearchSubmit-Btn}
    Wait Until Element Is Visible    xpath=//a[contains(text(),'${ContractNo}')]    timeout=45s
    Click Link    xpath=//a[contains(text(),'${ContractNo}')]
    Wait Until Element Is Visible    xpath=//td[contains(text(),'${ContractNo}')]    timeout=45s
    Scroll Page To Location    0    600
    Click Link    xpath=//tbody[1]/tr[1]/td[5]/a[1]
    Wait Until Keyword Succeeds    45s    .2s    input text    xpath=(//input[@class='dx-texteditor-input'])[11]    N/A
    ${InvoiceNo}    Get Text    xpath=//table[1]/tbody[1]/tr[1]/td[11]/a[1]
    Wait Until Keyword Succeeds    45s    .2s    Click Link    xpath=//table[1]/tbody[1]/tr[1]/td[11]/a[1]
    Wait Until Element Is Visible    xpath=//td[contains(text(),'${InvoiceNo}')]    timeout=45s

TC40_View start or change order template via View Billing Schedule screen-True
    Wait Until Element Is Visible    ${SFB-ReasonForRequest}    timeout=45s
    Input Text    ${SFB-ReasonForRequest}    This is a test
    Click Button    id=submitApprv
    Mouse Over    ${BillingTab}
    Click Element    ${SearchForBilling}
    Wait Until Keyword Succeeds    100s    .2s    Input Text    ${SFB-ContractNum-Input}    FCN14S001Y
    Input Text    ${SFB-ContractNum-Input}    FCN14S001Y
    Select Checkbox    ${SFB-OutputContract}
    Click Button    ${SFB-SearchSubmit-Btn}
    Wait Until Element Is Visible    xpath=//a[contains(text(),'${ContractNo}')]    timeout=45s
    Click Link    xpath=//a[contains(text(),'${ContractNo}')]
    Wait Until Keyword Succeeds    45s    .2s    input text    xpath=(//input[@class='dx-texteditor-input'])[11]    N/A
    Scroll Page To Location    0    600
    ${InvoiceNo}    Get Text    xpath=//table[1]/tbody[1]/tr[1]/td[11]/a[1]
    Wait Until Keyword Succeeds    45s    .2s    Click Link    xpath=//table[1]/tbody[1]/tr[1]/td[11]/a[1]
    Wait Until Element Is Visible    xpath=//td[contains(text(),'${InvoiceNo}')]    timeout=45s

NavigateToHomePage
    Comment    Go To    https://spti-dev3.spe.sony.com/c2c/
    Comment    Go To    https://c2c-qa3.spe.sony.com/c2c/
    Comment    Go To    https://c2c-qa5.spe.sony.com/c2c/
    Go To    @{OpenBrowser}[1]
    Comment    Go To    https://c2c-qa4.spe.sony.com/c2c/
    Comment    Click Element    xpath=//a[@href='/c2c/login']
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Home Page
