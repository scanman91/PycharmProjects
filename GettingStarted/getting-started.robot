#Browser library
# Only Python 3.7 or newer is supported.
# 	1. Install node.js e.g. from  https://nodejs.org/en/download/
# 	2. Update pip pip install -U pip to ensure latest version is used
#	3. Install robotframework-browser from the commandline: pip install robotframework-browser
#	4. Install the node dependencies: run rfbrowser init in your shell
#	• if rfbrowser is not found, try python -m Browser.entry init

#Van <https://github.com/MarketSquare/robotframework-browser> 

# 20220104 nu werkt het node.js geinstalleerd  met path setting,
# pip install robotframework-browser en rfbrowser init en alles in 1 bestand gezet


*** Settings ***
Documentation     A test suite for valid login.
...
...               Keywords are imported from the resource file
Library           Browser


*** Test Cases ***
Valid Login
    Open Login Page
    Input Credentials    robot    overloard
    Submit Credentials
    Welcome Page Should Be Open

*** Variables ***
${DEMO_URL}      https://robotframework.org/demoapp
${BROWSER_TYPE}  webkit

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




