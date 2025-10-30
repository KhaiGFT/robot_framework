*** Settings ***
Library    AppiumLibrary
Resource    ../../mobile/resources/locators/login_screen_locators.robot
Resource    ../../mobile/keywords/nativeAlert_keywords.robot
Resource    ../../mobile/keywords/tabBar_keywords.robot
Resource    ../../mobile/keywords/mobile_common_keywords.robot

*** Keywords ***
I access the Login screen on application
    Click Login On Navigation Menu
    Wait Until Element Is Visible   ${app_loginContainerButton}

I tap on Login of Login screen on application
    Click Element       ${app_loginContainerButton}

I login with username = "${app_username}" and password = "${app_password}" on application
    Click Element      ${app_login_input}
    AppiumLibrary.Clear Text         ${app_login_input}
    Input Text         ${app_login_input}           ${app_username}
    Click Element      ${app_password_input}
    AppiumLibrary.Clear Text         ${app_password_input}
    Input Text        ${app_password_input}        ${app_password}
    Capture Page Screenshot
    Hide Keyboard	   Done
    Click Element                   ${app_login_button}

I should see Login successfully popup on application
    Alert Popup Should Be Appear     Login successfully
    ${actual_popup_text}=       Get Text Of Alert Popup
    Should Contain   ${actual_popup_text}   Success

I can close Login successfully popup on application by tap on OK button
    Tap Button Of Alert Popup
    Alert Popup Should Not Be Appear    Login successfully