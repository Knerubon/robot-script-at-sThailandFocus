*** Settings ***
Library            Selenium2Library

*** Keywords ***
Admin Select Participant :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${loc_Participant}
    Wait Loading screen Not Visible
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Set Test Variable    ${loc_Participant}
    Condition Status FAIL :  Check Value Participant  Check Box Participant
    
Check Value Participant
    Should Be True  '${value}'=='Yes'

Check Box Participant
    Click Element :  ${loc_Participant}

Search Company
    [Arguments]   ${value}
    Wait Loading screen Not Visible
    # Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Wait Until Element Is Visible  ${Search}
    Run Keywords
    ...   Input Text  ${Search}  ${value}
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible
    Wait Until Element Is Visible  //td[contains(.,'${value}')]
    Run Keywords
    ...   Click Element :  //td[contains(.,'${value}')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible
    
Approved
    [Arguments]   ${typeRoll}
    # Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Element :  //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
    Click Element :  //a[@class='dropdown-item'][contains(.,'Approved')]
    # Run Keyword If   '${value}' == 'Approved with email'   Approved with email
    # Run Keyword If   '${value}' == 'Approved'   Go To    Approved
    Approved with email
    # Wait Loading screen Is Visible
    # Wait Loading screen Not Visible
    Run Keyword If   '${typeRoll}' == 'Company'      Back Page List Company
    Run Keyword If   '${typeRoll}' == 'Investor'     Back Page List Investor

Back Page List Company
    Run Keywords
    ...   Click Element :  //a[@class='navigator-parent navigator-label'][contains(.,'COMPANIES')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible

Back Page List Investor 
    Run Keywords
    ...   Click Element :  //a[@class='navigator-parent navigator-label'][contains(.,'Investors')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible

Approved with email
    Run Keywords
    ...   Click Element :  //button[contains(.,'Approved with email')]
    ...   AND   Wait Loading screen Is Visible
    ...   AND   Wait Loading screen Not Visible

Admin Approved :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${typeRoll}
    ${list}   get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    ${LengthList}   Get Length   ${list} 
    ${dataNo}   Set Variable   0
    
    FOR  ${i}   IN RANGE   ${LengthList}
        Search Company  ${list[${dataNo}]}
        Approved  ${typeRoll}
        ${dataNo}   Evaluate   ${dataNo} + 1
    END

# Admin Matching By Company :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     CommonFunction.Input Company Name :  ${sheetExcel}   ${rowStart}   ${colStart}  ${input_company}  ${optionByLabel}

Click Slot Time :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Run Keywords
    ...   CommonFunction.Click Element :  //td[contains(.,'${list[${0}]}')]
    ...   AND   Wait Loading screen Is Visible and Not Visible

Check Investor Disable :
    [Arguments]   ${value}
    Wait Until Element Is Visible  //tr[@class='red-hover-pointer table-cell ng-star-inserted'][contains(.,'${value}')]

Check Investor Enabled :
    [Arguments]   ${value}
    Wait Until Element Is Visible  //tr[@class='green-hover-pointer table-cell ng-star-inserted'][contains(.,'${value}')]


Add Investor and Room
    Click Element :  (//fa-icon[contains(@class,'ng-fa-icon')])[19]

Select side Investor
    [Arguments]   ${valueInvestor} 
    Run Keywords
    ...   Click Element :  //small[@class='text-muted'][contains(.,'${valueInvestor}')]
    ...   AND   Wait Loading screen Is Visible and Not Visible
    

Select slot time :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Element :  ${slotTime_3point}
    Run Keywords
    ...   Click Element :  //a[@class='dropdown-item'][contains(.,'${list[${0}]}')]
    ...   AND   Wait Loading screen Is Visible and Not Visible
   