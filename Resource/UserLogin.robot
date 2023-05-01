*** Keywords ***

Go To Login Link :
    [Arguments]    ${userType}
    ${linkLoginCompany}   Get Value    id=companyLoginURL
    ${linkLoginInvestor}   Get Value   id=investorLoginURL
    Set Test Variable   ${linkLoginCompany}
    Set Test Variable   ${linkLoginInvestor}
    # Run Keyword If   '${userType}' == 'company'   Go To   ${linkLoginCompany}
    # Run Keyword If   '${userType}' == 'investor'   Go To   ${linkLoginInvestor}
    # Wait Loading screen Not Visible

    Run Keyword If   '${userType}' == 'company'   Execute Javascript   window.open('${linkLoginCompany}');  
    Run Keyword If   '${userType}' == 'investor'  Execute Javascript   window.open('${linkLoginInvestor}');  

    ${handle} =	Select Window	NEW
    Wait Loading screen Not Visible
  
input user and pwd login :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel   ${sheetExcel}   ${rowStart}   ${colStart}
    Wait Until Page Contains Element   //input[contains(@formcontrolname,'username')]
    Input Text   //input[contains(@formcontrolname,'username')]   ${list[${0}]}
    Input Text   //input[contains(@formcontrolname,'password')]   ${list[${1}]}
    Click Button :  ${btnLogin} 
    # Wait Until Page Contains Element   (//label[@class='form-check-label'][contains(.,'Yes')])[1]
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Check save : success
    Wait Until Page Contains Element    //div[contains(@class,'swal2-html-container')]
    ${popupMsg}   Get Text   //div[contains(@class,'swal2-html-container')]
    Should Be True   '${popupMsg}' == 'Save data success.'
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    Click Button :  //button[@type='button'][contains(.,'OK')]

Logout
    Click Execute Javascript   //button[contains(@class,'btn btn-outline-danger border-0')]

# Select available time :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${list}   Get all data excel   ${sheetExcel}   ${rowStart}   ${colStart}
#     ${getLength}    Get Length   ${list}
#     Wait Until Page Contains Element   (//label[contains(.,'Yes')])[1]
    
#     ${loop}   Set Variable  1   
#     FOR  ${i}   IN RANGE   ${getLength}
#         Click Element   (//label[contains(.,'${list[${i}]}')])[${loop}]
#         ${loop}   Evaluate   ${loop} + 1
#     END
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Click Save
    Click Button :  //button[@class='btn btn-primary mb-3'][contains(.,'Save')]
    Check save : success
    Logout

scrollHeight and Click Next
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    Click Element :  //button[@class='btn btn-primary'][contains(.,'NEXT')]
    Check save : success

Click Next
    # Wait Until Page Contains Element    //button[@class='btn btn-primary mt-2'][contains(.,'NEXT')]
    Click Element :   //button[@class='btn btn-primary mt-2'][contains(.,'NEXT')]
    Wait Loading screen Not Visible
    Check save : success

Select Meeting Request :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel   ${sheetExcel}   ${rowStart}   ${colStart}
    ${getLength}    Get Length   ${list}

    @{createData}   Create List
    FOR   ${i}   IN RANGE   ${getLength}
        ${splitData}   Split String   ${list[${i}]}    ,
        ${LengthData}    Get Length   ${splitData}            
              
               FOR   ${i}   IN RANGE    ${LengthData}              
                    Append To List   ${createData}   ${splitData[${i}]}   
                    # Log   ${createData}
               END
    END
    Log   ${createData}
    [Return]        ${createData}
    
    # input data
    ${interest}   Set Variable  1
    ${meetingType}   Set Variable  1
    ${priority}  Set Variable  2
    ${inputData}  Set Variable  0

    # Click Button :  (//button[contains(@tabindex,'0')])[${slot}]  
    FOR   ${i}   IN RANGE   ${getLength}     #${LengthData}
            Click Element :  (//input[@formcontrolname='interest'])[${interest}]
            # ${addTimeSlot}   Set Variable  1

            FOR   ${i}   IN RANGE   1 
                Input Data :  (//input[@role='combobox'])[${meetingType}]    ${createData[${inputData}]}
                Click Element :  //div[@class='ng-option ng-option-marked'][contains(.,'${createData[${inputData}]}')]
                ${inputData}    Evaluate   ${inputData} + 1
                Input Data :  (//input[@role='combobox'])[${priority}]   ${createData[${inputData}]}
                Click Element :  //div[@class='ng-option ng-option-marked'][contains(.,'${createData[${inputData}]}')]
                ${inputData}    Evaluate   ${inputData} + 1

                ${meetingType}   Evaluate   ${meetingType} + 2
                ${priority}   Evaluate   ${priority} + 2

            END      

            ${interest}  Evaluate   ${interest} + 1  
    END


Investor login submit
    Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    Get Event :  Setting   111   6
    # ----------------------------------
    Select Menu :  ${settingInfo}
    Go To Login Link :  investor
    input user and pwd login :  Setting  177  6
    Select Meeting Request :  Setting  180  6
    Click Next
    Select available time :  Setting  184  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    scrollHeight and Click Next
    Logout

Company login submit
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Setting   111   6
    Select Menu :  ${settingInfo}
    Go To Login Link :  company
    input user and pwd login :  Setting  165  6
    Select available time :  Setting  168  6
    Click Save





