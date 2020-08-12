*** Variables ***
${ApproveCashApplications}    xpath=//a[contains(text(),'Approve Cash Applications')][@href='/c2c/cashapp/searchForCashResults?filter=approve']
${History_Link}    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[2]/a[1]
${AppCashApp_TrackNo_Link}    xpath=/html[1]/body[1]/div[3]/table[1]/tbody[1]/tr[1]/td[1]/table[1]/tbody[1]/tr[3]/td[1]/div[1]/table[1]/tbody[1]/tr[1]/td[2]/a[1]
${ACA-Search-Input}    xpath=//input[@type='search']
${ACA-Update-btn}    //input[@id='updateBtn']
${ACA-ReceiptStatus}    id=ReceiptStatus
