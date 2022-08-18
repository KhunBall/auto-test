*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Login facebook - Fail
    [tags]    fail
    Open Browser    about:blank    headlesschrome
    Go To           ${url_facebook}
    Verify facebook page           ${title_facebook}
    Input Username and Password    ${input_user}     ${input_pass}       ${username_fail}      ${password_fail}
    Click Button Login          ${btn_login}
    Verify Login Fail           ${txt_not_me}
Login facebook - success
    [tags]    success
    Open Browser    about:blank    headlesschrome
    Go To           ${url_facebook}
    Verify facebook page           ${title_facebook}
    Input Username and Password    ${input_user}     ${input_pass}       ${username_success}      ${password_success}
    Click Button Login          ${btn_login}
    Verify Login Success           ${txt_message}