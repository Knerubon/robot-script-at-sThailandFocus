# *** Settings ***
# Resource           CommonFunction.robot

*** Keywords ***

input data : Add Date
    # Get date
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    ${lenlistDay}    Get Length   ${list}
    Set Test Variable   ${lenlistDay}
    # format date
    @{dateList}   Create List
    FOR  ${i}   IN RANGE   ${lenlistDay}
        ${fomatDate}   Convert Date   ${list[${i}]}   result_format=%d-%b-%Y
        Append To List   ${dateList}   ${fomatDate}
    END
    Log   ${dateList}
    [Return]        ${dateList}

    # split string
    @{dataDay}   Create List
    FOR   ${i}   IN RANGE   ${lenlistDay}
        ${SplitDay}   Split String   ${dateList[${i}]}   -
        ${listDataDay}    Get Length   ${SplitDay}
       
        FOR   ${i}   IN RANGE   ${listDataDay}
            Append To List   ${dataDay}   ${SplitDay[${i}]}   
        END

    END
    Log   ${dataDay}
    [Return]        ${dataDay}

    
    # input data
    ${date}   Set Variable  0
    ${month}   Set Variable  1     
       
    Gen Current Date

    FOR   ${i}   IN RANGE   ${lenlistDay}

        Click Button :  //button[@class='btn btn-secondary'][contains(.,'ADD DAY')]
        Click Element    //button[@class='current ng-star-inserted'][contains(.,'${gen_Month}')]
        Wait Until Element Is Visible   //div[contains(@class,'modal-body text-center')]
        Click Element    //td[@role='gridcell'][contains(.,'${dataDay[${month}]}')]
        Click Element    //td[@role='gridcell'][contains(.,'${dataDay[${date}]}')]
        Click Button :  //button[@class='btn btn-primary ml-2 mt-1'][contains(.,'ADD DAY')]

        ${date}   Evaluate   ${date} + 3
        ${month}   Evaluate   ${month} + 3

    END


