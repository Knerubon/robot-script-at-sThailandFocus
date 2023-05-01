*** Settings ***
Library            Selenium2Library

*** Keywords ***

Input Data Contact Person :     
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Contact_firstName}    ${list[${0}]}
    Input Text    ${Contact_lastName}     ${list[${1}]}
    Input Text    ${Contact_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Contact_tel}        ${list[${3}]}
    Input Text    ${Contact_jobTitle}   ${list[${4}]}
    Wait Loading screen Not Visible

Input Data Participants (1) :     
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Participants1_firstName}    ${list[${0}]}
    Input Text    ${Participants1_lastName}     ${list[${1}]}
    Input Text    ${Participants1_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Participants1_tel}        ${list[${3}]}
    Input Text    ${Participants1_jobTitle}   ${list[${4}]}
    Wait Loading screen Not Visible

Input Data Participants (2) :     
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Participants2_firstName}    ${list[${0}]}
    Input Text    ${Participants2_lastName}     ${list[${1}]}
    Input Text    ${Participants2_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Participants2_tel}        ${list[${3}]}
    Input Text    ${Participants2_jobTitle}   ${list[${4}]}
    Wait Loading screen Not Visible

Input Data Participants (3) :     
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Participants3_firstName}    ${list[${0}]}
    Input Text    ${Participants3_lastName}     ${list[${1}]}
    Input Text    ${Participants3_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Participants3_tel}        ${list[${3}]}
    Input Text    ${Participants3_jobTitle}   ${list[${4}]}
    Wait Loading screen Not Visible

Input Data Participants (4) :     
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Participants4_firstName}    ${list[${0}]}
    Input Text    ${Participants4_lastName}     ${list[${1}]}
    Input Text    ${Participants4_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Participants4_tel}        ${list[${3}]}
    Input Text    ${Participants4_jobTitle}   ${list[${4}]}
    Wait Loading screen Not Visible

Input Data Participants (5) :     
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Participants5_firstName}    ${list[${0}]}
    Input Text    ${Participants5_lastName}     ${list[${1}]}
    Input Text    ${Participants5_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Participants5_tel}        ${list[${3}]}
    Input Text    ${Participants5_jobTitle}   ${list[${4}]}
    Wait Loading screen Not Visible

Check Email Duplicate :
    [Arguments]   ${locator}   ${Text}
    Get Text And Should Be True :  ${locator}   ${Text}

Input Mail Again : 
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${locator}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${locator}    ${value}
    Wait Loading screen Not Visible
    # Wait Until Page Does Not Contain   ${TxtErrDuplicateMailToOther}
    
Select is participant :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Run Keyword If   '${value}' == 'Yes'   Is Participant 

Is Participant
    Wait Until Element Is Visible   ${checkBoxParticipant}
    Click Element  ${checkBoxParticipant}
    Wait Until Element Is Visible   ${RemoveParticipants}

Remove Filed Participants
    Wait Until Element Is Visible   ${RemoveParticipants}
    Click Element   ${RemoveParticipants}
    Click Element :  ${btnConfirmDelFiledParticipant}
    Wait Until Element Is Not Visible    ${RemoveParticipants}

No receive notify email :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${locator}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Run Keyword If   '${value}' == 'No'   Click Execute Javascript  ${locator}
    
Register Submit
    Click Button :  ${btnSubmit}
    Get Text And Should Be True :  ${RegistrationSuccessful}  Registration Successful
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Check Company Duplicate :
    [Arguments]   ${locator}   ${Text}
    Get Text And Should Be True :  ${locator}   ${Text}

Input Company Again : 
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}   ${loc_inputText}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${loc_inputText}    ${value}
    Wait Until Element Is Visible  ${SelectOption}
    Click Execute Javascript  ${SelectOption}
    Wait Loading screen Not Visible