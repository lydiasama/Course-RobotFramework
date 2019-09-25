*** Keywords ***
Open
    Open Browser    ${URL}    browser=chrome

Fill in firstname "${firstname}"
    Input Text    id:firstname    ${firstname}

Fill in lastname "${lastname}"
    Input Text    id:lastname    ${lastname}

Fill in Address "${address}"
    Input Text    id:address    ${address}

Fill in Zipcode "${zipcode}"
    Input Text    id:zipcode    ${zipcode}

Sign up
    Click Button    id:signup
