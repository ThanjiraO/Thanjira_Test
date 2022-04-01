*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  ie
    Wait Until Page Contains  Hello, Sign in

    #A user search for product
    click element  id:twotabsearchtextbox
    Input Text  id:twotabsearchtextbox  Ferrari 458
    click button  id:nav-search-submit-button
    page should contain  results for "Ferrari 458
    Wait Until Page Contains  results for "Ferrari 458"  30
    Click Link  //span[@cel_widget_id='MAIN-SEARCH_RESULTS-1']//h2/a
    Wait Until Page Contains  Back to results


    #A user adds product to shopping cart
    click element  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart

    #A user clicks "Proceed to Checkout" button
    Click Link  id=hlb-ptc-btn-native
    Page Should Contain Element  continue

    #User closes browser
    Close Browser

*** Keywords ***
