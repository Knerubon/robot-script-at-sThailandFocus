*** Settings ***
Library            Selenium2Library

*** Keywords ***

Input Data Information :     # Investor Information
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Input Text    ${Investor_firstName}    ${list[${0}]}
    Input Text    ${Investor_lastName}     ${list[${1}]}
    Input Text    ${Investor_email}        ${list[${2}]}
    Wait Loading screen Not Visible
    Input Text    ${Investor_jobTitle}        ${list[${3}]}
    Input Text    ${Investor_tel}   ${list[${4}]}
    Select Country :  ${TxtCountry}   ${list[${5}]}
    Wait Loading screen Not Visible
    Click : Next Page
    Condition Status FAIL :  Check Page Select Companies  Click Popup OK
    
Check Page Select Companies
    Get Text And Should Be True :  ${Get_page}  ${_SelectCompanies}

Click Popup OK
    Click Button :  ${button_ok}

Select Country :
    [Arguments]   ${locator}   ${inputData}
    Input Text    ${locator}   ${inputData}
    Click Execute Javascript  ${Thailand}

Click : Next Page 
    Click Button :  ${next_button}

Select companies interested :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    ${LengthList}   Get Length   ${list} 
    log   ${list[${0}]}
    @{dataList}   Create List
    FOR   ${i}   IN RANGE   ${LengthList}
        ${SplitData}   Split String   ${list[${i}]}   ,
        ${Length}    Get Length   ${SplitData}
        # Append To List   ${dataList}   ${list[${i}]}
       
        FOR   ${i}   IN RANGE   ${Length}
            Append To List   ${dataList}   ${SplitData[${i}]}   
        END

    END
    Log   ${dataList}
    [Return]        ${dataList}

    # ${id}   Set Variable   2
    ${dataNo}   Set Variable   0
    ${type}   Set Variable   3
    ${combobox}   Set Variable  1

    FOR  ${i}   IN RANGE   ${LengthList}
        Click Element :  //span[contains(.,'${dataList[${dataNo}]}')]
        Wait Until Element Is Visible  ${SelectType}
        ${dataNo}   Evaluate   ${dataNo} + 1

        Click Element :  ${SelectType}
        Click Execute Javascript  //span[@class='ng-option-label ng-star-inserted'][contains(.,'${dataList[${dataNo}]}')]

        ${dataNo}   Evaluate   ${dataNo} + 1
        ${combobox}   Evaluate   ${combobox} + 1    
    END

    Click : Next Page
    Get Text And Should Be True :  ${Get_page}  ${_SelectAvailableTimes}

