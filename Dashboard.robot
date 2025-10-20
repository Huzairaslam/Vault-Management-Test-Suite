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
    Wait Until Element Is Visible       ${HomeBtn}    2s
    Click Element       ${HomeBtn}