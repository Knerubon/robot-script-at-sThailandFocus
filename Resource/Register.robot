*** Settings ***
Library            Selenium2Library

*** Keywords ***

# Go To Registration Link :
#     [Arguments]    ${registerType}
#     ${linkRegisterCompany}   Get Value    id=registerCompanyUrl
#     ${linkRegisterInvestor}   Get Value   id=investorRegistrationURL
#     ${linkRegisterSeminar}   Get Value    id=seminarRegistrationURL
#     Set Test Variable   ${linkRegisterCompany}
#     Set Test Variable   ${linkRegisterInvestor}
#     Set Test Variable   ${linkRegisterSeminar}
#     # Run Keyword If   '${registerType}' == 'company'   Go To   ${linkRegisterCompany}
#     # Run Keyword If   '${registerType}' == 'investor'   Go To   ${linkRegisterInvestor}
#     # Run Keyword If   '${registerType}' == 'seminar'   Go To   ${linkRegisterSeminar}
#     # Wait Loading screen Not Visible

#     Run Keyword If   '${registerType}' == 'company'   Execute Javascript   window.open('${linkRegisterCompany}');  
#     Run Keyword If   '${registerType}' == 'investor'  Execute Javascript   window.open('${linkRegisterInvestor}');  
#     Run Keyword If   '${registerType}' == 'seminar'   Execute Javascript   window.open('${linkRegisterSeminar}');  
#     ${handle} =	Select Window	NEW
#     Wait Loading screen Not Visible

# Click consent
#     Click Element :  ${Accept}
#     Click Button :  ${btnNext}

# Check Required Filed
#     Click Button :  ${btnSubmit}
#     Get Text And Should Be True :  //div[contains(@class,'swal2-html-container')]   Please enter all required data.
#     Click Button :  ${button_ok}
     

# company register : 
#     #company register
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   ${selectCompany}     ${list[${0}]}
#     Click Button :  //div[contains(@class,'ng-option ng-option-marked')]
#     Input Text   (//input[contains(@formcontrolname,'firstName')])[1]   ${list[${1}]}
#     Input Text   (//input[contains(@formcontrolname,'lastName')])[1]    ${list[${2}]}
#     Input Text   (//input[contains(@formcontrolname,'email')])[1]       ${list[${3}]}
#     Wait Loading screen Not Visible
#     Input Text   (//input[contains(@type,'tel')])[1]    ${list[${4}]}
#     Input Text   (//input[contains(@formcontrolname,'jobTitle')])[1]    ${list[${5}]}
#     Wait Loading screen Not Visible

# Select is participant
#     # [Arguments]     ${Requirements}
#     #company register   
#     Wait Until Element Is Visible   //label[@class='form-check-label'][contains(.,'participant')]
#     Click Element  //label[@class='form-check-label'][contains(.,'participant')]
#     # Select From List By Label    ${DietaryRequirements}   ${Requirements}

# Remove Form Participants
#     #company register
#     Wait Until Element Is Visible   //a[@class='btn btn-link'][contains(.,'Remove')]
#     Click Element   //a[@class='btn btn-link'][contains(.,'Remove')]
#     Click Element :  //button[@type='button'][contains(.,'Yes, delete it!')]
#     Wait Until Element Is Not Visible    //a[@class='btn btn-link'][contains(.,'Remove')]

# Click Submit
#     Click Button :  ${btnSubmit} 
#     Close Window


# Check company duplicated :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   ${selectCompany}     ${value}
#     Click Button :  //div[contains(@class,'ng-option ng-option-marked')]
#     # Wait Until Page Contains Element     //small[@class='invalid-input'][contains(.,'Your company is already registered.')]
#     ${_getMsgErr}    Get Text   //small[contains(@class,'text-danger mt-1')]
#     Should Be True     '${_getMsgErr}' == 'Your company is already registered.' 
#     # Capture Page Screenshot     ${pathCapture}/screenshot-{index}.png


