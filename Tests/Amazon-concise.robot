*** Settings ***
Documentation  These test cases use a 2nd level keyword to wrap up multiple 1st level keywords for brevity
# notice we're no longer referencing the Selenium2Library in our script!
#Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
#Resource  ../Resources/LandingPage.robot  # necessary for lower level keywords in test cases
Resource   ../Resources/PO/LandingPage.robot
Resource   ../Resources/PO/TopNav.robot
#Test Setup  Begin Web Test
#Test Teardown  End Web Test
#*** Variables ***
#${json_path}    /Users/richardmuia/Documents/
# Copy/paste the below command to Terminal to execute:
# pybot -d results/concise tests/amazon-concise.robot

*** Test Cases ***
Create Token
    [Tags]  Smoke
    # use control-b on each keyword to see lower level keywords
    Given session is open and response is 200 then create token
#    When user is logged in
#    And response is 200
#    Then create token

Add Recipient
    [Tags]  Smoke
    Given token is created and invalid recipient is created then response is not 200

























#Logged out user can view a product
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    When user selects a searched product
#    Then correct product page loads
#
#Logged out user can add product to cart
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    And user selects a searched product
#    When user adds that product to their cart
#    Then the product is present in cart
#
#Logged out user must sign in to check out
#    [Tags]  Smoke
#    # use control-b on each keyword to see lower level keywords
#    Given user is not logged in
#    And user adds a product to their cart
#    When user attempts to checkout
#    Then the user is required to sign in








