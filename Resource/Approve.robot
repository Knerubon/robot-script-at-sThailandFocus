*** Keywords ***

# Select Company Approve :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     Click Element :   //td[@class='table-cell cdk-cell cdk-column-company ng-star-inserted'][contains(.,'${value}')]
#     Wait Loading screen Not Visible

# Approve :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     # Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     # Click Element :   //td[@class='table-cell cdk-cell cdk-column-company ng-star-inserted'][contains(.,'${value}')]
#     # Wait Loading screen Not Visible
#     Select Company Approve :   ${sheetExcel}   ${rowStart}   ${colStart}
#     # Wait Until Page Contains Element   //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
#     # Click Button   //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
#     Click Element :   //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
#     Click Element :   //a[@class='dropdown-item'][contains(.,'Approved')]
#     Click Element :   //button[contains(.,'Approved with email')]
#     # Wait Until Page Contains Element   //svg[contains(@data-icon,'user-check')]

# Admin Approve Investor
#     Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     Get Event :  Setting   111   6
#     #-------------------
#     Select Menu :  ${regisInvestor}
#     Approve :  Setting  158  6
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

# Admin Approve Company
#     # Open Web Thailand Focus And Login    ${user}    ${password}
#     # Open Excel Document     ${ExcelName}        ${excelPath}
#     # Get Event :  Setting   111   6
#     #-------------------
#     Select Menu :  ${regisCompany}
#     Wait Loading screen Not Visible
#     Approve :  Setting  161  6
#     Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

# Approve Seminar :
#     [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
#     # Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
#     # Click Element :   //td[@class='table-cell cdk-cell cdk-column-company ng-star-inserted'][contains(.,'${value}')]
#     # Wait Loading screen Not Visible
#     Select Company Approve :   ${sheetExcel}   ${rowStart}   ${colStart}
#     # Wait Until Page Contains Element   //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
#     # Click Button   //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
#     Click Element :   //button[@aria-controls='status-dropdown'][contains(.,'PENDING')]
#     Click Element :   //a[@class='dropdown-item'][contains(.,'Approved')]
#     Click Element :   //button[contains(.,'Confirm With Email')]
#     # Wait Until Page Contains Element   //svg[contains(@data-icon,'user-check')]

