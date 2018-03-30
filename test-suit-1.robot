*** Settings ***
Documentation   Robot Framework self-testing 

*** Test Cases ***
1-1: Test unit one
	[Tags] 	Suite1 Self-Tesing 1st
        [Documentation]   Test unit test. Do nothing
        Log To Console    "Hello tester!"
1-2: Test unit two
	[Tags] 	Suite1 Self-Testing 2nd
        Log To Console    "This test always successful"

