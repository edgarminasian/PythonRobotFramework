*** Variables ***
${AddMiscCreditMemo}    xpath=//a[contains(text(),'Add Miscellaneous Credit Memo')]
${AMCM-CustNum-Input}    xpath=//input[@name='customerNumber']
${AMCM-UserComm-Input}    xpath=//textarea[@name='userComments']
${AMCM-Add-btn}    id=BI14add
${AMCM-ContractNum-Input}    xpath=//input[@name='contractNumber']
${AMCM-CashAppMode-Btn}    id=cashAppMode
${AMCM-CreditFull-Select}    id=creditFull1
${AMCM-B11SubApp-btn}    id=BI14submitApprv
${AMCM-B11App-btn}    id=BI14approve
${AMCM-StatusId}    id=CMStatusID
${AMCM-CustomerNum}    xpath=//input[@name='customerNumber'][@type='text']
${AMCM-CustomerNumLabel}    xpath=//label[@for='customerNumber']
${AMCM-CreditMemoComment}    xpath=//textarea[@name='creditMemoComment']
${AMCM-BI14Save}    id=BI14save
${AMCM-FromDate-Input}    id=fromDate
${AMCM-InvoiceNum}    id=invoiceNumber
${AMCM-SearchBtn}    xpath=//input[@type='submit'][@name='search']
${App-MiscCreditMemo}    xpath=//a[contains(text(),'Approve Miscellaneous Credit Memo')]
${APMCM-SubmitForApp-btn}    id=submitForApprove
