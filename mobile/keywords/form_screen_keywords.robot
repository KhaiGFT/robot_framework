*** Settings ***
Library    AppiumLibrary
Resource    ../../mobile/resources/locators/form_screen_locators.robot
Resource    ../../mobile/keywords/tabBar_keywords.robot

*** Keywords ***
I access the Form screen on application
    Click Form On Navigation Menu
    ${form_screen_locator}     Get Element Locator On Mobile     ${app_form_screen}
    Wait Until Element Is Visible   ${form_screen_locator}

I input "${form_screen_input_text}" for input field of form Screen on application
    Click Element      ${app_form_screen_input_text}
    AppiumLibrary.Clear Text         ${app_form_screen_input_text}
    Input Text         ${app_form_screen_input_text}         ${form_screen_input_text}
    Capture Page Screenshot
    Set Test Variable   ${form_screen_input_text}

I should see this text on input field of form Screen on application
    ${actual_text}     AppiumLibrary.Get Text     ${app_form_screen_input_text}
    Should Be Equal As Strings      ${actual_text}      ${form_screen_input_text}