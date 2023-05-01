*** Settings ***
Library            Selenium2Library
Library            BuiltIn
Library            String
Library            ExcelLibrary
Library            Collections
Library            OperatingSystem
Library            DateTime
Library            ${CURDIR}/sortcell.py

*** Keywords ***

Get Data Excel
    [Arguments]    ${sheetExcel}   ${rowStart}   ${colStart}
    ${value}    Read Excel Cell     ${rowStart}     ${colStart}      ${sheetExcel}
    Set Test Variable    ${value}
    

Get all data excel
    [Arguments]    ${sheetExcel}   ${rowStart}   ${colStart}
    @{list}     Create List
    ${rowStart}      Set Variable    ${rowStart}    
    FOR    ${i}    IN RANGE    999999   
        ${value}    Read Excel Cell     ${rowStart}     ${colStart}      ${sheetExcel}    
        ${isNone}   Check None Value     ${value}    
        Exit For Loop If    ${isNone}  
        ${rowStart}  Evaluate      ${rowStart} + 1
        Append To List   ${list}    ${value}
    END
    [Return]        ${list}
    log  ${list}

Gen Current Date
    ${getdate} =  Get Current Date
    ${genDataDate} =  Convert Date	${getdate}	result_format=%Y%m%d%H%M%S
    ${gen_Date} =  Convert Date	${getdate}	result_format=%d
    ${gen_Month} =  Convert Date	${getdate}	result_format=%b
    ${genDateResult} =  Convert Date	${getdate}	result_format=%Y%m%d
    # Set Test Variable    ${gen_Time}
    Set Test Variable    ${gen_Month}
    Set Test Variable    ${genDataDate}

    # ${gen_Date}   Convert To Integer    ${gen_Date}
    # ${gen_Month}   Convert To Integer    ${gen_Month}
    # ${gen_Date}  Evaluate      ${gen_Date} + 3
    # Set Test Variable    ${gen_Date}
   

Gen event name :
    [Arguments]    
    ...   ${sheetExcel}   ${rowStart}   ${colStart}     #get
    ...   ${save_sheetExcel}   ${save_colStart}   ${save_rowStart}     #save
    
    ${list}   Get all data excel  Event  7  6
    Gen Current Date

    FOR   ${i}   IN RANGE   2
        Write Excel Cell      ${save_rowStart}    ${save_colStart}   ${list[${i}]}${genDataDate}   ${save_sheetExcel}
        ${save_rowStart}   Evaluate   ${save_rowStart} + 1
    END
    Save Excel Document    ${ExcelName}
    
Wait Loading screen Not Visible
    Wait Until Element Is Not Visible    //div[contains(@class,'ngx-foreground-spinner center-center')]   45s

Wait Loading screen Is Visible
    Wait Until Element Is Visible    //div[contains(@class,'ngx-foreground-spinner center-center')]    45s

Wait Loading screen Is Visible and Not Visible
    Wait Loading screen Is Visible
    Wait Loading screen Not Visible

Click Execute Javascript
    [Arguments]   ${xPath}
    ${ele}    Get WebElement   ${xPath}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele} 
    # execute javascript  document.getElementById('EXTERNAL').click()

Open Web Thailand Focus And Login
    [Arguments]   ${user}    ${password}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors    
    Create Webdriver    Chrome    chrome    chrome_options=${chrome_options}    
    Run Keyword If   '${url}' == 'Dev'   Go To    ${urlDev}
    Run Keyword If   '${url}' == 'Uat'   Go To    ${urlUat}
    Maximize Browser Window
    # Click login to set MS Office 365
    Wait Until Element Is Visible    //button[contains(.,'LOGIN to SET MS Office 365')]
    Click Element    //button[contains(.,'LOGIN to SET MS Office 365')]
    # input mail and pwd
    Wait Until Element Is Visible    //input[contains(@type,'email')]   30s     
    Input text      //input[contains(@type,'email')]     ${user}
    Click Element   //input[contains(@value,'Next')]
    Wait Until Element Is Visible    //input[contains(@type,'password')]   30s    
    Input text      //input[contains(@type,'password')]     ${password}
    Click Element   //input[contains(@value,'Sign in')]
    # Stay signed in?
    Wait Until Element Is Visible    //input[contains(@value,'Yes')]   30s  
    Run Keywords
    ...   Click Element   //input[contains(@value,'Yes')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png  

Select Event :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Run Keywords
    ...   Wait Until Element Is Enabled   //button[@class='btn btn-secondary'][contains(.,'ADD EVENT')]
    ...   AND   Wait Loading screen Not Visible
    Run Keywords
    ...   Click Element   //td[contains(.,'${value}')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible
    
