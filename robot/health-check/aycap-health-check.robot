*** Settings ***
Library  SeleniumLibrary
# Test Teardown  Close Browser

*** Variables ***
${URL}    https://forms.office.com/Pages/ResponsePage.aspx?id=FMYTxoJu1EqDB6POlzKp-IDsoD5e39hJslpqkYNwZ0hUNDA5VUpFR08zNjlCV1NPNk5US0kzM1lNMC4u&qrcode=true
${id}    11265543
${name}    รัญชนา จริงจิตร
${team}    Innovation & Fintech
${manager}    Chattraporn Ingkanantavaree
${floor}    20
${reason}    ใกล้ชิดกับบุคคล N-1

*** Test Cases ***
กรอกแบบฟอร์มสุขภาพ
    เปิดเว็บ
    กรอกแบบฟอร์ม
    กดส่งข้อมูล

*** Keywords ***
เปิดเว็บ
    Open Browser    ${URL}    browser=chrome
    Maximize Browser Window

กรอกแบบฟอร์ม
    Click Element    css=.\__question__:nth-child(1) .office-form-question-textbox
    Input Text    css=.\__question__:nth-child(1) .office-form-question-textbox    ${id}

    Click Element    css=.\__question__:nth-child(2) .office-form-question-textbox
    Input Text    css=.\__question__:nth-child(2) .office-form-question-textbox    ${name}
    
    Click Element    css=.\__question__:nth-child(3) .office-form-question-textbox
    Input Text    css=.\__question__:nth-child(3) .office-form-question-textbox    ${team}
    
    Click Element    css=.office-form-other-answer:nth-child(21) .office-form-other-answer-textbox
    Input Text    css=.office-form-other-answer:nth-child(21) .office-form-other-answer-textbox    ${manager}

    Click Element    css=.\__question__:nth-child(5) .office-form-question-choice:nth-child(2) input
    
    Click Element    css=.\__question__:nth-child(6) .office-form-question-textbox
    Input Text    css=.\__question__:nth-child(6) .office-form-question-textbox    ${floor}

    Click Element    css=.office-form-other-answer:nth-child(5) .office-form-other-answer-textbox
    Input Text    css=.office-form-other-answer:nth-child(5) .office-form-other-answer-textbox    ${reason}

    Click Element    css=.\__question__:nth-child(8) .office-form-question-choice:nth-child(4) input

    ${checkbox1}=  Run Keyword And Return Status    Element Text Should Be   css=.\__question__:nth-child(12) .office-form-question-choice:nth-child(1) .office-form-question-choice-text-span > span    ปกติ
    Run Keyword If    ${checkbox1}    เลือกปกติ(1)

    ${checkbox2}=  Run Keyword And Return Status    Element Text Should Be   css=.\__question__:nth-child(12) .office-form-question-choice:nth-child(2) .office-form-question-choice-text-span > span    ปกติ
    Run Keyword If    ${checkbox2}    เลือกปกติ(2)

เลือกปกติ(1)
    Click Element   css=.\__question__:nth-child(12) .office-form-question-choice:nth-child(1) input

เลือกปกติ(2)
    Click Element   css=.\__question__:nth-child(12) .office-form-question-choice:nth-child(2) input


กดส่งข้อมูล
    Click Button    Submit
    Wait Until Page Contains    Thanks!
    Wait Until Page Contains    Your response was submitted.
