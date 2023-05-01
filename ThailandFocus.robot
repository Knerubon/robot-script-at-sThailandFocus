*** Settings ***
Documentation     
...               *Create Date* : 01 Apr 2021
...               *Last update date* : 21082021
Library            ExcelLibrary
Resource           Resource/Setting.robot
Resource           Resource/Approve.robot
Resource           Resource/Matching.robot
Resource           Resource/UserLogin.robot
Resource           Resource/Variables.robot
Resource           Resource/Locator.robot
Resource           Resource/CommonFunction.robot
Resource           Resource/Event.robot
Resource           Resource/Register.robot
Resource           Resource/keyworkCase.robot
Resource           Resource/Company.robot
Resource           Resource/Investor.robot
Resource           Resource/Adminaction.robot
# Suite Teardown     Close All Browsers

*** Test Cases ***

TestEvent_001     # Create Event
    [Documentation]
        ...   Create Event  ${\n}
    [Tags]    Event
    Open Web Thailand Focus And Login    ${user}    ${password}
    Open Excel Document     ${ExcelName}        ${excelPath}
    Wait Until Element Is Visible   ${btnAddEvent}
    Click Button :  ${btnAddEvent}
    Gen event name :
    ...   Event   7   6     #get
    ...   Event   7   7     #save
    Input Data : Event  Event  7  7
    # Select Tab Hotel :  Event  17  6             # input : Show | Hide Tab Hotel
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    Click Button   ${clickSAVE}
    # Pass execution   Execution success

TestSetting_001    # Setting Template
    [Documentation]
        ...   Setting Template  ${\n}
    [Tags]    Setting
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # --------------------------------
    Get Event :  Event   7   7
    Select Menu :  ${settingTemplate}
    # Edit Customer Email :  Setting  8  6
    Add Template :  Setting  12  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

TestSetting_002    # Setting Permission
    [Documentation]
        ...   Setting Permission  ${\n}
    [Tags]    Setting
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # --------------------------------
    Select Menu :  ${settingPermission}
    Input Permission :  Setting  22  6
    Del Permission :  Setting  24  6

TestSetting_003    # Setting Add Slot
    [Documentation]
        ...   Setting Add Slot  ${\n}
    [Tags]    Setting
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # --------------------------------
    Select Menu :  ${settingSlot}
    input data : Add Date  Setting  31  6
    input data : Add Time slot  1  Setting  37  6
    input data : Add Time slot  2  Setting  41  6
    input data : Add Time slot  3  Setting  44  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

TestSetting_004    # Setting Seminar Slot
    [Documentation]
        ...   Setting Seminar Slot  ${\n}
    [Tags]    Setting
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # --------------------------------
    Select Menu :  ${settingSeminarSlot}
    input data : Add Date  Setting  60  6
    input data : Add time seminar slot  1  Setting  64  6
    input data : Add time seminar slot  2  Setting  68  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

TestSetting_005    # Setting Room
    [Documentation]
        ...   Setting Room  ${\n}
    [Tags]    Setting
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # --------------------------------
    Select Menu :  ${settingRoom}
    Import Room From CSV File
    Check Duplicated Room :  Setting  85  6
    Click Button Add Room :  Setting  88  6
    Delete Room :  Setting  94  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

TestCompanyRegister_001    # Company Registration And Check Mail Duplicate
    [Documentation]
        ...   - Company Registration ${\n}
        ...   - Check Mail Duplicate ${\n}
    [Tags]    Company Register
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------
    Select Menu :  ${settingInfo}
    Go To Registration Link :  company
    Click consent
    Check Required Filed :  ${btnSubmit}  ${ErrRequired}  ${TxtErrRequired}
    Input Company Name :  Company  8  6  ${CompanySelect}  ${SelectOption}
    Input Data Contact Person :  Company  10  6
    Add Participants :  Company  16  6  ${AddParticipants}
    Input Data Participants (1) :  Company  19  6
    Check Email Duplicate :  ${text_danger_mailDuplicate}  ${TxtErrDuplicateMailToOther}
    Input Mail Again :  Company  24  6   ${Participants1_email}
    Input Data Participants (2) :  Company  29  6
    Check Email Duplicate :  ${text_danger_mailDuplicate}  ${TxtErrDuplicateMailToOther}
    Input Mail Again :  Company  34  6   ${Participants2_email}
    Check Required Filed :  ${btnSubmit}  ${ErrRequired}  ${TxtErrRequired}
    Select Available Time :  Company  41  6
    Register Submit
    Close Window

