*** Variables ***
${ContractTab}    xpath=//a[contains(text(), 'Contract')][@href='#']
${SearchForContract}    xpath=//a[contains(text(),'Search For Contract')]
${SFC-Licensee}    id=licensee
${SFC-Search}     xpath=//input[@type='submit'][@name='searchSubmit']
${SFC-downArrow}    css=input[src$='downArrow.png']
${SFC-ReferenceNum}    id=referenceNumber
${SFC-StartOrderNum}    //input[@id='referenceNumber']
${SFC-StartOrderPrepDate}    id=startOrderPrepDate
${SFC-SearchContractTitle}    xpath=//span[contains(text(),'Search Contract')]
