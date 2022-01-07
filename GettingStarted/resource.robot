*** Settings ***
Documentation     A test suite for valid login.
...
...               Keywords are imported from the resource file
Library           Browser

*** Variables ***

*** Keywords ***

Open Login Page
    New Browser  ${BROWSER_TYPE}  headless=false
    New Page    ${DEMO_URL}
    Login Page Should Be Open

Login Page Should Be Open
    Get Url   ==    ${DEMO_URL}
    Get Title   ==    Robot Framework

Input Credentials
    [Arguments]    ${username}    ${password}
    Type Text    text=Username    ${username}
    Type Text    text=Password    ${password}

Submit Credentials
    Click    input[type=submit]

Welcome Page Should Be Open
    Get Url   ==   ${DEMO URL}
    Get Text   body   ==   I salute you, Robot overloard!
    Get Title  ==    Robots rule
