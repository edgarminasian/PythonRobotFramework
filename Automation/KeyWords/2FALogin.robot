*** Settings ***
Library           Selenium2Library    timeout=15    implicit_wait=15
Library           Collections
Library           OracleLibrary
Resource          2FALogin.robot
Library           ../automate_2FA.py
Library           DatabaseLibrary

*** Variables ***
${token}          None
${run_loop}       False
${dash_flag}      None
${run_loop}       False
${phone_is_reserved}    reservePhone
${run_loop}       False
${token_code_temp}    getToken
${PHONE_NUMBER_2FA}    14242012684
${token_code}     None
${ADMIN_USER_NAME}    automfa5
${ADMIN_PASSWORD}    Auto0005
${time_stamp}     None
${reserve_tries}    500
${Database}       'dbo/c0nn_9ad80@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=uspxh006d1.spe.sony.com)(PORT=30513))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=COSQITSM)))'

*** Keywords ***
Login_To_SailPoint_2FA
    AccessCheck
    Set Suite Variable    ${run_loop}    False
    set suite variable    ${teardown}    RUN
    2FALogin.Reserve_Phone_Keyword
    : FOR    ${k}    IN RANGE    0    3
    \    2FALogin.getting_token_loop
    \    run keyword if    '${run_loop}' == 'True'    run keywords    sleep    1s
    \    ...    AND    2FALogin.Enter_Token
    \    ...    AND    2FALogin.Test_Dashboard
    \    ...    ELSE    run keywords    Sleep    1s
    \    ...    AND    2FALogin.Resend_Token
    \    ...    AND    set suite variable    ${dash_flag}    Not Home Page
    \    run keyword if    '${dash_flag}' == 'Home Page'    run keywords    Sleep    1s
    \    ...    AND    Exit For Loop
    Release Phone    ${PHONE_NUMBER_2FA}    ${time_stamp}
    log to console    Releasing Phone Number
    set suite variable    ${teardown}    NO
    set suite variable    ${time_stamp}    None
    set suite variable    ${token}    False
    set suite variable    ${run_loop}    None
    set suite variable    ${dash_flag}    None
    run keyword if    ${k} > 3    run keywords    sleep    1
    ...    AND    Fail    After 3 times was still unsuccessful

Test_Dashboard
    Run Keyword And Ignore Error    Dismiss Alert
    ${title}    get title
    log to console    Title:
    log to console    ${title}
    run keyword if    '${title}' == 'Home Page'    run keywords    sleep    1s
    ...    AND    Log to console    Title is Home Page! Logged in Successfully!
    ...    AND    set suite variable    ${run_loop}    False
    ...    ELSE    run keywords    sleep    1s
    ...    AND    Log to console    Title is not Home Page, regetting token
    ...    AND    2FALogin.Resend_Token
    set suite variable    ${dash_flag}    ${title}

Resend_Token
    [Documentation]    Reload page and log in again to trigger another token send
    Log to console    Relogging in and resending the token
    reload page
    sleep    5s
    2FALogin.Login_User
    sleep    5s

Reserve_Phone_Keyword
    [Documentation]    Logic to reserve a phone number
    : FOR    ${i}    IN RANGE    0    ${reserve_tries}
    \    ${phone_is_reserved}=    reservePhone    ${PHONE_NUMBER_2FA}
    \    log to console    Trying to reserve phone!
    \    run keyword if    '${phone_is_reserved}' is not 'None' and '${phone_is_reserved}' is not 'null'    run keywords    2FALogin.Login_User
    \    ...    AND    set suite variable    ${time_stamp}    ${phone_is_reserved}
    \    ...    AND    log to console    Phone has been reserved at this time:
    \    ...    AND    log to console    ${time_stamp}
    \    ...    AND    Exit For Loop
    \    ...    ELSE    run keywords    sleep    10s
    \    ...    AND    log to console    Phone Number is already taken, waiting for it to be released
    run keyword if    ${i} > ${reserve_tries}    Fail    \nThe phone cannot be reserved after ${reserve_tries} tries!

Login_User
    [Documentation]    Logging in the front page with testapp user
    wait until element is visible    id=username
    input text    id=username    ${ADMIN_USER_NAME}
    wait until element is visible    id=PASSWORD
    input text    id=PASSWORD    ${ADMIN_PASSWORD}
    wait until element is visible    id=Enter
    click element    id=Enter
    Wait Until Element Is visible    xpath=//input[@name='NEWPASSWORD']    timeout=20s

Enter_Token
    [Documentation]    Entering Token into token field
    log to console    Trying to log in with token code...
    wait until element is visible    xpath=//input[@id='NEWPASSWORD']
    input text    xpath=//input[@id='NEWPASSWORD']    ${token_code}
    wait until element is visible    xpath=//input[@id='Enter']
    click element    xpath=//input[@id='Enter']
    sleep    2s