TestCompanyRegister_002    # Check Company Duplicate, Company is participant
    [Documentation]
        ...   - Company Registration ${\n}
        ...   - Check Mail Duplicate ${\n}
    [Tags]    Company Register
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------
    # Select Menu :  ${settingInfo}
    Select Window    MAIN
    Go To Registration Link :  company
    Click consent
    Input Company Name :  Company  58  6  ${CompanySelect}  ${SelectOption}
    Check Company Duplicate :  ${loc_getErrCompany}  ${Err_companyDuplicate}
    Input Company Again :   Company  60  6  ${CompanySelect}
    Input Data Contact Person :  Company  63  6
    Select is participant :  Company  68  6
    Remove Filed Participants
    Check Required Filed :  ${btnSubmit}  ${ErrRequired}  ${TxtErrRequired}
    Select Available Time :  Company  74  6
    Register Submit
    Close Window

TestCompanyRegister_003    # Company Registration 5 Participants, Check receive notify email
    [Documentation]
        ...   - Company Registration ${\n}
        ...   - Check Mail Duplicate ${\n}
    [Tags]    Company Register
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------
    # Select Menu :  ${settingInfo}
    Select Window    MAIN
    Go To Registration Link :  company
    Click consent
    Input Company Name :  Company  90  6  ${CompanySelect}  ${SelectOption}
    Input Data Contact Person :  Company  92  6
    Add Participants :  Company  99  6  ${AddParticipants}
    Input Data Participants (1) :  Company  102  6
    Input Data Participants (2) :  Company  110  6
    Input Data Participants (3) :  Company  118  6
    No receive notify email :  Company  123  6  (//input[@id='willReceiveEmail'])[3]
    Input Data Participants (4) :  Company  126  6
    No receive notify email :  Company  131  6  (//input[@id='willReceiveEmail'])[4]
    Input Data Participants (5) :  Company  134  6
    No receive notify email :  Company  139  6  (//input[@id='willReceiveEmail'])[5]
    Select Available Time :  Company  74  6
    Register Submit
    Close Window

TestAdminActionRegister_001    # Admin Manual Register
    [Documentation]
        ...   Invester Registration  ${\n}
    [Tags]    Company Register
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------------------
    Select Window    MAIN
    Select Menu :  ${regisCompany}
    Click Button :  ${ManualAdd}
    # Check Required Filed :  ${btnSubmit}  ${ErrRequired}  ${TxtErrRequired}
    Input Company Name :  Admin  6  6  ${CompanySelect}  ${optionByLabel}
    Add Participants :  Admin  8  6  ${btn_AddParticipants}
    Admin Select Participant :  Admin  10  6  ${1_isParticipant}
    Input Data Contact Person :  Admin  11  6
    Input Data Participants (1) :  Admin  18  6
    Input Mail Again :   Admin  23  6  ${Participants1_email}
    Input Data Participants (2) :  Admin  28  6
    Input Mail Again :   Admin  33  6  ${Participants2_email}
    Select Available Time :  Admin  38  6
    Click Button :  ${btnSubmit}

TestAdminAction_002    # Admin Approve Company
    [Documentation]
        ...   Admin Approve Company  ${\n}
    [Tags]    Admin Approve
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------------------
    # Select Menu :  ${regisCompany}
    Admin Approved :  Admin  51  6  Company

TestInvestorRegister_001    # Invester Registration
    [Documentation]
        ...   Invester Registration  ${\n}
    [Tags]    Invester Register
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------------------
    Select Menu :  ${settingInfo}
    # Select Window    MAIN
    Go To Registration Link :  investor
    Click consent
    Check Required Filed :  ${next_button}  ${ErrRequired}  ${TxtErrRequired}
    Input Company Name :  Investor  8  6  ${InvestorSelect}  ${In_SelectOption}
    Input Data Information :  Investor  10  6  
    Select companies interested :  Investor  18  6 
    Select Available Time :  Investor  24  6 
    Register Submit
    Close Window

TestInvestorRegister_002    # Invester Registration
    [Documentation]
        ...   Invester Registration  ${\n}
    [Tags]    Invester Register
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------------------
    # Select Menu :  ${settingInfo}
    Select Window    MAIN
    Go To Registration Link :  investor
    Click consent
    Check Required Filed :  ${next_button}  ${ErrRequired}  ${TxtErrRequired}
    Input Company Name :  Investor  41  6  ${InvestorSelect}  ${In_SelectOption}
    Input Data Information :  Investor  43  6  
    Check Email Duplicate :  ${getText_danger}  ${ErrEmailalready}
    Input Mail Again :  Investor  49  6   ${Investor_email}
    Click : Next Page
    Select companies interested :  Investor  52  6 
    Select Available Time :  Investor  58  6 
    Register Submit
    Close Window

TestAdminAction_003    # Admin Approve Investor
    [Documentation]
        ...   Admin Approve Investor  ${\n}
    [Tags]    Admin Approve
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------------------
    Select Window    MAIN
    Select Menu :  ${regisInvestor}
    Admin Approved :  Admin  66  6  Investor

TestAdminAction_004    # Admin Approve Investor
    [Documentation]
        ...   Admin Matching By Company  ${\n}
        ...     - Add From side Company    ${\n}
    [Tags]    Admin Matching
    # Open Web Thailand Focus And Login    ${user}    ${password}
    # Open Excel Document     ${ExcelName}        ${excelPath}
    # Get Event :  Event   7   7
    # -------------------------------------
    Select Menu :  ${matchCompany}
    CommonFunction.Input Company Name :  Admin  78  6  ${input_company}  ${optionByLabel}  
    Adminaction.Click Slot Time :  Admin  81  6   
    Adminaction.Check Investor Disable :  ${Investor_A}
    Adminaction.Check Investor Disable :  ${Investor_B}
    Adminaction.Click Slot Time :  Admin  84  6
    Adminaction.Check Investor Enabled :  ${Investor_A}
    Adminaction.Check Investor Disable :  ${Investor_B}
    Adminaction.Click Add Investor

TestAdminAction_005    # Admin Approve Investor
    [Documentation]
        ...   Admin Matching By Company  ${\n}
        ...     - Add From side Invastor    ${\n}
    [Tags]    Admin Matching
    Open Web Thailand Focus And Login    ${user}    ${password}
    Open Excel Document     ${ExcelName}        ${excelPath}
    Get Event :  Event   7   7
    # -------------------------------------
    Select Menu :  ${matchCompany}
    CommonFunction.Input Company Name :  Admin  94  6  ${input_company}  ${optionByLabel}
    Adminaction.Select side Investor  ${select_InvestorA}  
    Select slot time :  Admin  97  6







    

# TestApprove_001     # Admin Approve Company
#     [Documentation]
#         ...   Admin Approve Company  ${\n}
#     [Tags]    Approve
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     #----------------------------
#     Select Window    MAIN
#     Select Menu :  ${regisCompany}
#     # Wait Loading screen Not Visible
#     Approve :  Approve  6  6
#     Select Menu :  ${regisCompany}
#     Approve :  Approve  7  6
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

# TestApprove_002     # Admin Approve Investor
#     [Documentation]
#         ...   Admin Approve Investor  ${\n}
#     [Tags]    Approve
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     #-------------------
#     Select Menu :  ${regisInvestor}
#     Approve :  Approve  12  6
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png



# TestLoginSubmit_001     # Company login submit
#     [Documentation]
#         ...   Company login submit  ${\n}
#     [Tags]    LoginSubmit
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     # ----------------------------
#     Select Menu :  ${settingInfo}
#     Go To Login Link :  company
#     input user and pwd login :  LoginSubmit  6  6
#     Select available time :  LoginSubmit  10  6
#     Click Save

# TestLoginSubmit_002    # Company login submit and Add Participant
#     [Documentation]
#         ...   Company login submit and Add Participant  ${\n}
#     [Tags]    LoginSubmit
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     # Select Menu :  ${settingInfo}
#     # Go To Login Link :  company
#     # ---------------------------
#     input user and pwd login :  LoginSubmit  25  6
#     Select available time :  LoginSubmit  29  6
#     Click Save
#     input user and pwd login :  LoginSubmit  42  6
#     Close Window

# TestLoginSubmit_003    # Investor login submit
#     [Documentation]
#         ...   Investor login submit  ${\n}
#     [Tags]    LoginSubmit
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     # -------------------------------------
#     # Select Menu :  ${settingInfo}
#     Select Window    MAIN
#     Go To Login Link :  investor
#     input user and pwd login :  LoginSubmit  59  6
#     Select Meeting Request :  LoginSubmit  62  6
#     Click Next
#     Select available time :  LoginSubmit  68  6
#     scrollHeight and Click Next
#     Close Window
    
# TestMatch_001    # Company match 
#     [Documentation]
#         ...   Company match  ${\n}
#     [Tags]    Match
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     #---------------------------------------
#     Select Window    MAIN
#     Select Menu :  ${matchCompany}
#     ${window1} =	Get Window Handles
#     Select Company Match :  Match  6  6
#     Select Slot Time Matching :  Match  8  6
#     Send Schedule :  Match  13  6
#     ${window2} =	Get Window Handles
#     Select Window	${window2[${0}]}


# TestMatch_002    # Investor match
#     [Documentation]
#         ...   Investor match  ${\n}
#     [Tags]    Match
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     # -------------------------------
#     Select Menu :  ${matchInvestor}
#     Select Investor Match :  Match  18  6
#     Investor Matching :  Match  19  6
#     Send Schedule :  Match  23  6

# TestSetting_006    # Setting Admin edit slot investor 
#     [Documentation]
#         ...   Admin edit slot investor , Company   ${\n}
#         ...   Case : Date Register Expire    ${\n}
#     [Tags]    Setting
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Event   7   7
#     # Step Test
#     Select Window    MAIN
#     Select Menu :  ${settingInfo}
#     Admin edit date register
#     Check expire date register
#     Admin edit slot Investor
#     Investor Login Check Data
    





