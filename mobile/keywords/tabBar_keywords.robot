*** Settings ***
Library    AppiumLibrary

*** Variables ***
${app_nav_home_button}         accessibility_id=Home
${app_nav_login_button}        accessibility_id=Login
${app_nav_form_button}         accessibility_id=Forms

*** Keywords ***
Click Login On Navigation Menu
    Wait Until Element Is Visible    ${app_nav_login_button}
    Click Element    ${app_nav_login_button}

Click Form On Navigation Menu
    Wait Until Element Is Visible    ${app_nav_form_button}
    Click Element    ${app_nav_form_button}