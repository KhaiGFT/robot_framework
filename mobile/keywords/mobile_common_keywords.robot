*** Settings ***
Library  AppiumLibrary
Library  Collections


*** Keywords ***
Open Application On Mobile
    [Arguments]       ${platform}
    IF  $platform == "iOS"     
        Open Application   http://127.0.0.1:4723                             automationName=${IOS_AUTOMATION_DRIVER}
        ...                platformName=iOS                                  deviceName=${IOS_DEVICE}
        ...                platformVersion=${IOS_PLATFORM_VERSION}           app=${IOS_APP}
        ...                newCommandTimeout=${240}                          noReset=${False}
    ELSE
        Open Application   http://127.0.0.1:4723                             automationName=${ANDROID_AUTOMATION_DRIVER}
        ...                platformName=Android                              deviceName=${ANDROID_DEVICE}
        ...                platformVersion=${ANDROID_PLATFORM_VERSION}       app=${ANDROID_APP}
        ...                newCommandTimeout=${240}                          noReset=${False}
    END

Get Element Locator On Mobile
    [Arguments]       ${locators_on_both_platform}
    IF  'android' in $locators_on_both_platform
        IF  $PLATFORM == "iOS"
            ${locator}    Get From Dictionary     ${locators_on_both_platform}     iOS
        ELSE
            ${locator}    Get From Dictionary     ${locators_on_both_platform}     android 
        END
    ELSE
        ${locator}   Set Variable    ${locators_on_both_platform} 
    END
    RETURN    ${locator}
        
