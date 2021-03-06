*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
Login attempt with invalid user should show error
    [Documentation]  Just a demo test 2.

    Open Browser                http://demostore.supersqa.com/  Chrome
    Click Element               //*[@class='page_item page-item-9']
    Input Text                  id=username     fakeuser
    Input Text                  id=password     fakepassword
    Click Element               css=#post-73 > div > div > form > p:nth-child(3) > input.woocommerce-Button.button
    Element Should Be Visible   css=#content > div > div.woocommerce > ul
    Element Text Should Be      css=#content > div > div.woocommerce > ul  ERROR: Invalid username. Lost your password?
    Close Browser


Login attempt with empty password should show "Empty Password" error message
    [Documentation]  Just a demo test 2. Checking error message matches expected exact text.

    Open Browser                    http://demostore.supersqa.com/  Chrome
    Click Element                   //*[@class='page_item page-item-9']
    Input Text                      id=username     fakeuser
    Wait Until Element Is Visible   css=#post-73 > div > div > form > p:nth-child(3) > input.woocommerce-Button.button
    Click Element                   css=#post-73 > div > div > form > p:nth-child(3) > input.woocommerce-Button.button
    Element Should Be Visible       css=#content > div > div.woocommerce > ul
    Element Text Should Be          css=#content > div > div.woocommerce > ul  ERROR: The password field is empty.
    Close Browser


Login attempt with empty username should show "Empty Password" error message
    [Documentation]  Just a demo test 3. Checking error message matches expected exact text.

    Open Browser                    http://demostore.supersqa.com/  Chrome
    Click Element                   //*[@class='page_item page-item-9']
    Input Text                      id=password     fakepassword
    Wait Until Element Is Visible   css=#post-73 > div > div > form > p:nth-child(3) > input.woocommerce-Button.button
    Click Element                   css=#post-73 > div > div > form > p:nth-child(3) > input.woocommerce-Button.button
    Element Should Be Visible       css=#content > div > div.woocommerce > ul
    Element Text Should Be          css=#content > div > div.woocommerce > ul  Error: Username is required.
    Close Browser
