*** Keywords ***

Get Event :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    # ${eventName}   Set Variable   ${value}
    Run Keywords
    ...   Wait Until Element Is Enabled   //button[@class='btn btn-secondary'][contains(.,'ADD EVENT')]
    ...   AND   Wait Loading screen Not Visible
    Run Keywords
    ...   Click Element   //td[contains(.,'${value}')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible
 
Input Data : Event
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    # Gen Current Date
    # ${eventName}   Set Variable   ${list[${0}]} ${genDataDate}

    Input Text   id=eventName     ${list[${0}]}
    Input Text   id=eventAlias    ${list[${1}]}
    Input Text   id=dateRange     ${list[${2}]}
    Input Text   id=dateRangeRegisterCompany   ${list[${3}]}
    Input Text   id=dateRangeRegisterInvestor   ${list[${4}]}
    Input Text   id=dateRangeRegisterSeminarInvestor   ${list[${5}]}
    #input Logo and banner
    choose File   id=eventLogo   ${btnChooseFileLogo}
    choose File   id=banner   ${btnChooseFileBanner}

    # put string to cell   Event   7    7   ${list[${0}]} ${genDataDate}

Select Tab Hotel :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${value}   Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Wait Until Page Contains Element   ${switchTabHotel}   20s
    Run Keyword If  '${value}' == 'Hide'   Click Element   ${switchTabHotel}
    ${getStatus}   Get Text   ${getTextSwitchTabHotel}
    ${checkStatus} =    Split String     ${getStatus}      ${SPACE}
    log  ${checkStatus}
    ${TabHotelStatus}      Set Variable     ${checkStatus[2]}
    Should Be True   '${value}' == '${TabHotelStatus}'

Click Button Save
    # [Arguments]   ${btnSave}
    Click Element   ${btnSave}

Edit Customer Email :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Button :  ${CustomEmail}
    Input Data :  ${SenderName}   ${list[${0}]}
    Input Data :  ${FromAddress}  ${list[${1}]}
    Click Button :  ${btnSave}

# Create Event
#     # [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     Click Button :  ${btnAddEvent}
#     Gen event name :
#     ...   Setting   111   6     #get
#     ...   Setting   111   7     #save
#     Input Data : Event  Setting   111   7
#     Select Tab Hotel :  Show
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
#     Click Button   ${clickSAVE}


    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Click Button :  ${btnAddEvent}
    # Gen event name :
    # ...   Event   7   6     #get
    # ...   Event   7   7     #save
    # Input Data : Event  Event  7  7

# Create Event
#     [Arguments]   ${_kwtype}   #${eventAlias}    ${EventDateRange}
#     Date Time
#     #Add Event
#     Wait Until Page Contains Element   //button[@class='btn btn-secondary'][contains(.,'ADD EVENT')]
#     Click Element   //button[@class='btn btn-secondary'][contains(.,'ADD EVENT')]
#     # input data
#     ${eventName}     Set Variable    Thailand Focus test robot ${gen_Time}
#     ${eventAlias}    Set Variable    thailand-focus-test-robot-${gen_Time}
#     Run Keyword If   '${_kwtype}' == 'input data and save'   input data and save  ${eventName}   ${eventAlias}   ${EventDateRange}
#     Run Keyword If   '${_kwtype}' == 'check input Alias Name'   check input Alias Name  S@
#     log to Console   Create Event success

input data and save
    [Arguments]   ${eventName}   ${eventAlias}   ${EventDateRange}
    Input Text   //input[contains(@id,'eventName')]     ${eventName}
    Input Text   //input[contains(@id,'eventAlias')]    ${eventAlias}
    Input Text   //input[@id='dateRange']   ${EventDateRange}
    Input Text   //input[contains(@id,'dateRangeRegisterCompany')]   ${EventDateRange}
    Input Text   //input[contains(@formcontrolname,'dateRangeRegisterInvestor')]   ${EventDateRange}
    Input Text   //input[contains(@formcontrolname,'dateRangeRegisterSeminarInvestor')]   ${EventDateRange}
    #input Logo and banner
    choose File   //input[contains(@name,'eventLogo')]   ${CURDIR}/TestProject-logo-image-1.png
    choose File   //input[contains(@name,'banner')]   ${CURDIR}/set_banner.jpg
    #get value
    ${eventName}   Get Value   //input[contains(@id,'eventName')]
    ${eventAlias}   Get Value   //input[contains(@id,'eventAlias')]
    Set Test Variable   ${eventName}
    Set Test Variable   ${eventAlias}
    #Save
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    Wait Until Element Is Enabled    //button[contains(.,'SAVE')]
    Click Element   //button[contains(.,'SAVE')]
    Check Event Page
    Check consent
    # Log To Console
    Log To Console   Event Name: ${eventName}
    log to Console   Event Alias: ${eventAlias}
    # log to Console   Create Event success
    Log To Console   ------------------------------------------------------------------------------

Check Event Page 
    Wait Until Element Is Visible     //td[contains(.,'${eventName}')]    30s   Create Event : Event Name not found.
    Click Element    //td[contains(.,'${eventName}')]
    # Sleep  2s
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    Location Should Be    ${url}/${eventAlias}/company

Check consent
    Click Element   (//div[contains(.,'Consent')])[6]
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    Wait Until Page Contains Element   //div[@class='d-flex flex-column p-3 border rounded-sm mt-2 bg-white ng-star-inserted']    30s
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

check input Alias Name
    [Arguments]   ${eventAlias}
    Input Text   //input[contains(@id,'eventAlias')]    ${eventAlias}
    ${msgeventAlias}   Get Text    //small[@class='text-danger mt-1 ng-star-inserted']
    Should Be True   '${msgeventAlias}' == 'Only lowercase letters, number and special characters (-)' 
