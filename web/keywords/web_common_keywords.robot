*** Settings ***
Library    Browser

*** Variables ***
@{chrome_arguments}    --disable-infobars    --headless    --disable-gpu     --no-sandbox

*** Keywords ***
Open Browser With Option
    [Arguments]    ${headless_mode}=${True}    ${viewport}={'width': 1920, 'height': 1080}
    IF  $BROWSER
        New Browser    browser=${BROWSER}    headless=${headless_mode}
        New Context    viewport=${viewport}
    ELSE
        New Browser    browser=chromium    headless=${headless_mode}
        New Context    viewport=${viewport}
    END