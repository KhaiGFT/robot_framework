*** Settings ***
Library    AppiumLibrary
Library    String

*** Variables ***
&{app_alert_title}          android=id=android:id/alertTitle         iOS=predicate=name=='Success'
&{app_alert_message}        android=id=android:id/message            iOS=predicate=name=='You are logged in!'
&{app_alert_button}         android=id=android:id/button1            iOS=accessibility_id=OK                     


*** Keywords ***
Alert Popup Should Be Appear
    [Arguments]     ${popup_name}
    ${alert_title_locator}        Get Element Locator On Mobile     ${app_alert_title}
    Wait Until Element Is Visible       ${alert_title_locator}        error=${popup_name} did not appear
    
Alert Popup Should Not Be Appear
    [Arguments]     ${popup_name}
    ${alert_title_locator}        Get Element Locator On Mobile     ${app_alert_title}
    Wait Until Page Does Not Contain Element       ${alert_title_locator}        error=${popup_name} till appear

Tap Button Of Alert Popup
    ${alert_button_locator}    Get Element Locator On Mobile     ${app_alert_button}
    Click Element    ${alert_button_locator}


Get Text Of Alert Popup
    ${alert_title_locator}    Get Element Locator On Mobile     ${app_alert_title}
    ${alert_message_locator}    Get Element Locator On Mobile     ${app_alert_message}
    ${actual_title_popup}=       AppiumLibrary.Get Text      ${alert_title_locator}
    ${actual_message_popup}=     AppiumLibrary.Get Text      ${alert_message_locator}
    ${actual_popup_text}=        Catenate      SEPARATOR=${SPACE}|${SPACE}        ${actual_title_popup}         ${actual_message_popup}
    RETURN    ${actual_popup_text}
         