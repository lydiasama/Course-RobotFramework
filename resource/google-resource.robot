
*** Keywords ***
เข้าไปยังหน้าค้นหาของ google
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window
    
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