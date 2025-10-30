*** Settings ***
Library    Browser
Library    String
Resource    ../../web/resources/locators/home_page_locators.robot

*** Variables ***
${home_url}    ${WEB_URL}/web_html/home.htm

*** Keywords ***
I access the home page on browser
    ${current_url}     Get Url
    IF    $current_url == $home_url
        No Operation
    ELSE
        Browser.New Page    ${home_url}
    END

I should see home page which title is "${expected_title_of_home_page}" on browser
    ${actual_title} =    Browser.Get Text    ${welcome_title}    ==    ${expected_title_of_home_page}

I input texts = "${savedList_input_texts}" and click Save on browser
    IF  "|" in $savedList_input_texts
        @{texts}    Split String    ${savedList_input_texts}    separator=${SPACE}|${SPACE} 
        FOR  ${item}  IN  @{texts}
            Browser.Fill Text  ${sample_input}  ${item}
            Click      ${save_button}
        END
    ELSE
        Browser.Fill Text  ${sample_input}   ${savedList_input_texts}
        Click      ${save_button}
    END
    Set Test Variable   ${savedList_input_texts}

I should see these texts at Saved List on browser
    Browser.Take Screenshot
    IF  "|" in $savedList_input_texts
        @{texts}    Split String    ${savedList_input_texts}    separator=${SPACE}|${SPACE} 
        FOR  ${item}  IN  @{texts}
            ${actual_text}     Browser.Get Text   ${saveList_div}      contains     ${item}
        END
    ELSE
        ${actual_text}     Browser.Get Text   ${saveList_div}      contains     ${savedList_input_texts}
    END