getting_token_loop
    : FOR    ${k}    IN RANGE    0    5
    \    ${token_code_temp}=    getToken    ${PHONE_NUMBER_2FA}    ${time_stamp}
    \    log to console    Getting Token....
    \    log to console    ${token_code_temp}
    \    run keyword if    '${token_code_temp}' == '403'    run keywords    log to console    Phone Number is not Reserved
    \    ...    AND    set suite variable    ${run_loop}    False
    \    ...    AND    Fail    Phone Number is not reserved
    \    ...    ELSE IF    '${token_code_temp}' == 'resend'    run keywords    log to console    Still waiting for token
    \    ...    AND    sleep    10s
    \    ...    AND    set suite variable    ${token_code}    ${token_code_temp}
    \    ...    AND    set suite variable    ${run_loop}    False
    \    ...    ELSE    run keywords    log to console    Token is:
    \    ...    AND    log to console    ${token_code_temp}
    \    ...    AND    set suite variable    ${token_code}    ${token_code_temp}
    \    ...    AND    set suite variable    ${run_loop}    True
    \    ...    AND    exit for loop

TearDownKeyword
    [Documentation]    TearDownKeyword
    run keyword if    '${teardown}' != 'NO'    releasePhone    ${PHONE_NUMBER_2FA}    ${time_stamp}
    ...    ELSE    log to console    \n2FA Login was Successful!

AccessCheck
    Connect To Database Using Custom Params    cx_Oracle    ${Database}
    ${x}    DatabaseLibrary.Row Count    select * from dbo.developers where userid = '${ADMIN_USER_NAME}'
    Run Keyword If    "${x}" == "0"    AccessScripts
    ...    ELSE    Log To Console    User ${ADMIN_USER_NAME} already have access.

AccessScripts
    DatabaseLibrary.Set Auto Commit
    ${developers}    DatabaseLibrary.Execute Sql String    insert into dbo.developers values ('${ADMIN_USER_NAME}')
    ${InsertContact}    DatabaseLibrary.Execute Sql String    insert into contact (CONTACTID,CONTACTFIRSTNAME,CONTACTLASTNAME,SPECONTACTFLAG,STATUSID,LASTMODDTTM) values (CONTACT_SEQ.nextval,'${ADMIN_USER_NAME}','${ADMIN_USER_NAME}','Y',272,sysdate)
    ${UpdateContact}    DatabaseLibrary.Execute Sql String    update contact set CONTACTEMAIL = 'Kusum_Shharma@spe.sony.com', contacttypeid = 15600399, contactsourceid = 505,userlogin='${ADMIN_USER_NAME}',paperpreference = 'A',homeofficemsgonly = 'N' where contactfirstname like '${ADMIN_USER_NAME}'
    ${DeleteUserObjectPermission}    DatabaseLibrary.Execute Sql String    delete from userobjectpermission where userlogin in (select userid from developers d where d.userid = '${ADMIN_USER_NAME}')
    ${DeleteUserObjectPermissionAssigned}    DatabaseLibrary.Execute Sql String    delete from userobjectpermissionassigned where userlogin in (select userid from developers d where d.userid = '${ADMIN_USER_NAME}')
    ${InsertUserObjectPermission}    DatabaseLibrary.Execute Sql String    insert into userobjectpermission select distinct d.userid,p.protectedobjectid,'Enable',505 from protectedobject p,objecttype o, developers d where p.objecttypename = o.objecttypename and p.protectedobjectid not in (604,1186,1021) and o.objectcategory <> 'DB_TABLE' and d.userid = '${ADMIN_USER_NAME}'
    ${InsertUserObjectPermissionAssigned}    DatabaseLibrary.Execute Sql String    insert into userobjectpermissionassigned select distinct d.userid,p.protectedobjectid,'Enable',505 from protectedobject p,objecttype o, developers d where p.objecttypename = o.objecttypename and p.protectedobjectid not in (604,1186,1021) and o.objectcategory <> 'DB_TABLE' and d.userid = '${ADMIN_USER_NAME}'
    ${DeleteUserLookUpPermission}    DatabaseLibrary.Execute Sql String    delete from userlookuppermission where userlogin in (select userid from developers d where d.userid = '${ADMIN_USER_NAME}')
    ${DeleteUserLookUpPermissionAssigned}    DatabaseLibrary.Execute Sql String    delete from userlookuppermissionassigned where userlogin in (select userid from developers d where d.userid = '${ADMIN_USER_NAME}')
    ${InsertUserLookUpPermission}    DatabaseLibrary.Execute Sql String    insert into userlookuppermission select distinct d.userid,lookupid,'Write',505 from lookup, developers d where lookuptypeid in (7,30,39,63,68,81,5100103,6000056,6000087,5100101) and d.userid = '${ADMIN_USER_NAME}'
    ${InsertUserLookUpPermissionAssigned}    DatabaseLibrary.Execute Sql String    insert into userlookuppermissionassigned select distinct d.userid,lookupid,'Write',505 from lookup, developers d where lookuptypeid in (7,30,39,63,68,81,5100103,6000056,6000087,5100101) and d.userid = '${ADMIN_USER_NAME}'
    ${x}    DatabaseLibrary.Check If Exists In Database    select * from dbo.developers where userid = '${ADMIN_USER_NAME}'
    Log To Console    ${ADMIN_USER_NAME} got access to C2C application
