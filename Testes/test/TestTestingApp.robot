*** Settings ***
Library  SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${browser}  chrome
${url}  http://nodeJS:3000


*** Test Cases ***
IsOnline
    Run Keyword And Continue On Failure     open browser    ${url}  ${browser}
    element should be visible   xpath://pre
    close browser

*** Keywords ***
