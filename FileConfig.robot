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

Locating File Config
    [Documentation]     Locate to File Config Tab
    Wait Until Element Is Visible       ${FileConfigBtn}    2s
    Click Element       ${FileConfigBtn}

Entering Valid File Name
    [Documentation]     Creating new valid file
    Wait Until Element Is Visible    ${FileName_Input}    2s
    Input Text    ${FileName_Input}    test
    Sleep    1s
Entering Valid Column Name
    [Documentation]     Creating first column
    Wait Until Element Is Visible    ${ColumnName_Input_1}    2s
    Input Text    ${ColumnName_Input_1}    Col-1
    Wait Until Element Is Visible    ${DataType_Select}    3s
    Select From List By Label        ${DataType_Select}    Numeric
    Sleep    2s
Clicking Add More Column Button
    [Documentation]     Adding second column
    Wait Until Element Is Visible    ${AddColumn_Btn}    2s
    Click Element    ${AddColumn_Btn}
    Sleep    2s
Entering Second Column
    [Documentation]     Creating second column
    Wait Until Element Is Visible    ${ColumnName_Input_2}    2s
    Input Text    ${ColumnName_Input_2}    Col-2
    Wait Until Element Is Visible    ${DataType_Select}    3s
    Select From List By Label        ${DataType_Select}    AlphaNumeric
    Sleep    2s
Adding File Configuration by Clicking Create Button
    [Documentation]     Clicking on Create Button to add file configuration
    Wait Until Element Is Visible    ${Create_Btn}    2s
    Click Element    ${Create_Btn}