*** Settings ***
Library           DatabaseLibrary
Library           Selenium2Library
Library           DateTime
Library           Collections
Library           ExcelLibrary
Library           OperatingSystem
Library           ArchiveLibrary
Resource          2FALogin.robot
Resource          Variable.robot
Resource          Global_Variables.robot

*** Variables ***
${cashAppStatus}    Unapplied
${BankAmount}     10.0
${CustomerNum}    81491
${i}              ${EMPTY}
${BankAccountId}    (304192791) JP Morgan Chase Bank - USD
${CustomerNumProdEnanbled}    214960
${BankAccountIdPE}    (093-9923) Mellon Bank - USD
${BankAmountPE}    10.00

*** Keywords ***
Connect to database keyword
    #Connect To Database Using Custom Params    cx_Oracle    'c2c','c0nn9a_c2cc2c','uspxh006d1.spe.sony.com:30513/COSQC2C1'
    Connect To Database Using Custom Params    cx_Oracle    'C2C','c0nn_9ac2iqt$M','uspxh006d1.spe.sony.com:30513/COSQITSM'
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','c0nnc2cd3v_c2c','uspxh007d3.spe.sony.com:30513/COSDC2C3'
    #Connect To Database Using Custom Params    cx_Oracle    'C2C','c0nn_rpms33tc','uspxh020d4.spe.sony.com:30513/COSDRPM8'
    #Connect To Database Using Custom Params    cx_Oracle    'c2c','c0nn_9r9mc2','uspxh006d1.spe.sony.com:30513/COSQRPM1'

Login Into Application
    Open Browser    https://c2c-qa.spe.sony.com/c2c/    chrome
    Comment    Open Browser    https://c2c-qa4.spe.sony.com/c2c/    chrome
    Comment    Open Browser    https://c2c-qa3.spe.sony.com/c2c/    chrome
    Comment    Open Browser    https://c2c-qa5.spe.sony.com/c2c/    chrome
    #Maximize Browser Window
    Input Text    id=username    srais
    Sleep    35
    Element Should Be Visible    xpath=//span[text()='Welcome:']

Error Msg
    Log To Console    Condition Failed

Click On Link
    Click Link    ${CashAppStatus_Locator}

PassMsg
    Log To Console    Required details are successfully displayed

CreateAddCashReceipt
    [Arguments]    ${CustomerNum}    ${BankAmount}    ${BankAccountId}
    Mouse Over    xpath=//ul[@id='menu']/li[4]/a
    Click Link    css=a[href$='addCashReceiptsLogFromMenu']
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Add Daily Cash Receipt Log
    Select From List By Label    bankAccountId    ${BankAccountId}
    Wait Until Keyword Succeeds    100s    .2s    Input Text    id=bankControlTotal    ${BankAmount}
    Click Button    id=addBtn
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Add Cash Receipt
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Add Cash Receipt
    Input Text    name=customerNo    ${CustomerNum}
    Input Text    id=amount    ${BankAmount}
    Click Button    id=saveBtn
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Modify Cash Receipts Log
    Wait Until Page Contains Element    id=dataTable1
    Element Should Be Visible    id=postLogBtn
    Click Button    id=postLogBtn
    Handle Alert    action=ACCEPT
    Wait Until Keyword Succeeds    100s    .2s    Wait Until Element Is Visible    ${CashAppStatusLocator}
    ${cashAppStatus}    Get Text    ${CashAppStatusLocator}
    Wait Until Keyword Succeeds    100s    .2s    Wait Until Element Is Visible    ${TrackNum_Locator}
    ${TrackNum}    Get Text    ${TrackNum_Locator}
    Sleep    3
    Run Keyword If    "${cashAppStatus}"=="Unapplied"    Resources.Click On Link
    ...    ELSE    Error Msg
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    Apply Cash for Licensee
    [Return]    ${TrackNum}

Download should be done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Comment    Length Should Be    ${files}    1    Should be only one file in the download folder
    Comment    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    [Return]    ${file}

Search Invoice
    Wait Until Element Is Visible    xpath=//ul[@id='menu']/li[3]/a    timeout=45s
    Mouse Over    xpath=//ul[@id='menu']/li[3]/a
    Click Link    css=a[href$='searchForInvoiceFromMenu']
    Title Should Be    Invoice Search
    Comment    ${attribute}    Get Element Attribute    type1@checked
    Comment    Run Keyword If    "${attribute}"=="true"    Log To Console    Search for Invoice/Credit Memo screen is displayed with default option as Invoice
    Wait Until Keyword Succeeds    .45s    .2s    Input Text    id=customerNumber    ${CustomerNum}
    Wait Until Keyword Succeeds    80s    .3s    Click Element    xpath=//input[@name='search']
    Wait Until Keyword Succeeds    100s    .2s    Wait Until Element Is Visible    //table[@id='myTable']/tbody/tr
    ${count}    Get Matching Xpath Count    //table[@id='myTable']/tbody/tr
    Run Keyword If    ${count}>0    PassMsg

Click any Invoice num
    Click Link    xpath=//table[@id='myTable']/tbody/tr[1]/td[1]/a
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    View Invoice Detail

Click any Credit memo num
    Click Link    xpath=//table[@id='myTable1']/tbody/tr[1]/td[1]/a
    Wait Until Keyword Succeeds    100s    .2s    Title Should Be    View Credit Memo Details for Invoices

Search Credit Memo
    Mouse Over    xpath=//ul[@id='menu']/li[3]/a
    Click Link    css=a[href$='searchForInvoiceFromMenu']
    Title Should Be    Invoice Search
    Comment    ${attribute}    Get Element Attribute    type1@checked
    Comment    Run Keyword If    "${attribute}"=="true"    Log To Console    Search for Invoice/Credit Memo screen is displayed with default option as Invoice
    Wait Until Keyword Succeeds    .45s    .2s    Click Element    id=type2
    Input Text    id=customerNumber    ${CustomerNum}
    Click Element    xpath=//input[@name='search']
    Wait Until Keyword Succeeds    100s    .2s    Wait Until Element Is Visible    //table[@id='myTable1']/tbody/tr
    ${count}    Get Matching Xpath Count    //table[@id='myTable1']/tbody/tr
    Run Keyword If    ${count}>0    PassMsg

NavigateToModifyCustProfile
    Input Text    id=customerNumber    ${CustomerNum}
    Click Element    xpath=//input[@name='searchSubmit']
    Wait Until Keyword Succeeds    100s    .2s    Click Link    xpath=//table[@id='resultTable']/tbody/tr[1]/td/a[text()='Profile']
    Wait Until Keyword Succeeds    100s    .2s    Element Should Be Visible    xpath=//span[text()='Modify Customer Profile']

Date and Time Converter
    ${time_now}    Get Time
    ${date_to_search_for}=    Convert Date    ${time_now}    date_format=%Y-%M-%d %H:%m:%S    result_format=%d-%b-%Y    exclude_millis=yes