Select Menu :
    [Arguments]     ${Local}
    Run Keywords
    ...   Wait Until Page Contains Element   ${Local}   30s
    ...   AND   Wait Loading screen Not Visible
    Run Keywords
    ...   Click Element   ${Local}
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible

Click Button :
    [Arguments]   ${Local}
    Run Keywords
    ...   Wait Until Element Is Visible   ${Local}
    ...   AND   Wait Loading screen Not Visible
    Run Keywords
    ...   Click Element   ${Local}
    # ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible

Input Data :
    [Arguments]   ${Local}   ${data}
    Wait Until Element Is Enabled   ${Local}
    Input Text    ${Local}   ${data}

Click Element :
    [Arguments]   ${Local}
    Wait Until Element Is Visible   ${Local}
    Click Element    ${Local}   

Get Text And Should Be True :
    [Arguments]   ${Local}   ${Value}
    Wait Until Element Is Visible  ${Local}
    ${GetValue}   Get Text   ${Local}
    Should Be True   '${GetValue}'=='${Value}'

Go To Registration Link :
    [Arguments]    ${registerType}
    Wait Until Element Is Visible   id=registerCompanyUrl
    ${linkRegisterCompany}   Get Value    id=registerCompanyUrl
    ${linkRegisterInvestor}   Get Value   id=investorRegistrationURL
    ${linkRegisterSeminar}   Get Value    id=seminarRegistrationURL
    Set Test Variable   ${linkRegisterCompany}
    Set Test Variable   ${linkRegisterInvestor}
    Set Test Variable   ${linkRegisterSeminar}
    # Run Keyword If   '${registerType}' == 'company'   Go To   ${linkRegisterCompany}
    # Run Keyword If   '${registerType}' == 'investor'   Go To   ${linkRegisterInvestor}
    # Run Keyword If   '${registerType}' == 'seminar'   Go To   ${linkRegisterSeminar}
    # Wait Loading screen Not Visible

    Run Keyword If   '${registerType}' == 'company'   Execute Javascript   window.open('${linkRegisterCompany}');  
    Run Keyword If   '${registerType}' == 'investor'  Execute Javascript   window.open('${linkRegisterInvestor}');  
    Run Keyword If   '${registerType}' == 'seminar'   Execute Javascript   window.open('${linkRegisterSeminar}');  
    ${handle} =	Select Window	NEW
    Wait Loading screen Not Visible

Click consent
    Click Element :  ${Accept}
    Click Button :  ${btnNext}

Check Required Filed :
    [Arguments]  ${locator_btn_submit}  ${locatorErr}  ${TextErr}
    Click Execute Javascript  ${locator_btn_submit}
    Get Text And Should Be True :  ${locatorErr}   ${TextErr}
    Click Button :  ${button_ok}

Input Company Name :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${loc_InputTxt}  ${loc_SelectOption}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text   ${loc_InputTxt}     ${value}
    Wait Until Element Is Visible  ${loc_SelectOption}
    Click Execute Javascript  ${loc_SelectOption}
    Wait Loading screen Not Visible

Scroll Height
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)

Condition Status FAIL :
    [Arguments]   ${condition}  ${conditionStatusFAIL}
    ${status}	${value} =	Run Keyword And Ignore Error	${condition}
    Run Keyword If	'${status}' == 'FAIL'	${conditionStatusFAIL}

Select Available Time :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel   ${sheetExcel}   ${rowStart}   ${colStart}
    ${getLength}    Get Length   ${list}
    Wait Until Page Contains Element   (//label[contains(.,'Yes')])[1]
    
    ${loop}   Set Variable  1   
    FOR  ${i}   IN RANGE   ${getLength}
        Click Execute Javascript   (//label[contains(.,'${list[${i}]}')])[${loop}]
        ${loop}   Evaluate   ${loop} + 1
    END

Add Participants :
    [Arguments]    ${sheetExcel}   ${rowStart}   ${colStart}  ${loc_AddParticipants}
    # Wait Loading screen Not Visible
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    # ${value}   Evaluate   ${value}-1

    FOR    ${i}    IN RANGE   ${value}
        Click Element :  ${loc_AddParticipants}
    END

Input Listbox :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${loc_InputTxt}  ${loc_SelectOption}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text   ${loc_InputTxt}     ${value}
    Wait Until Element Is Visible  ${loc_SelectOption}
    Click Execute Javascript  ${loc_SelectOption}
    Wait Loading screen Not Visible
