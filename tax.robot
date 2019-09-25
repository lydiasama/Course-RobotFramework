*** Settings ***
Library  SeleniumLibrary
Test Teardown  Close Browser

*** Variables ***

*** Test Cases ***
ยื่นแบบภาษีออนไลน์
    เปิดเว็บ
    เข้าไปยังแท็บยื่นแบบภาษีออนไลน์

*** Keywords ***
เปิดเว็บ
    Open Browser    https://rdserver.rd.go.th    chrome

เข้าไปยังแท็บยื่นแบบภาษีออนไลน์
    Click Element    xpath://*[@id="menuList"]/li[3]/a
    Select Frame    xpath://*[@id="lightboxdialog"]/p/iframe
    Click Link    คลิก
    Unselect Frame
    Switch Window
    Click Element    xpath://*[@id="lightboxdialog"]/button
