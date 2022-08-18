*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open google chrome
    ${opt}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Comment    Require no sandbox and disable setuid sandbox for support chrome on linux
    Call Method    ${opt}    add_argument    --headless
    Call Method    ${opt}    add_argument    --no-sandbox
    Call Method    ${opt}    add_argument    --disable-setuid-sandbox
    Create Webdriver    Chrome    chrome_options=${opt}
    Go To    https://www.facebook.com/
    Capture Page Screenshot
    [Teardown]    Close Browser