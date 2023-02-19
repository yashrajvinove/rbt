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
   Sleep    3
   Clear Element Text    ${loginEmail}
   Sleep    3
   Input Text        name:password       Admin@123
   Click Element      xpath://button[@type='submit']
   Sleep    1
   Page Should Contain Element          xpath://div[@class='go2072408551 react-hot-toast']

   Sleep    4
   Close Browser

LoginTest2
   Open Browser      ${url}  ${browser}
   Maximize Browser Window
   Wait Until Page Contains Element           xpath://input[@name='loginEmail']
   Input Text        name:loginEmail     rahul.agarwal@mail.vinove.com
   Input Text        name:password       Admin@1234
   Click Element    //button[@type='submit']
   Sleep    1
   Page Should Contain Element      xpath://div[@class='go2072408551 react-hot-toast']



   Close Browser

*** Keywords ***