# Check mail duplicated :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   (//input[contains(@formcontrolname,'email')])[1]   ${value}
#     click Element   //h5[contains(.,'Contact Person *')]
#     Wait Loading screen Not Visible
#     # Wait Until Page Contains Element   //small[@class='text-danger'][contains(.,'Email is already registered.')]
#     ${_getMsgErr}    Get Text   //small[@class='text-danger'][contains(.,'Email is already registered.')]
#     Should Be True     '${_getMsgErr}' == 'Email is already registered.' 
#     # Capture Page Screenshot     ${pathCapture}/screenshot-{index}.png

# input data : Participants
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   id=firstName   ${list[${0}]}
#     Input Text   id=surname    ${list[${1}]}
#     Input Text   id=email       ${list[${2}]}
#     Click Element   //label[contains(.,'Participants *')]
#     Wait Loading screen Is Visible
#     Wait Loading screen Not Visible
#     Input Text   (//input[contains(@type,'tel')])[2]   ${list[${3}]}
#     Input Text   id=jobTitle   ${list[${4}]}
#     # Select From List By Label    ${DietaryRequirements}   ${Requirements}

# input data : Add 1 Participants :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     ${LengthList}   Get Length   ${list} 
#     log   ${list[${0}]}
#     @{dataList}   Create List
#     FOR   ${i}   IN RANGE   ${LengthList}
#         ${SplitData}   Split String   ${list[${i}]}   ,
#         ${Length}    Get Length   ${SplitData}
#         # Append To List   ${dataList}   ${list[${i}]}
       
#         FOR   ${i}   IN RANGE   ${Length}
#             Append To List   ${dataList}   ${SplitData[${i}]}   
#         END

#     END
#     Log   ${dataList}
#     [Return]        ${dataList}

#     # input data
#     ${id}   Set Variable   2
#     ${dataNo}   Set Variable   0
#     ${tel}   Set Variable   3

#     FOR  ${i}   IN RANGE   ${LengthList}
#         Click Add Participants
#         Input Text   (//input[contains(@id,'firstName')])[${id}]   ${dataList[${dataNo}]}
#         ${dataNo}   Evaluate   ${dataNo} + 1
#         Input Text   (//input[contains(@id,'surname')])[${id}]     ${dataList[${dataNo}]}
#         ${dataNo}   Evaluate   ${dataNo} + 1
#         Input Text   (//input[contains(@id,'email')])[${id}]       ${dataList[${dataNo}]}
#         ${dataNo}   Evaluate   ${dataNo} + 1
#         Click Add Participants 
#         Wait Loading screen Is Visible
#         Wait Loading screen Not Visible
#         Input Text   (//input[contains(@type,'tel')])[${tel}]   ${dataList[${dataNo}]}
#         ${dataNo}   Evaluate   ${dataNo} + 1
#         Input Text   (//input[contains(@id,'jobTitle')])[${id}]   ${dataList[${dataNo}]}
#         ${dataNo}   Evaluate   ${dataNo} + 1
#         ${tel}   Evaluate   ${tel} + 1
#         ${id}   Evaluate   ${id} + 1
#     END

# Check Mail Participants Duplicate
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     Get Data Excel   ${sheetExcel}   ${rowStart}   ${colStart}
#     Click Element   //button[@class='btn btn-primary'][contains(.,'Submit')]
#     # Wait Until Page Contains Element   //div[@class='swal2-html-container'][contains(.,'email is duplicated.')]
#     ${getMsgErr}   Get Text   //div[@class='swal2-html-container'][contains(.,'email is duplicated.')]
#     Should Be True    '${getMsgErr}' == 'email is duplicated.'
#     Click Button   //button[@type='button'][contains(.,'OK')]
#     Input Text   id=email       ${value}
#     Wait Loading screen Not Visible


