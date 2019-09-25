*** Settings ***
# Library    FakerLibrary   # เอาไว้  Fake ข้อมูล Test
Library  SeleniumLibrary
Resource  ../resource/signup-success-resource.robot
Resource  ../resource/thankyou-resource.robot
Suite Setup  Open Signup Page
Suite Teardown  Close Browser

*** Variables ***
${URL}    https://goo.gl/iCce7C

*** Test Cases ***
เด็กหญิงรัญชนาทำการสมัครเป็นสมาชิกใหม่ของระบบ
    กรอกชื่อ "Runchana" นามสกุล "Jingjit"
    กรอกข้อมูลที่อยู่ "Bangkok, Thailand" "10250"
    Submit
    ผลการสมัครสำเร็จ แสดงคำว่า Thank you

*** Keywords ***
Open Signup Page
    signup-success-resource.Open

กรอกชื่อ "${firstname}" นามสกุล "${lastname}"
    signup-success-resource.Fill in firstname "${firstname}"
    signup-success-resource.Fill in lastname "${lastname}"

กรอกข้อมูลที่อยู่ "${address}" "${zipcode}"
    signup-success-resource.Fill in Address "${address}"
    signup-success-resource.Fill in Zipcode "${zipcode}"

Submit
    signup-success-resource.Sign up

ผลการสมัครสำเร็จ แสดงคำว่า Thank you
    thankyou-resource.Thank you
    