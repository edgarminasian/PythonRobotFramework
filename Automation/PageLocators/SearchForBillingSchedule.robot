*** Variables ***
${BillingTab}     xpath=//a[contains(text(), 'Billing')][@href='#']
${SearchForBilling}    xpath=//a[contains(text(),'Search For Billing Schedule')][@href='/c2c/billing/searchForBillingSchedule']
${SFB-ContractNum-Input}    id=contractNumber
${SFB-SearchType2-Btn}    id=searchType2
${SFB-SearchType1-Btn}    id=searchType1
${SFB-NetDueOnly-Select}    id=isIfNetDueOnly1
${SFB-SearchSubmit-Btn}    id=searchSubmit
${SFB-Unbilled-Select}    id=isUnbilled1
${SFB-Licensor}    id=licensor
${SFB-SearchSubmit-btn}    id=searchSubmit
${SFB-SpecialBillRun1-btn}    xpath=(//tbody//tr[1]//td[1]//div//div//span[1])[2]
${SFB-SpecialBillRun2-btn}    //tbody//tr[2]//td[1]//div//div//span[1]
${SFB-SpecialBillRun3-btn}    xpath=//tbody//tr[3]//td[1]//div//div//span[1]
${SFB-CreatSpecialBill-btn}    xpath=//input[@value='create special bill run']
${SFB-ReasonForRequest}    id=reasonForRequest
${SFB-ReferenceNo}    //input[@id='referenceNumber']
${SFB-CustomerNo}    //input[@id='customerNumber']
${SFB-ReasonForRequest}    id=reasonForRequest
${SFB-STARToRDER}    id=startOrder
${SFB-SBRApp}     id=SBRApproved1
${SFB-CreateSpecialBillRun-Btn}    xpath=//input[@value='create special bill run']
${SFB-OverrideDueDate}    id=overrideDueDate1
${SFB-DueDate}    id=dueDate
${SFB-fromBilling}    fromBillingAmount
${SFB-SubmitForAPPROVAL}    id=submitApprv
${SFB-OutputContract}    id=outputContract1
${SFB-ContractNum-Ver2}    xpath=//input[@name='contractNumber']
