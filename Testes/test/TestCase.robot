*** Settings ***
Library  SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${browser}  chrome
${url}  https://demo.nopcommerce.com/


*** Test Cases ***
testInputBox
    Run Keyword And Continue On Failure     open browser    ${url}  ${browser}
    testInputBox
    close browser


LoginTest
    Run Keyword And Continue On Failure     open browser    ${url}  ${browser}
    loginToApp
    close browser


*** Keywords ***
loginToApp
    click link  xpath://a[@class='ico-login']
    element should not be visible   xpath://div[@class='message-error validation-summary-errors']
    input text  id:Email    pavanotraining@gmail.com
    input text  id:Password     Test@123
    click element   xpath://button[@class='button-1 login-button']
    sleep   2

testInputBox
    maximize browser window
    title should be     nopCommerce demo store
    click link  xpath://a[@class='ico-login']
    ${"email_txt"}  set variable     id:Email

    element should be visible   ${"email_txt"}
    element should be enabled   ${"email_txt"}

    input text  ${"email_txt"}   JohnDavid@gmail.com
    sleep   2
    clear element text  ${"email_txt"}
    sleep   1