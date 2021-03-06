*** Variables ***
${CashTab}        xpath=//a[contains(text(), 'Cash')][@href='#']
${AddCashReceiptLog}    xpath=//a[contains(text(), 'Add Cash Receipt Log')]
${bAccountId}     xpath=//select[@name='bankAccountId']
${CustomerNo}     xpath=//td[@id='CustomerNo']//input[@id='customerNo']
${SearchForCash}    xpath=//a[contains(text(),'Search For Cash')]
${DepositDate}    id=depositDate
${bankControlTotal}    id=bankControlTotal
${addBtn}         id=addBtn
${ChkNo}          id=checkNo
${Payor}          id=payor
${AMOUNT}         id=amount
${SaveBtn}        id=saveBtn
${AddDeduction_Btn}    id=addDeduction
${DeductionType_Select}    id=deductionTypes0
${DeductionAmt_Input}    xpath=//input[@class='deductionAmount']
${DeductionDesc_Input}    id=deductionDescriptions0
${DeductionAmt-Input}    id=deductionAmounts0
${Remove_Link}    xpath=//a[contains(text(),'remove')]
${PostLogBtn}     id=postLogBtn
${SubmitForApproval_Btn}    id=submitForApproval
${TrackingNo_Input}    id=TrackingNumber
${Void_Btn}       id=voidBtn
${TrackNo_Link}    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[1]/span[1]/a[1]
${CashReceivedAmt_Input}    xpath=//input[@name='amount']
${Submitted_Link}    xpath=//table[@id='dataTable1']/tbody[1]/tr[1]/td[10]/a[1]
${NewComment_Input}    id=newComment
${Unapplied_Link}    xpath=//table[@id='dataTable1']//tbody[1]//tr[1]//td[10]/a
${SearchForInvoice-btn}    id=searchForInvoices
${CashAppMode}    id=cashAppMode
${InvoiceIsFull-Select}    id=invoiceInFull
${InvoiceGrossAmt-Input}    id=invoiceGrossAmounts
${BalanceTxt}     id=balanceText
${Post}           id=post
${AdjustmentReason-Input}    id=adjustmentReasonId
${AddCurrentAcc-btn}    id=AddCurrentAccount
${UnappliedReason-Input}    id=oaUnappliedReasons0
${Adjust-btn}     id=adjust
${oaGrossAmount-Input}    id=oaGrossAmounts
${SearchForAcc-btn}    id=SearchForAccount
${Include-Checkbox}    id=include1
${CustomerRoyalty-Checkbox}    id=customerTypeRoyalty1
${CustomerTypeUnident-Checkbox}    customerTypeUnident1
${SubmitSearch-btn}    xpath=//input[@type='submit'][@name='submitSearch']
${AddGlAcc-btn}    id=addGlAccount
${GLProfitCenter-Select}    id=glProfitCenters
${GLAcc-Select}    id=glAccounts
${GLTerritory-Select}    id=glTerritories
${GLGrossAmt-Input}    id=glGrossAmounts0
${GLComment-Input}    id=glComments0
${CustomerTypeUni}    id=customerTypeUnident1
${GLMarket-Select}    id=glMarkets
${CurrentActMedia-Input}    id=oaMedia0
${PayInFull1-Checkbox}    id=payInFull1
${SubmitThis}     id=submitThis
${ViewLink}       id=viewlink
${ClearAmtBtn}    id=clrAmtBtn
${SubmitThis1-Btn}    id=submitThis1
${CancelThis1-Btn}    id=cancelThis1
${InvoiceManuelDistribution}    id=invoiceManualDistribution
${DeductionAmounts}    id=deductionAmounts
${DeleteBtn}      id=deleteBtn
${SearchForAcc-Submit-Btn}    xpath=//input[@type='submit'][@name='searchSubmit'][@value='search']
${ApplyAmount-input}    id=applyAmount
${ApplyCashToInvoiceDetail}    xpath=//span[text()='Apply Cash to Invoice Detail']
${payInFull-ChkBox0}    payInFull
${InvoiceGrossAmts-ver2}    //table[@id='resultTable']/tbody/tr[1]/td[12]/input[@id='invoiceGrossAmounts']
${SubmitForAprroval}    submitApprv
${ResultTable}    xpath=//table[@id='resultTable']
${InvoiceManualDistProdGrp}    xpath=//table[@id='resultTable']/tbody/tr[1]/td[10]/input[@id='invoiceManualDistributionProdGrp']
${remove-link2}    xpath=//div[@id='body2']//td[@class='removelink']//a[contains(text(),'remove')]
${SearchForAcc-Save-btn}    xpath=//input[@type='submit'][@name='submitSearch'][@value='save']
${addGlProducts-btn}    id=glProducts
