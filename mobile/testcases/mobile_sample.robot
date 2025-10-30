*** Settings ***
Documentation  Login Successfully
Resource    ../../mobile/resources/init.robot
Resource    ../../mobile/keywords/login_screen_keywords.robot
Resource    ../../mobile/keywords/form_screen_keywords.robot
Suite Setup       Open Application On Mobile     ${PLATFORM}
Suite Teardown    Close All Applications

*** Test Cases ***
Login Successfly
    [Documentation]   User can login mobile application successfully by correct username and correct password
    [Tags]    App_Login     App_Login_successful
    Given I access the Login screen on application
    When I tap on Login of Login screen on application
    And I login with username = "autoQA@gft.com" and password = "Test1234!" on application
    Then I should see Login successfully popup on application
    And I can close Login successfully popup on application by tap on OK button

Input Form Successfly
    [Documentation]   User can successfully input text on form screen of mobile application
    [Tags]    App_Form     App_Form_successful
    Given I access the Form screen on application
    When I input "Hello, this is a demo app" for input field of form Screen on application
    Then I should see this text on input field of form Screen on application