# investor register : 
#     #company register
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   //input[contains(@formcontrolname,'companyName')]     ${list[${0}]}
#     # Wait Until Page Contains Element   //button[contains(.,'${list[${0}]}')]
#     # Click Element   //button[contains(.,'${list[${0}]}')]
#     Input Text   (//input[contains(@formcontrolname,'firstName')])[1]   ${list[${1}]}
#     Input Text   (//input[contains(@formcontrolname,'lastName')])[1]   ${list[${2}]}
#     Input Text   (//input[contains(@formcontrolname,'email')])[1]   ${list[${3}]}
#     Input Text   //input[contains(@formcontrolname,'jobTitle')]   ${list[${4}]}
#     Input Text   (//input[contains(@type,'tel')])[1]   ${list[${5}]}
#     Input Text   //input[contains(@role,'combobox')]   ${list[${6}]}
#     Click Execute Javascript    //span[@class='ng-option-label ng-star-inserted'][contains(.,'${list[${6}]}')]

# input Assistant :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   (//input[contains(@formcontrolname,'firstName')])[2]  ${list[${0}]}
#     Input Text   (//input[contains(@formcontrolname,'lastName')])[2]    ${list[${1}]}
#     Input Text   (//input[contains(@formcontrolname,'email')])[2]    ${list[${2}]}
#     Input Text   (//input[contains(@type,'tel')])[2]    ${list[${3}]}


# Investor Register Event
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Get Event :  Setting   111   6
#     #----------------------------
#     Select Menu :  ${settingInfo}
#     Go To Registration Link :  investor
#     Click consent
#     investor register :  Setting  140  6
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
#     Click Submit

# Company Register Event
#     Open Web Thailand Focus And Login    ${user}    ${password}
#     Get Event :  Setting   111   6
#     #----------------------------
#     Select Menu :  ${settingInfo}
#     Go To Registration Link :  company
#     Click consent
#     company register :  Setting  150  6
#     Select is participant
#     Remove Form Participants
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
#     Click Submit

# Click Add Participants
#     Click Element :   //a[@class='btn btn-link'][contains(.,'Add Participants')]

# ----- Input Data Register Seminar

# seminar register : 
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   //input[contains(@formcontrolname,'companyName')]     ${list[${0}]}
#     # Wait Until Element Is Visible   //button[contains(.,'${list[${0}]}')]
#     # Click Button   //button[contains(.,'${list[${0}]}')]
#     Input Text   (//input[contains(@formcontrolname,'firstName')])[1]   ${list[${1}]}
#     Input Text   (//input[contains(@formcontrolname,'lastName')])[1]   ${list[${2}]}
#     Input Text   (//input[contains(@formcontrolname,'email')])[1]   ${list[${3}]}
#     Input Text   //input[contains(@formcontrolname,'jobTitle')]   ${list[${4}]}
#     Input Text   (//input[contains(@type,'tel')])[1]   ${list[${5}]}
#     Input text   //input[contains(@formcontrolname,'department')]   ${list[${6}]}
#     Wait Loading screen Not Visible
   
# seminar assistant :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Input Text   (//input[contains(@formcontrolname,'firstName')])[2]     ${list[${0}]}
#     Input Text   (//input[contains(@formcontrolname,'lastName')])[2]   ${list[${1}]}
#     Input Text   (//input[contains(@formcontrolname,'email')])[2]  ${list[${2}]}
#     Input Text   (//input[contains(@type,'tel')])[2]   ${list[${3}]}
#     Wait Loading screen Not Visible

# Seminar Session
#     ${AVAILABLE}   Set Variable   1
#     FOR  ${i}   IN RANGE    6
#         Click Element   (//input[contains(@type,'checkbox')])[${AVAILABLE}]
#         ${AVAILABLE}    Evaluate      ${AVAILABLE} + 1
#     END
#     Click Reminder

# Click Reminder
#     Click Element :  //label[@class='form-check-label'][contains(.,'Reminder')]

# Add Participants :
#     [Arguments]   ${Participants}
#     ${count}   Set Variable   ${Participants} - 1
#     FOR  ${i}   IN RANGE    ${count}
#         Click Add Participants
#     END






























