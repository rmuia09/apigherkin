*** Settings ***
Library  RequestsLibrary
Library  json
Library  SeleniumLibrary  # only used to display something we get back from API test
#Library  Collections
#Library  ExtendedRequestsLibrary
Library  OperatingSystem

*** Variables ***
${Base_URL}   https://services-staging.tradebfx.com
#${json_path}  /Users/richardmuia/Documents/
${json_path}    /Users/richardmuia/Documents/



*** Keywords ***
session is open and response is 200 then create token
    # Create the Session
#    ${token}=    Set Variable    Bearer
    Create Session  session  ${Base_URL}  disable_warnings=1
    ${headers}=   Create Dictionary      Content-Type=application/json
    ${json}    Get Binary File  ${json_path}auth.json
    ${resp}    Post Request  session  /auth/login  data=${json}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}     200


    ${accessToken}=    evaluate    $resp.json().get("access_token")
    Log to Console        ${accessToken}

    ${token}=    catenate    Bearer    ${accessToken}


    BuiltIn.Log to Console    ${token}
    Set Suite Variable    ${token}





