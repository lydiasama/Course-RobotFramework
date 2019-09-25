*** Settings ***
Library  SeleniumLibrary
Test Teardown  Close Browser

*** Variables ***

*** Test Cases ***
Upload 3 files
    go to upload file page
    
    choose file data_01.png
    choose file data_02.png
    choose file data_03.png
    
    validate file
    
    upload file data_01 should be success
    upload file data_02 should be success
    upload file data_03 should be success

*** Keywords ***
go to upload file page
    Open Browser    https://goo.gl/YE27iy    browser=chrome

choose file data_01.png
    Choose File    xpath:/*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/data_test/data_01.png
choose file data_02.png
    Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/data_test/data_02.png
choose file data_03.png
    Choose File    xpath://*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]    ${CURDIR}/data_test/data_03.png

upload file data_01 should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr/td[5]/button[1]
    Wait Until Page Contains Element    xpath://div[@style="width: 33%;"]
upload file data_02 should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element    xpath://div[@style="width: 67%;"]
upload file data_03 should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element    xpath://div[@style="width: 100%;"]

validate file
    Wait Until Element Contains    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]    Queue length: 3