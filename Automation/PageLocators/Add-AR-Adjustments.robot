*** Variables ***
${A/RTab}         xpath=//a[@href='#'][contains(text(),'A/R')]
${AddA/R}         xpath=//a[contains(text(),'Add AR Adjustments')]
${ADD-AR-CustomerNo-Input}    id=customerNumber
${ADDAR-AdjustmentReason-Select}    id=adjustmentReason
${ADDAR-SearchForInvoice-Btn}    xpath=//input[@name='srcInvoiceBtn'][@value='Search For Invoice']
${ADDAR-SubmitForApp-btn}    xpath=//input[@value='submit for approval']
${ADDAR-InvoiceNo-Link}    xpath=//table[@id='resultTable']/tbody[1]/tr[1]/td[1]/a[1]
${ADDAR-AdjComment-Input}    id=adjustmentComment
${ADDAR-CashApp-btn}    id=cashAppMode
${ADDAR-SubmitForApp}    xpath=//input[@name='submitBtn'][@value='submit for approval']
${AAA-Submit-Btn}    id=submitBtn
${ADDAR-SearchInvoice-btn}    xpath=//input[@name='srcInvoiceBtn']
${ADDAR-ReleaseBtn}    releaseBtn
${ADDAR-RejectBtn}    rejectBtn
${ADDAR-CancelBtn}    cancelBtn
