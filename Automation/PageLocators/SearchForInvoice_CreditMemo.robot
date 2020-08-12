*** Variables ***
${SearchForInvoice-CreditMemo}    xpath=//a[@href='/c2c/billing/searchForInvoiceFromMenu'][contains(text(),'Search For Invoice / Credit Memo')]
${SFI_SelectInvoice_Select}    xpath=//table[@id='myTable']/tbody[1]/tr[1]/td[13]/input[1]
${CashAppMode-btn}    id=cashAppMode
${Type2Element}    id=type2
${SFI-FormDate-Input}    id=fromDate
${SFI-ContractNum-Input}    id=contractNumber
${SFI-SearchSubmit}    xpath=//input[@type='submit'][@value='search']
${SFI-InvoiceNum}    id=invoiceNumber
${SFI-Search}     xpath=//input[@type='submit'][@name='search']
${SFI-CustNumber}    id=customerNumber
${Type1Element}    id=type1
${SFI-StartOrderNum}    xpath=//input[@name='startOrderNumber']
${SFI-ViewCollection-Data3}    xpath=//td[@class='data3']/i/a[contains(text(),'View Collection')]
${SFI-ViewAllocation-resultsData}    xpath=//tr[@class='resultsData']/td/a[contains(text(),'View Allocation')]
${SFI-PrintView}    xpath=//input[@value='Print New (pdf)']
${SFI-PrintNet}    xpath=//input[@value='Print Net New (pdf)']
${SFI-PrintCopy}    xpath=//input[@value='Print Copy (pdf)']
${SFI-PrintNewCopy}    xpath=//input[@value='Print Net Copy (pdf)']
${SFI-BillingCredit}    id=BI9credit
${SFI-BillingSchedule}    id=BI9schedule
${SFI-PRINTnew}    xpath=//input[@value='print new (printer)']
${SFI-MytableTbody}    xpath=//table[@id='myTable']/tbody/tr[1]/td[13]/input[1]
${SFI-PrintNetNew}    xpath=//input[@value='print net new (printer)']
${SFI-PrintCopyPrinter}    xpath=//input[@value='print copy (printer)']
${SFI-PrintNewCopyPrinter}    xpath=//input[@value='print net copy (printer)']
${SFI-BillingPrintNew}    id=BI13Aprintnew
${SFI-BillingPrintCopy}    id=BI13Aprintcopy
${SFI-invoiceHistoryComment}    invoiceHistoryComment
${SFI-ADD-btn}    add
${SFI-CommentsValue}    //tr[@class='resultsData']/td[text()='${commentsVal}']
${SFI-UserComment}    userComment
${SFI-UpdateComments}    BI9UpdateComments
${SFI-InvoiceDeliveryLabel}    invoicedeliveryid
${SFI-CashReceipt}    xpath=//td[text()='Cash Receipt']//following-sibling::td/a
${SFI-SelectAll-element}    xpath=//input[@value='Select All']
${SFI-UnSelectAll-element}    xpath=//input[@value='Unselect All']
${SFI-Updatecomm-Ver2}    updateComment
${SFI-SaveNetNew}    xpath=//input[@value='save net new']
${SFI-SaveCopy}    xpath=//input[@value='save copy']
${SFI-SaveNetCopy}    xpath=//input[@value='save net copy']
${SFI-SaveNew}    xpath=//input[@value='save new']
${SFI-ZipDownload-MyTable}    xpath=//table[@id='myTable']/tbody/tr[1]/td[13]/input[1]
