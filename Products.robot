*** Settings ***
Documentation    File Configuration tests - automates file configuration creation using SeleniumLibrary.
Library    SeleniumLibrary
Resource   locators.robot
*** Test Cases ***
Login To Website
    [Documentation]    Open website and log in
    Open Browser    http://vm.3em.tech      chrome
    Sleep   5s
    Maximize Browser Window
    Execute JavaScript    document.body.style.zoom="50%"
Locating Product Tab
    [Documentation]     Locate to Product Types Tab
    Wait Until Element Is Visible       ${ProductBtn}    2s
    Click Element       ${ProductBtn}
Selecting Product Type from Dropdown
    [Documentation]     Selecting existing file configuration
    Wait Until Element Is Visible    ${ProductName_Select}    2s
    Select From List By Index        ${ProductName_Select}    1
    Sleep    2s
Adding Product by Clicking Add Button
    [Documentation]     Clicking on Create Button to add product type
    Wait Until Element Is Visible    ${Btn_Add}    2s
    Click Element    ${Btn_Add}