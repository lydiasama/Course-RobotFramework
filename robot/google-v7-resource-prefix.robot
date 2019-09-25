*** Settings ***
Resource  ../resource/google-resource.robot
Library  SeleniumLibrary
Library  String
Suite Setup  google-resource.เข้าไปยังหน้าค้นหาของ google
Suite Teardown  Close Browser
Default Tags  v6

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
    google-resource.ค้นหาคำว่า "${keyword}"
    google-resource.จะต้องเจอ "${expectedResult}" นะ
    google-resource.กลับไปยังหน้าค้นหา

# ใส่ Prefix ให้ keyword ที่มาจาก resouce โดยการใส่ชื่อไฟล์ ​resource เข้าไป
# ต้องทำเมื่อ test นั้นๆ มีการใช้หลายๆ resource