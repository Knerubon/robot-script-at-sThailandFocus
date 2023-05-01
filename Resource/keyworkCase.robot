*** Keywords ***

# --------  Keyword Case :: TestSetting_006 
Admin edit date register
    
    Get Data Excel  Setting  206  6
    Click Element :  //button[@class='btn btn-lean-primary align-self-baseline ml-2'][contains(.,'EDIT')]
    wait Loading screen Not Visible
    ${dateExpire}   Set Variable   ${value}
    Input Data :  id=dateRange  ${dateExpire}
    Input Data :  id=dateRangeRegisterCompany  ${dateExpire}
    Input Data :  id=dateRangeRegisterInvestor  ${dateExpire}
    Input Data :  id=dateRangeRegisterSeminarInvestor  ${dateExpire}
    Click Element :  //label[@for='startDate'][contains(.,'Seminar *')]
    Click Element :  //button[@class='btn btn-primary'][contains(.,'SAVE')]
    Wait Loading screen Not Visible

Check expire date register
    ${linkRegisterCompany}   Get Value    id=registerCompanyUrl
    ${linkRegisterInvestor}   Get Value   id=investorRegistrationURL
    ${linkRegisterSeminar}   Get Value    id=seminarRegistrationURL
    Set Test Variable   ${linkRegisterCompany}
    Set Test Variable   ${linkRegisterInvestor}
    Set Test Variable   ${linkRegisterSeminar}
    
    Execute Javascript   window.open('${linkRegisterCompany}');
    Wait Loading screen Not Visible
    Execute Javascript   window.open('${linkRegisterInvestor}');
    Wait Loading screen Not Visible
    Execute Javascript   window.open('${linkRegisterSeminar}');
    Wait Loading screen Not Visible
    
    ${window2} =	Get Window Handles
    ${window}   Set Variable    1

    FOR   ${i}   IN RANGE   3
        Select Window	${window2[${window}]}
        ${getLoc}   Get Location
        ${getText}   Get Text   (//div[contains(@class,'text-center')])[2]
        log   ${getText}
        log   ${getLoc}
        Get Data Excel  Event  7  7
        Should Be True   '${getText}' == '" ${value} has been closed. "'
        Wait Loading screen Not Visible
        Capture Page Screenshot     ${pathCapture}/screenshot-{index}.png
        ${window}   Evaluate   ${window} + 1
        close window
    END

    Select Window	${window2[${0}]}

Admin edit slot Investor
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Get Event :  Setting   111   6
    # ---------------------------------
    Select Menu :  ${regisInvestor}
    Select Company Approve :   Setting   213   6
    Click Element :  ${TabAvailableTime}
    Select available time :  Setting  215  6
    Click Button :  //button[@class='btn btn-primary mt-2'][contains(.,'SAVE')]
    # Click Button :  //button[@class='btn btn-primary ml-2 mt-1 text-uppercase'][contains(.,'CONFIRM')]
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Investor Login Check Data
    Select Menu :  ${settingInfo}
    ${linkLoginInvestor}   Get Value   id=investorLoginURL
    Set Test Variable   ${linkLoginInvestor}
    Execute Javascript   window.open('${linkLoginInvestor}');
    ${handle} =	Select Window	NEW
    input user and pwd login :  Setting   226   6
    Wait Until Page Contains    End of registration period, contact admin if you would like to update information.   10s
    Click Element :  //a[@class='nav-link'][contains(.,'Available Time')]
    Wait Loading screen Not Visible
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png