input data : Add Time slot
    # Get data
    [Arguments]   ${slot}   ${sheetExcel}   ${rowStart}   ${colStart}   
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    ${lenlistTime}    Get Length   ${list}
    
    @{dataTime}   Create List
    FOR   ${i}   IN RANGE   ${lenlistTime}
        ${splitTime}   Split String   ${list[${i}]}    -
        ${lenTime}    Get Length   ${splitTime}
               
        FOR   ${i}   IN RANGE   ${lenTime}
               ${data_SplitTime}   Split String   ${splitTime[${i}]}   :
               ${_listTime}    Get Length   ${data_SplitTime}
               
               FOR   ${i}   IN RANGE    ${_listTime}              
                    Append To List   ${dataTime}   ${data_SplitTime[${i}]}   
                    Log   ${dataTime}
               END
        # Log   ${dataTime}
        END
    # Log   ${dataTime}
    END
    Log   ${dataTime}
    [Return]        ${dataTime}
    
    # input data
    ${addTimeSlot}   Set Variable  1
    ${inputdataTime}   Set Variable  0     
    Click Button :  (//button[contains(@tabindex,'0')])[${slot}]  
    FOR   ${i}   IN RANGE   ${lenlistTime}
            Click Element    //button[@class='btn btn-lean mt-2'][contains(.,'+ ADD SLOT TIME')]
            # ${addTimeSlot}   Set Variable  1

            FOR   ${i}   IN RANGE   ${_listTime} 
                Click Element   (//input[contains(@class,'form-control bg-white')])[${addTimeSlot}]
                Input Data :  //input[contains(@placeholder,'HH')]   ${dataTime[${inputdataTime}]}
                ${inputdataTime}    Evaluate   ${inputdataTime} + 1
                Input Data :  //input[contains(@placeholder,'MM')]   ${dataTime[${inputdataTime}]}
                ${inputdataTime}    Evaluate  ${inputdataTime} + 1
                ${addTimeSlot}  Evaluate   ${addTimeSlot} + 1
            END        
    END

    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    Click Button :   //button[@class='btn btn-primary'][contains(.,'SAVE')]

input data : Add time seminar slot
    # Get data
    [Arguments]   ${slot}   ${sheetExcel}   ${rowStart}   ${colStart}   
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    ${lenlistTime}    Get Length   ${list}
    
    @{dataTime}   Create List
    FOR   ${i}   IN RANGE   ${lenlistTime}
        ${splitTime}   Split String   ${list[${i}]}    -
        ${lenTime}    Get Length   ${splitTime}
               
        FOR   ${i}   IN RANGE   ${lenTime}
               ${data_SplitTime}   Split String   ${splitTime[${i}]}   :
               ${_listTime}    Get Length   ${data_SplitTime}
               
               FOR   ${i}   IN RANGE    ${_listTime}              
                    Append To List   ${dataTime}   ${data_SplitTime[${i}]}   
                    Log   ${dataTime}
               END
        # Log   ${dataTime}
        END
    # Log   ${dataTime}
    END
    Log   ${dataTime}
    [Return]        ${dataTime}
    
    # input data
    ${addTimeSlot}   Set Variable  1
    ${inputdataTime}   Set Variable  0    
    ${title}   Set Variable   1
    ${speaker}    Set Variable  1
    Click Button :  (//button[contains(@tabindex,'0')])[${slot}]  

    FOR   ${i}   IN RANGE   ${lenlistTime}
            Click Execute Javascript  //button[@class='btn btn-lean mt-2'][contains(.,'+ ADD SLOT TIME')]
            # ${addTimeSlot}   Set Variable  1

            FOR   ${i}   IN RANGE   ${_listTime} 
                Click Element   (//input[contains(@class,'form-control bg-white')])[${addTimeSlot}]
                Input Data :  //input[contains(@placeholder,'HH')]   ${dataTime[${inputdataTime}]}
                ${inputdataTime}    Evaluate   ${inputdataTime} + 1
                Input Data :  //input[contains(@placeholder,'MM')]   ${dataTime[${inputdataTime}]}
                ${inputdataTime}    Evaluate  ${inputdataTime} + 1
                ${addTimeSlot}  Evaluate   ${addTimeSlot} + 1                
            END    

            Input Text    (//textarea[contains(@formcontrolname,'title')])[${title}]   Test TITLE
            ${title}   Evaluate   ${title} + 1
            Input Text    (//input[contains(@formcontrolname,'speaker')])[${speaker}]   Test SPEAKER
            ${speaker}   Evaluate   ${speaker} + 1    
    END

    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    Click Execute Javascript  //button[@class='btn btn-primary'][contains(.,'SAVE')]
    Wait Loading screen Not Visible

Add Slot Time
    ${time_start}   Set Variable    9
    ${time_end}     Set Variable    11
    ${slot_time1}   Set Variable    1
    ${slot_time2}   Set Variable    2

    FOR   ${i}    IN RANGE    2
        Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
        Click Element   //button[contains(.,'+ ADD SLOT TIME')]
        # Sleep  2s
        Wait Until Page Contains Element    (//input[@class='form-control bg-white'])[${slot_time1}]
        Click Element   (//input[@class='form-control bg-white'])[${slot_time1}]
        Input Text   //input[@placeholder='HH']   ${time_start}
        Input Text   //input[@placeholder='MM']   30

        Wait Until Page Contains Element    (//input[@class='form-control bg-white'])[${slot_time2}]
        Click Element   (//input[@class='form-control bg-white'])[${slot_time2}]
        Input Text   //input[@placeholder='HH']   ${time_end}
        Input Text   //input[@placeholder='MM']   00
      
        # set
        # ${slot_time}    Evaluate   ${slot_time} + 1
        ${slot_time1}   Evaluate   ${slot_time1} + 2
        ${slot_time2}   Evaluate   ${slot_time2} + 2       
        ${time_start}   Evaluate   ${time_start} + 4
        ${time_end}     Evaluate   ${time_end} + 5
        # Set Test Variable    ${slot_time}
    END

    Run Keyword If    '${selectSlot}'=='Seminar Slot'    Input TITLE And SPEAKER
    #save
    Click Button   //button[contains(.,'SAVE')]
    Sleep  2s

Input TITLE And SPEAKER
    ${slot_time}   Set Variable   1
    FOR   ${i}    IN RANGE    2
        Input Text    (//textarea[@formcontrolname='title'])[${slot_time}]      TITLE${slot_time}
        Input Text    (//input[contains(@id,'speaker')])[${slot_time}]    SPEAKER${slot_time}
        ${slot_time}    Evaluate   ${slot_time} + 1
    END
        
Import Room From CSV File
    Wait Until Page Contains Element   //button[contains(.,'IMPORT')] 
    choose File   //input[contains(@accept,'.csv')]   ${CURDIR}/room-template.csv
    Wait Until Page Contains   A101   20s
    Wait Until Page Contains   A102   20s
    Wait Until Page Contains   B201   20s
    Wait Until Page Contains   B202   20s

Click Button Add Room :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart} 
    Click Button :  ${btnAddRoom}
    Input Data :  ${RoomName}  ${list[${0}]}
    Input Data :  ${RoomCapacity}  ${list[${1}]}
    Input Data :  ${RoomFloor}  ${list[${2}]}
    Input Data :  ${RoomLink}  ${list[${3}]}
    Input Data :  ${RoomDescription}  ${list[${4}]}
    Click Button :  ${Room_SAVE}

    
Check Duplicated Room :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Button :  ${btnAddRoom}
    Input Data :  ${RoomName}  ${list[${0}]}
    Input Data :  ${RoomCapacity}  ${list[${1}]}
    Click Button :  ${Room_SAVE}
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png  
    ${_msgErr}   Get Text   //div[@class='message'][contains(.,'duplicated room')]
    Should Be True   '${_msgErr}' == 'duplicated room'
    Click Button :  ${btn_ok}

Delete Room :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel  ${sheetExcel}   ${rowStart}   ${colStart}
    Click Button :  (//td[contains(@class,'text-danger font-large link text-center')])[1]
    ${getMsg}   Get Text   //div[contains(@class,'message')]
    ${msgConfirm}   Split String   ${getMsg}   '
    Should Be True   '${msgConfirm[1]}' == '${value}'
    Click Button :  ${deleteRoom}
    Wait Until Element Is Not Visible   //td[contains(.,'${value}')]
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png 


Event Alias
    # Sleep  2s
    Wait Until Element Is Not Visible    //div[@class='ngx-foreground-spinner center-center']   30s
    ${eventAlias}   Get Text    (//li[contains(@class,'breadcrumb-item')])[2]
    Log  ${eventAlias}
    Set Test Variable   ${eventAlias}


Add Template :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    ${list}   Get all data excel  ${sheetExcel}   ${rowStart}   ${colStart} 
    ${totalTemplate}   Set Variable   ${list[${0}]}
    ${nameTemplate}   Set Variable   ${list[${1}]}
    FOR   ${i}    IN RANGE    ${totalTemplate}
        Wait Loading screen Not Visible
        Click Button :  ${addTemplate}
        Click Button :  ${importTemplate}
        Wait Until Page Contains Element   //td[contains(.,'${nameTemplate}')] 
        Click Element :  //td[contains(.,'${nameTemplate}')]
        Click Button :   ${btnImportTemplate}
        Click Button :   ${btnSave}
    END
    # Log To Console   Import Template success

Input Permission :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel   ${sheetExcel}   ${rowStart}   ${colStart}
    Wait Until Page Contains Element   //input[contains(@role,'combobox')]
    Input Text   //input[contains(@role,'combobox')]   ${value}
    Click Element :  //div[@class='ng-option ng-star-inserted ng-option-marked'][contains(.,'${value}')]
    Click Button :  ${ADDEMPLOYEE}
    Wait Until Page Contains Element   //td[contains(.,'${value}')]
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png
    
Del Permission :
    [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Get Data Excel   ${sheetExcel}   ${rowStart}   ${colStart}   
    Click Element :  ${DELEMPLOYEE}
    Wait Until Element Is Visible   //div[contains(@class,'message')]
    ${getMsg}   Get Text   //div[contains(@class,'message')]
    ${SplitMsg}   Split String   ${getMsg}   "
    Should Be True   '${SplitMsg[${1}]}' == '${value}'
    Click Button :  ${CONFIRM}
    Wait Until Page Does Not Contain Element   //td[contains(.,'${value}')]
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Add Template To Event
    # [Arguments]   ${sheetExcel}   ${rowStart}   ${colStart}
    Select Menu :  ${settingTemplate}
    Add Template :  Setting  120  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Add Slot To Event
    Select Menu :  ${settingSlot}
    input data : Add Date  Setting  125  6
    input data : Add Time slot  1  Setting  129  6
    input data : Add Time slot  2  Setting  133  6
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png

Add Room To Event
    Select Menu :  ${settingRoom}
    Import Room From CSV File
    Capture Page Screenshot   ${pathCapture}/screenshot-{index}.png




