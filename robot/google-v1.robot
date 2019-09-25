*** Settings ***
Library  SeleniumLibrary
Library  String
Test Teardown  Close Browser

*** Variables ***

*** Test Cases ***
ค้นหาคำว่าเหล็กไหล
    [Tags]    Testing
    เข้าไปยังหน้าค้นหาของ google
    ค้นหาคำว่า เหล็กไหล
    จะต้องเจอ ดูเหล็กไหล

ค้นหาคำว่าเหล็กไหล
    [Tags]    BubbleTea
    เข้าไปยังหน้าค้นหาของ google
    ค้นหาคำว่า เหล็กไหล
    จะต้องเจอ ดูเหล็กไหล

*** Keywords ***
เข้าไปยังหน้าค้นหาของ google
    Open Browser    http://google.com    browser=chrome
    Maximize Browser Window

ค้นหาคำว่า เหล็กไหล
    Input Text    name:q    เหล็กไหล
    Press Keys    name:q    ENTER

จะต้องเจอ ดูเหล็กไหล
    Wait Until Element Contains
    ...    xpath://*[@id="tvcap"]/div/div/div/div[1]/h3/span    ดูเหล็กไหล
    ${results}=    Get Text    id:resultStats
    Log To Console  ${results}
    ${resultSplit}=  Split String  ${results}  separator=${SPACE}  max_split=3
    Should Be Equal    ผลการค้นหาประมาณ    ${resultSplit}[0]
    Should Be Equal    รายการ    ${resultSplit}[2]

    ${cleanData}=    Remove String    ${resultSplit}[3]    ${SPACE}
    Should Start With    ${cleanData}    (
    Should End With    ${cleanData}    )

    Should Match Regexp   ${results}    ^ผลการค้นหาประมาณ (\\d*\\.?\\d+|\\d{1,3}(,\\d{3})*(\\.\\d+)?)( รายการ \\()(0.\\d+)( วินาที\\) )$