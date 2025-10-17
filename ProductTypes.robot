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

Locating Product Types
    [Documentation]     Locate to Product Types Tab
    Wait Until Element Is Visible       ${ProductTypesBtn}    2s
    Click Element       ${ProductTypesBtn}

Entering Valid Product Type Name
    [Documentation]     Creating new valid product type
    Wait Until Element Is Visible    ${ProductTypeName_Input}    2s
    Input Text    ${ProductTypeName_Input}    SampleProductType
    Sleep    1s

Selecting File Configuration from Dropdown
    [Documentation]     Selecting existing file configuration
    Wait Until Element Is Visible    ${FileConfig_Select}    2s
    Select From List By Index        ${FileConfig_Select}    1
    Sleep    2s

Adding Product Type by Clicking Create Button
    [Documentation]     Clicking on Create Button to add product type
    Wait Until Element Is Visible    ${Create_Btn}    2s
    Click Element    ${Create_Btn}