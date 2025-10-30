*** Settings ***
Documentation    Verify login features
Resource    ../../web/resources/init.robot
Resource    ../../web/keywords/login_page_keywords.robot
Resource    ../../web/keywords/home_page_keywords.robot
Suite Setup    Open Browser With Option  headless_mode=${False}
Suite Teardown    Close Browser


*** Test Cases ***
Login Admin Successfly
    [Documentation]    Admin user can login web successfully by correct username and correct password
    [Tags]    Web_login     Web_Login_successful
    Given I access the login page on browser
    When I login with username = "autoQAGFT" and password = "admin" on browser
    Then I should see home page which title is "Welcome Admin" on browser

SaveList is working well
    [Documentation]    verify SaveList of Home page is working well
    [Tags]    Web_Home    Web_SavedList     Web_SavedList_successful
    [Setup]   Run Keywords    I access the login page on browser 
    ...       AND             I login with username = "autoQAGFT" and password = "admin" on browser
    Given I access the home page on browser
    When I input texts = "autoQA@gft.com | auto@gft.com | test@gft.com | autoQA2026@gft.com" and click Save on browser
    Then I should see these texts at Saved List on browser