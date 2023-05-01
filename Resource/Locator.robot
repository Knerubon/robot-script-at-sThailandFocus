*** Variables ***
# Local Menu
${regisCompany}    (//div[@class='mat-list-item-content'][contains(.,'Company')])[1]
${regisInvestor}   (//div[@class='mat-list-item-content'][contains(.,'Investor')])[1]
${regisSeminar}    (//div[@class='mat-list-item-content'][contains(.,'Seminar')])[1]
${matchCompany}    (//div[@class='mat-list-item-content'][contains(.,'Company')])[2]
${matchInvestor}   (//div[@class='mat-list-item-content'][contains(.,'Investor')])[2]
${settingTemplate}   //div[@class='mat-list-item-content'][contains(.,'TEMPLATE')]
${settingInfo}   //div[@class='mat-list-item-content'][contains(.,'Info')]
${settingPermission}   //div[@class='mat-list-item-content'][contains(.,'Permission')]
${settingSlot}   (//div[@class='mat-list-item-content'][contains(.,'Slot')])[1]
${settingSeminarSlot}   //div[@class='mat-list-item-content'][contains(.,'Seminar Slot')]
${settingRoom}       //div[@class='mat-list-item-content'][contains(.,'Room')]
${settingConsent}    //div[@class='mat-list-item-content'][contains(.,'Consent')]

# Local Get Text 
${getTextSwitchTabHotel}   //label[contains(@for,'reminderText')]
${ErrRequired}  //div[contains(@class,'swal2-html-container')]
${RegistrationSuccessful}   //h2[contains(@class,'text-center')]
${Get_page}  //div[contains(@class,'h4 text-center my-3')]

# Local Input 
${SenderName}     //input[contains(@formcontrolname,'name')]
${FromAddress}   //input[contains(@formcontrolname,'email')]
${templateName}   //input[contains(@formcontrolname,'templateName')]
${templateSubject}   //input[contains(@formcontrolname,'subject')]
${CompanySelect}    //input[contains(@role,'combobox')]
${InvestorSelect}  //input[contains(@typeaheadoptionfield,'companyName')]
${DietaryRequirements}   //select[contains(@class,'form-control ng-valid ng-touched ng-dirty')]
${SelectOption}   //div[contains(@class,'ng-option ng-option-marked')]
${_SelectOption}  //div[contains(@class,'ng-option ng-star-inserted ng-option-marked')]
${In_SelectOption}  //button[contains(@class,'dropdown-item ng-tns-c13-2 ng-trigger ng-trigger-typeaheadAnimation active ng-star-inserted')]
${RemoveParticipants}  //a[@class='btn btn-link'][contains(.,'Remove')]
${checkBoxParticipant}  //label[@class='form-check-label'][contains(.,'participant')]
${btnConfirmDelFiledParticipant}  //button[@type='button'][contains(.,'Yes, delete it!')]
# Contact Person
${Contact_firstName}   (//input[contains(@formcontrolname,'firstName')])[1]
${Contact_lastName}   (//input[contains(@formcontrolname,'lastName')])[1]
${Contact_email}   (//input[contains(@formcontrolname,'email')])[1]
${Contact_tel}   (//input[contains(@id,'phone')])[1]
${Contact_jobTitle}   (//input[contains(@formcontrolname,'jobTitle')])[1]
${AddParticipants}  //a[@class='btn btn-link'][contains(.,'Add Participants')]
${btn_AddParticipants}   //button[@class='btn btn-primary'][contains(.,'Add Participant')]
# Participants (1)
${Participants1_firstName}   (//input[contains(@formcontrolname,'firstName')])[2]
${Participants1_lastName}   (//input[contains(@formcontrolname,'lastName')])[2]
${Participants1_email}   (//input[contains(@formcontrolname,'email')])[2]
${Participants1_tel}   (//input[contains(@id,'phone')])[2]
${Participants1_jobTitle}   (//input[contains(@formcontrolname,'jobTitle')])[2]
# Participants (2)
${Participants2_firstName}   (//input[contains(@formcontrolname,'firstName')])[3]
${Participants2_lastName}   (//input[contains(@formcontrolname,'lastName')])[3]
${Participants2_email}   (//input[contains(@formcontrolname,'email')])[3]
${Participants2_tel}   (//input[contains(@id,'phone')])[3]
${Participants2_jobTitle}   (//input[contains(@formcontrolname,'jobTitle')])[3]
# Participants (3)
${Participants3_firstName}   (//input[contains(@formcontrolname,'firstName')])[4]
${Participants3_lastName}   (//input[contains(@formcontrolname,'lastName')])[4]
${Participants3_email}   (//input[contains(@formcontrolname,'email')])[4]
${Participants3_tel}   (//input[contains(@id,'phone')])[4]
${Participants3_jobTitle}   (//input[contains(@formcontrolname,'jobTitle')])[4]
# Participants (4)
${Participants4_firstName}   (//input[contains(@formcontrolname,'firstName')])[5]
${Participants4_lastName}   (//input[contains(@formcontrolname,'lastName')])[5]
${Participants4_email}   (//input[contains(@formcontrolname,'email')])[5]
${Participants4_tel}   (//input[contains(@id,'phone')])[5]
${Participants4_jobTitle}   (//input[contains(@formcontrolname,'jobTitle')])[5]
# Participants (ุ5)
${Participants5_firstName}   (//input[contains(@formcontrolname,'firstName')])[6]
${Participants5_lastName}   (//input[contains(@formcontrolname,'lastName')])[6]
${Participants5_email}   (//input[contains(@formcontrolname,'email')])[6]
${Participants5_tel}   (//input[contains(@id,'phone')])[6]
${Participants5_jobTitle}   (//input[contains(@formcontrolname,'jobTitle')])[6]

# Investor Information
${Investor_firstName}   (//input[contains(@formcontrolname,'firstName')])[1]
${Investor_lastName}   (//input[contains(@formcontrolname,'lastName')])[1]
${Investor_email}   (//input[contains(@formcontrolname,'email')])[1]
${Investor_tel}   (//input[contains(@type,'tel')])[1]
${Investor_jobTitle}   //input[contains(@formcontrolname,'jobTitle')]
${TxtCountry}  //input[contains(@role,'combobox')]
${Thailand}  //div[@class='ng-option ng-star-inserted ng-option-marked'][contains(.,'Thailand')]
${Type_meeting}  //input[contains(@role,'combobox')]
${_SelectCompanies}  Select companies you are interested in.
${_SelectAvailableTimes}  Select your available times.
${SelectType}  //div[@class='ng-select-container'][contains(.,'Select Type')]
${ErrEmailalready}  Email is already registered.
${getText_danger}  //small[contains(@class,'text-danger ng-star-inserted')]

# Admin Action -   Contact Person
${1_isParticipant}  //input[@formcontrolname='isParticipant'][contains(@id,'isParticipant')]
${Search}   //input[contains(@placeholder,'Search')]
${input_company}   (//input[contains(@role,'combobox')])[1]

${Investor_A}   Investor A AAIA ThailandMEDIUM1 On 1
${Investor_B}   Investor B BAISMEDIUM1 On 1

${select_InvestorA}   AIA Thailand
${InvestorB}   Investor B BAIS

${slotTime_3point}   //button[contains(@aria-haspopup,'true')]

# Local Button
${btnAddEvent}   //button[@class='btn btn-secondary'][contains(.,'ADD EVENT')]
${clickSAVE}     //button[@class='btn btn-primary'][contains(.,'SAVE')]
${btnSave}       //button[@class='btn btn-primary'][contains(.,'Save')]
${switchTabHotel}   //span[contains(@class,'switch checked switch-medium')]
${btnChooseFileLogo}   ${CURDIR}/TestProject-logo-image-1.png
${btnChooseFileBanner}    ${CURDIR}/set_banner.jpg
${CustomEmail}   //button[@class='btn btn-primary ng-star-inserted'][contains(.,'Custom Email')]
${addTemplate}   (//fa-icon[@class='add-button ng-fa-icon'])[1]
${importTemplate}   //button[contains(.,'Import Template')]
${btnImportTemplate}   //button[contains(.,'IMPORT')]
${btnAddRoom}    //button[@class='btn btn-primary mr-auto'][contains(.,'ADD ROOM')]
${RoomName}   id=name
${RoomCapacity}   id=capacity
${RoomFloor}   id=floor
${RoomLink}   //input[contains(@formcontrolname,'link')]
${RoomDescription}   //input[contains(@formcontrolname,'desc')]
${btn_ok}   //button[contains(.,'OK')]
${button_ok}   //button[@type='button'][contains(.,'OK')]
${Room_SAVE}   //button[contains(.,'SAVE')]
${deleteRoom}   //button[@class='btn btn-primary ml-2 mt-1 text-uppercase'][contains(.,'Deleted')]
${btnAddDay}   //button[@class='btn btn-secondary'][contains(.,'ADD DAY')]
${ClickAddDay}   (//button[contains(.,'ADD DAY')])[2]
${addTimeSlot}   //button[contains(@tabindex,'0')]
${ADDSLOTTIME}   //button[@class='btn btn-lean mt-2'][contains(.,'+ ADD SLOT TIME')]
${Accept}   //label[contains(.,'Accept')]
${btnNext}   //button[contains(.,'Next')]
${btnSubmit}    //button[@class='btn btn-primary'][contains(.,'Submit')]
${btnLogin}   //button[@class='btn btn-primary'][contains(.,'LOGIN')]
${ADDEMPLOYEE}   //button[@class='btn btn-primary col-2'][contains(.,'ADD EMPLOYEE')]
${DELEMPLOYEE}   (//td[contains(@class,'text-danger font-large link text-center')])[2]
${CONFIRM}   //button[@class='btn btn-primary ml-2 mt-1 text-uppercase'][contains(.,'CONFIRM')]
${TabMeetingRequest}   //a[@class='nav-link'][contains(.,'Meeting Request')]
${TabAvailableTime}   //a[@class='nav-link'][contains(.,'Available Time')]
${next_button}  //button[contains(@id,'next-button')]
${ManualAdd}  //button[@class='btn btn-primary arout'][contains(.,'Manual Add')]

# Text Err
${TxtErrRequired}  Please enter all required data.
${TxtErrDuplicateMailToOther}  Duplicate email to other participants

${optionByLabel}  //span[contains(@class,'ng-option-label ng-star-inserted')]
${text_danger_mailDuplicate}  (//p[contains(@class,'text-danger')])[2]
${Participants_1_willReceiveEmail}  (//input[@id='willReceiveEmail'])[1]
${loc_getErrCompany}   //small[@class='text-danger mt-1']
${Err_companyDuplicate}   Your company is already registered.
