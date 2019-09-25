*** Settings ***
Library  SeleniumLibrary
Library  String
Suite Setup  เข้าไปยังหน้าค้นหาของ google
Suite Teardown  Close Browser
Default Tags  v5

*** Variables ***
${URL}    http://google.com
${XXX}    ${EMPTY}   # คือการประกาศตัวแปรแบบค่าว่าง

*** Test Cases ***
Search
    [Template]  Flow search in google
    #    keyword    #    Expected result
    เหล็กไหล         เหล็กไหล
    ชานมไข่มุก        ชานมไข่มุก

*** Keywords ***
เข้าไปยังหน้าค้นหาของ google
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window

Flow search in google
# Template แบบที่ 2 : Template per Test Case  Ex. Success มี 2 Test Case  แต่ละ Test Case มี Template ของตัวเอง
# แบบนี้ ถ้า Data ไหน Failed Test Case นั้นจะ Failed ไปเลย
    [Arguments]    ${keyword}   ${expectedResult}
    ค้นหาคำว่า "${keyword}"
    จะต้องเจอ "${expectedResult}" นะ
    กลับไปยังหน้าค้นหา

ค้นหาคำว่า "${keyword}"   # เอา argument ยัดเข้าไปใน keyword โดยเน้น keyword โดยการใส่ "" -> เว้นแค่ space เดียว  //แนะนำแบบนี้
    Input Text    name:q    ${keyword}
    Press Keys    name:q    ENTER

จะต้องเจอ "${expected result}" นะ  # ตัวแปรมี space ได้นะ
    Wait Until Element Contains
    ...    xpath://*[@id="tvcap"]/div/div/div/div[1]/h3/span    ${expected result}   # ... คือการต่อบรรทัด
    ${results}=    Get Text    id:resultStats
    Log To Console  ${results}
    ${resultSplit}=    Split String  ${results}  separator=${SPACE}  max_split=3
    Should Be Equal    ผลการค้นหาประมาณ    ${resultSplit}[0]
    Should Be Equal    รายการ    ${resultSplit}[2]

    ${cleanData}=    Remove String    ${resultSplit}[3]    ${SPACE}
    Should Start With    ${cleanData}    (
    Should End With    ${cleanData}    )

    Should Match Regexp   ${results}    ^ผลการค้นหาประมาณ (\\d*\\.?\\d+|\\d{1,3}(,\\d{3})*(\\.\\d+)?)( รายการ \\()(0.\\d+)( วินาที\\) )$

กลับไปยังหน้าค้นหา
    Go To    ${URL}