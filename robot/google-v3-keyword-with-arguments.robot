*** Settings ***
Library  SeleniumLibrary
Library  String
Suite Setup  เข้าไปยังหน้าค้นหาของ google
Suite Teardown  Close Browser
Test Teardown  กลับไปยังหน้าค้นหา

*** Variables ***
${URL}    http://google.com
${XXX}    ${EMPTY}   # คือการประกาศตัวแปรแบบค่าว่าง

*** Test Cases ***
ค้นหาคำว่าเหล็กไหล
    [Tags]    Testing
    ค้นหาคำว่า    เหล็กไหล
    จะต้องเจอ "เหล็กไหล" นะ

ค้นหาคำว่าชานมไข่มุก
    [Tags]    BubbleTea
    # ค้นหาคำว่าV2 ชานมไข่มุก
    ค้นหาคำว่าV3 "ชานมไข่มุก"
    # จะต้องเจอ "ชานมไข่มุก" นะ

*** Keywords ***
เข้าไปยังหน้าค้นหาของ google
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window

ค้นหาคำว่า
    [Arguments]    ${keyword}
    Input Text    name:q    ${keyword}
    Press Keys    name:q    ENTER

# Embedded argument ถ้าจะใช้แนะนำ V3
ค้นหาคำว่าV2 ${keyword}   # เอา argument ยัดเข้าไปใน keyword -> เว้นแค่ space เดียว  จะใส่ตรงไหนของ keyword ก็ได้
    Input Text    name:q    ${keyword}
    Press Keys    name:q    ENTER

ค้นหาคำว่าV3 "${keyword}"   # เอา argument ยัดเข้าไปใน keyword โดยเน้น keyword โดยการใส่ "" -> เว้นแค่ space เดียว  //แนะนำแบบนี้
    Input Text    name:q    ${keyword}
    Press Keys    name:q    ENTER

จะต้องเจอ "${expected result}" นะ  # ตัวแปรมี space ได้นะ
    Wait Until Element Contains
    ...    xpath://*[@id="tvcap"]/div/div/div/div[1]/h3/span    ${expected result}   # ... คือการต่อบรรทัด
    ${results}=    Get Text    id:resultStats
    Log To Console  ${results}
    ${resultSplit}=  Split String  ${results}  separator=${SPACE}  max_split=3
    Should Be Equal    ผลการค้นหาประมาณ    ${resultSplit}[0]
    Should Be Equal    รายการ    ${resultSplit}[2]

    ${cleanData}=    Remove String    ${resultSplit}[3]    ${SPACE}
    Should Start With    ${cleanData}    (
    Should End With    ${cleanData}    )

    Should Match Regexp   ${results}    ^ผลการค้นหาประมาณ (\\d*\\.?\\d+|\\d{1,3}(,\\d{3})*(\\.\\d+)?)( รายการ \\()(0.\\d+)( วินาที\\) )$

กลับไปยังหน้าค้นหา
    Go To    ${URL}