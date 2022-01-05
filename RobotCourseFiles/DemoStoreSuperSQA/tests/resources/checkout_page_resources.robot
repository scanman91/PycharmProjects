

*** Variables ***
${homepage}  http://demostore.supersqa.com
${first item locator}  xpath=//*[@id="main"]/div[2]/ul/li[1]/a[2]
${cart button locator}  xpath=//*[@id="menu-item-159"]/a
${checkout button locator}  xpath=//*[@id="post-71"]/div/div/div/div/div/a
${login notice locator}  xpath=//*[@id="post-72"]/div/div/div[1]


*** Keywords ***
Go to home page
    Open browser  about:blank  Firefox
    Go to  ${homepage}

Add item to cart and navigate to checkout
    Click link  ${first item locator}
    sleep  1
    Click link  ${cart button locator}
    Click link  ${checkout button locator}

Notice for returning user to log in should be displayed
    ${login notice text}  Get text  ${login notice locator}
    Should be equal  ${login notice text}  Returning customer? Click here to login