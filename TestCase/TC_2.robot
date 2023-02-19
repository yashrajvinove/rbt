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
   Log To Console    successfull

  # ELSE
  # Log To Console     unsucessfull
   Page Should Contain Element      class:brand-logo
   Go To     https://propftxdevadmin.iworklab.com/transactions
   Sleep    3
   Close Browser
*** Keywords ***
Test Keyword 1
  # Log To Console      login successfull
#You have successfully logged in!