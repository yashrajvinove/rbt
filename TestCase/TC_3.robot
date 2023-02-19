*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}    https://www.tutorialspoint.com/selenium/selenium_automation_practice.htm
*** Test Cases ***
Radio button
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Set Selenium Speed    2seconds

    #selecting radio button

    Select Radio Button    sex  Male
    Select Radio Button    exp   3


    #selecting checkbox

    Select Checkbox    Manual Tester
    Select Checkbox    Automation Tester
    Unselect Checkbox    Manual Tester


    Close Browser
*** Keywords ***
