*** Settings ***
Documentation     Master suite to run all tests in sequence
Library           OperatingSystem

*** Test Cases ***
01 - Run File Configuration Tests
    [Documentation]    Executes FileConfig.robot first
    Run Process    robot    FileConfig.robot
    Should Be Equal As Integers    ${RC}    0

02 - Run Product Type Tests
    [Documentation]    Executes ProductTypes.robot next
    Run Process    robot    ProductTypes.robot
    Should Be Equal As Integers    ${RC}    0

03 - Run Products Tests
    Run Process    robot    Products.robot
    Should Be Equal As Integers    ${RC}    0

04 - Run Storage Types Tests
    Run Process    robot    StorageTypes.robot
    Should Be Equal As Integers    ${RC}    0

05 - Run Storage Tests
    Run Process    robot    Storage.robot
    Should Be Equal As Integers    ${RC}    0

06 - Run Final Product Tests
    Run Process    robot    FinalProduct.robot
    Should Be Equal As Integers    ${RC}    0
