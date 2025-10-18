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
    Wait Until Element Is Visible       ${StorageTypeBtn}    2s
    Click Element       ${StorageTypeBtn}

Adding Valid Storage Type Name
    [Documentation]     Adding valid Storage Type Name
    Wait Until Element Is Visible    ${StorageTypeName_Input}    2s
    Input Text    ${StorageTypeName_Input}    TestingStorageType
    Sleep    2s

Clicking on Create Button to add Storage Type
    [Documentation]     Clicking on Create Button to add Storage Type
    Wait Until Element Is Visible    ${Create_Btn}    2s
    Click Element    ${Create_Btn}