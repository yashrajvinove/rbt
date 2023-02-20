*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${browser}   chrome
${url}       https://propftxdevadmin.iworklab.com/login/
*** Test Cases ***
LoginTest
   Open Browser      ${url}  ${browser}
   Maximize Browser Window
   Title Should Be       PropFTX Admin
   ${loginEmail}  Set Variable    //input[@name='loginEmail']
   Wait Until Page Contains Element           ${loginEmail}
   Element Should Be Enabled        ${loginEmail}
   Element Should Be Visible        ${loginEmail}
   Input Text        ${loginEmail}     rahul.agarwal@mail.vinove.com
  # Sleep    3
  #Clear Element Text    ${loginEmail}
   Sleep    3
   Input Text        name:password       Admin@1234
   Click Element      xpath://button[@type='submit']
   Sleep    1


   Reload Page
LoginTest2
   #Open Browser      ${url}  ${browser}
  # Maximize Browser Window
   Wait Until Page Contains Element           xpath://input[@name='loginEmail']
   Input Text        name:loginEmail     rahul.agarwall@mail.vinove.com
   Input Text        name:password       Admin@123
   Click Element    //button[@type='submit']
   Sleep    1

   Reload Page
   Sleep    2

LoginTest3
   Input Text        name:loginEmail     rahul.agarwal@mail.vinove.com
   Input Text        name:password       Admin@123
   Click Element    //button[@type='submit']
   Sleep    1
   ${verify}=  Page Should Contain Element               //span[@class='mr-2']        You have successfully logged in!
   Run keyword if   ${verify}  =   You have successfully logged in!    Test Keyword 1
   Log To Console    successfull login

  # ELSE
  # Log To Console     unsucessfull
   Page Should Contain Element      class:brand-logo
   Mouse Down    //span[text()='User Management']
   Mouse Up      //span[text()='User Management']
   Sleep    3

   Go To     https://propftxdevadmin.iworklab.com/transactions

   Reload Page

UserManagement
   Set Selenium Speed    3seconds
   Wait Until Element Is Visible    xpath://span[text()='User Management']
   Click Element    xpath://span[text()='User Management']
   Wait Until Element Is Visible    xpath:(//span[text()='Add'])[1]
   Click Element    xpath:(//span[text()='Add'])[1]
   Sleep    10
   Wait Until Element Is Visible    xpath://h1[text()='Add New User']
   ${NewUser}=   Page Should Contain Element     xpath://h1[text()='Add New User']     Add New User
   Run Keyword If  ${NewUser}   =    Add New User     Test Keyword 1
   Log To Console    title verified
   Input Text    id:name    Yash test 1
   Input Text    id:address    Noida
   Input Text    id:phoneNumber    9548779463
   Click Element    xpath:(//div[@class='select__input-container css-ackcql'])[1]
   Sleep    3
   Input Text            xpath:(//div[@class='select__input-container css-ackcql'])[1]       Andorra
   Click Element    xpath:(//div[@class='select__input-container css-ackcql'])[1]
   Click Element    xpath:(//div[@class='select__input-container css-ackcql'])[2]
   Input Text      (//div[@class='select__input-container css-ackcql'])[2]      Encamp
   Click Element    xpath:(//div[@class='select__input-container css-ackcql'])[2]

   #Input Text       id:email
   #Click Button    xpath://button[@type='submit']

   Sleep    10
   Close Browser
*** Keywords ***
Test Keyword 1
  # Log To Console      login successfull
#You have successfully logged in!