# Seminar Registration
#     [Arguments]   ${company}   ${firstName}   ${lastname}   ${email}   ${mobile}
#     ...   ${seminarFirstName}   ${seminarLastName}   ${seminarEmail}   ${seminarPhone}
#     @{_data}   Create List   ${company}   ${firstName}   ${lastname}   ${email}   ${mobile}
#     @{_seminar}   Create List   ${seminarFirstName}   ${seminarLastName}   ${seminarEmail}   ${seminarPhone}
#     # @{company_1}   Create List   ${company}   ${firstName}   ${lastname}   ${email}   ${mobile}
#     Set Test Variable   @{_data}
#     Set Test Variable   @{_seminar}
#     # Set Test Variable   @{company_1}
#     Go to    ${seminarRegistrationURL}
#     # Sleep  2s
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Click Element   //label[contains(.,'Accept')]
#     Click Element   //button[contains(.,'Next')]
#     #Company Name
#     # Sleep  2s
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Wait Until Page Contains Element    //input[@formcontrolname='companyName']   30s
#     # Sleep  2s
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Input Text   //input[@formcontrolname='companyName']   ${company}
#     # Click Element   //span[contains(@class,'ng-tns-c9-2 ng-star-inserted')]
#     #Information
#     Input Text   (//input[@formcontrolname='firstName'])[1]   ${firstName}
#     Input Text   (//input[@formcontrolname='lastName'])[1]   ${lastName}
#     Input Text   (//input[@formcontrolname='email'])[1]   ${email}
#     Input Text   //input[@formcontrolname='jobTitle']   Test
#     Input Text   (//input[@id='mobileNumber'])[1]   ${mobile}
#     Input Text   //input[@formcontrolname='department']   Department1
#     ${AVAILABLE}   Set Variable   1
#     # Sleep  2s
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s

#     FOR  ${i}   IN RANGE    6
#         Click Element   (//input[contains(@type,'checkbox')])[${AVAILABLE}]
#         ${AVAILABLE}    Evaluate      ${AVAILABLE} + 1
#     END

#     Click Element   //label[contains(.,'Reminder')]
#     Click Button    //button[contains(.,'Submit')]
#     # Sleep  2s
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Wait Until Page Contains    Registration Success   10s    error=Regiter Fail
#     Capture Page Screenshot     ${pathCapture}/screenshot-{index}.png

# Seminar Check mail duplicated in form
#     [Arguments]   ${email}   ${assistantEmail}

#     Go to    ${seminarRegistrationURL}
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Click Element   //label[contains(.,'Accept')]
#     Click Element   //button[contains(.,'Next')]
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Input Text   (//input[@formcontrolname='email'])[1]    ${email}
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Input Text   (//input[@formcontrolname='email'])[2]    ${assistantEmail}
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     # Sleep  2s
#     ${_getMsgErrInvDup1}  Get Text  (//small[contains(@class,'text-danger')])[1]
#     ${_getMsgErrInvDup2}  Get Text  (//small[contains(@class,'text-danger')])[2]
#     Should Be True   '${_getMsgErrInvDup1}' == 'Email is duplicate.'   30s    
#     Should Be True   '${_getMsgErrInvDup2}' == 'Email is duplicate.'   30s
#     # Sleep  2s
#     Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
#     Capture Page Screenshot    ${pathCapture}/screenshot-{index}.png

# Seminar Check mail already registered
    # [Arguments]   ${email}   

    # Go to    ${seminarRegistrationURL}
    # Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    # Click Element   //label[contains(.,'Accept')]
    # Click Element   //button[contains(.,'Next')]
    # Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    # Input Text   (//input[@formcontrolname='email'])[1]   ${email}
    # Input Text   //input[@formcontrolname='jobTitle']   Test
    # Wait Until Page Contains Element   //small[contains(@class,'text-danger')]     30s
    # ${_getMsgErrInvDup}    Get Text    //small[contains(@class,'text-danger')]
    # Should Be True   '${_getMsgErrInvDup}' == 'Email is already registered.'   30s    
    # # Sleep  2s
    # Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    # Capture Page Screenshot     ${pathCapture}/screenshot-{index}.png





