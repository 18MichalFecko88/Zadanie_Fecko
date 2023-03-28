*** Settings ***
Documentation       Playwright multitude
Library             RPA.Browser.Playwright

*** Variables ***
${BROWSER}         chromium
${HEADLESS}        false
${SCREEN_WIDTH}    1920
${SCREEN_HEIGHT}   1080
${BASE_URL}        https://www.google.com/?hl=en-GB

*** Test Cases ***
Search Multitude in google
    Open Google
    Accept All Cookies
    Enter Text in Google Search Bar
    Click in Multitude site

*** Keywords ***
Open Google
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': ${SCREEN_WIDTH}, 'height': ${SCREEN_HEIGHT}}
    New Page       ${BASE_URL}

Wait Until Page Contains Element
    [Arguments]    ${xpath}    ${timeout}
    
Accept All Cookies
    Click    text="Accept all"
    Sleep    3

Enter Text in Google Search Bar
    Type Text    css=input[title=Search]    multitude.com    clear=True
    Press Keys    css=input[title=Search]    Enter
    Sleep    5

Click in Multitude site
    Click         css=a[href*="https://www.multitude.com/careers"]
    Sleep         5
