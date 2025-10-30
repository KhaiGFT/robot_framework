*** Settings ***
Library    Browser
Resource    ../../web/resources/locators/login_page_locators.robot

*** Variables ***
${login_url}    ${WEB_URL}/web_html/login.htm

*** Keywords ***
I access the login page on browser
    New Page    ${login_url}

I login with username = "${web_username}" and password = "${web_password}" on browser
    Fill Text        ${login_input}      ${web_username}
    Fill Text        ${password_input}   ${web_password}
    Browser.Take Screenshot
    Click            ${login_button}
