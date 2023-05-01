*** Keywords ***

Select Company Match :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Element :  //div[contains(@class,'ng-select-container ng-has-value')]
    Click Element :  //div[@class='ng-option ng-star-inserted'][contains(.,'${value}')]
    Wait Loading screen Not Visible

Select Slot Time Matching :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    #Select Slot Time
    Click Element :   (//td[contains(.,'${list[${1}]}')])[${list[${0}]}]
    Wait Loading screen Not Visible
    #Add investor
    Click Element :   //a[contains(@class,'ng-star-inserted')]
    Wait Loading screen Not Visible
    #Add Room To Slot
    Click Element :   (//div[@class='ng-select-container'][contains(.,'Please select room')])[${list[${0}]}]
    Click Element :   //span[@class='ng-option-label ng-star-inserted'][contains(.,'${list[${2}]}')]
    Wait Loading screen Not Visible
    #LOCK
    Click Element   (//button[@class='btn unlock ng-star-inserted'])[1]
    Click Button :  //button[contains(.,'CONFIRM')]

Send Schedule :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Button :  //button[contains(.,'SEND SCHEDULE')]
    Select From List By Label   //select[contains(@class,'form-control ng-untouched ng-pristine ng-valid')]   ${value}
    Wait Loading screen Not Visible
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    ${table_cell} =   Get Table Cell   (//table[contains(@border,'0')])[3]   2   1
    log  ${table_cell}
    ${Split}   Split String   ${table_cell}   \n
    log   ${Split[${2}]}
    Click Button :   //button[@class='btn btn-primary ml-2 mt-1'][contains(.,'SEND')]
    Execute Javascript   window.open('${Split[${2}]}');
    ${handle} =	Select Window	NEW
    Wait Loading screen Not Visible
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    close window

Select Investor Match :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Element :  //div[contains(@class,'ng-select-container ng-has-value')]
    Click Element :  //div[@class='ng-option ng-option-selected ng-option-marked ng-star-inserted'][contains(.,'${value}')]
    Wait Loading screen Not Visible

Investor Matching :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel   ${sheetExcel}   ${rowStart}   ${colStart}
    Click Element :  //td[contains(.,'${list[${0}]}')]
    Wait Loading screen Not Visible
    Click Element :   id=dropdown
    Click Element :  //a[@class='dropdown-item'][contains(.,'${list[${2}]}')]
    Wait Loading screen Not Visible

Remove Company Matching
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    #Remove Investor
    Wait Until Page Contains Element    //button[contains(@type,'button')]   30s
    Click Element   //button[contains(@type,'button')]
    # Sleep  1s
    Wait Until Page Contains Element   //button[contains(.,'Remove')]   30s
    Click Element   //button[contains(.,'Remove')]
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    #Remove Room
    Wait Until Page Contains Element   //span[contains(@title,'Clear all')]   30s
    Click Element   //span[contains(@title,'Clear all')]
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    #UnLock
    Wait Until Page Contains Element   //button[@class='btn lock ng-star-inserted']   30s
    Click Element   //button[@class='btn lock ng-star-inserted']
    Sleep  1s
    Wait Until Page Contains   CONFIRM UNLOCK SLOT   30s
    Wait Until Page Contains Element   //button[contains(.,'CONFIRM')]   30s
    Click Element   //button[contains(.,'CONFIRM')]
    Wait Until Element Is Not Visible     //div[contains(@class,'modal-body text-center')]     30s
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
 