*** Settings ***

Resource   ../Resources/PO/LandingPage.robot

*** Keywords ***
token is created and invalid recipient is created then response is not 200
    ${headers1}=  Create Dictionary    Authorization=${token}  Content-Type=application/json
#   ${data}=        Create Dictionary  ${accessToken}
#    ${headers}=   Create Dictionary      Content-Type=application/json
    ${json1}    Get Binary File  ${json_path}recipient.json
    ${response}    Post Request  session  /recipient-template/recipient_templates  data=${json1}  headers=${headers1}
    Should Be Equal As Strings  ${response.status_code}  422

token is created and ngn to usd transaction is created then response is 200
    ${headers1}=  Create Dictionary    Authorization=${token}  Content-Type=application/json
#   ${data}=        Create Dictionary  ${accessToken}
#    ${headers}=   Create Dictionary      Content-Type=application/json
    ${json1}    Get Binary File  ${json_path}ngnusdtxn.json
    ${response}    Post Request  session  /square-peg/transactions  data=${json1}  headers=${headers1}
    Should Be Equal As Strings  ${response.status_code}  201