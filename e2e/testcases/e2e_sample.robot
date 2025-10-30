*** Settings ***
Documentation  Login Successfully
Resource    ../../web/resources/init.robot
Resource    ../../mobile/resources/init.robot
Resource    ../../mobile/keywords/login_screen_keywords.robot
Resource    ../../mobile/keywords/form_screen_keywords.robot
Resource    ../../web/keywords/login_page_keywords.robot
Resource    ../../web/keywords/home_page_keywords.robot
Suite Setup       Run Keywords    Open Browser With Option       headless_mode=${False}
...               AND             Open Application On Mobile     ${PLATFORM}
Suite Teardown    Run Keywords    Close Browser
...               AND             Close All Applications

*** Test Cases ***
Login Web Successfully -> App Login successfully
    [Documentation]   User can login web successfully by correct username and correct password then login app successfully by correct username and correct password
    [Tags]    App_Login     App_Login_successful
    Given I access the login page on browser
    When I login with username = "autoQAGFT" and password = "admin" on browser
    Then I should see home page which title is "Welcome Admin" on browser
    When I access the Login screen on application
    And I tap on Login of Login screen on application
    And I login with username = "autoQA@gft.com" and password = "Test1234!" on application
    Then I should see Login successfully popup on application
    And I can close Login successfully popup on application by tap on OK button
    When I access the Form screen on application
    When I input "Hello, this is a demo app" for input field of form Screen on application
    Then I should see this text on input field of form Screen on application
    When I access the home page on browser
    When I input texts = "autoQA@gft.com | auto@gft.com | test@gft.com | autoQA2026@gft.com" and click Save on browser
    Then I should see these texts at Saved List on browser