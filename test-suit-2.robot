*** Settings ***
Documentation   Robot Framework self-testing 

*** Test Cases ***
2-1: Test unit one
	[Tags] 	Suite2 Self-Tesing 1st
        [Documentation]   Test unit test. Do nothing
        Log To Console    "Hello! This is 2nd suite"
2-2: Test unit two
	[Tags] 	Suite2 Self-Testing 2nd
        Log To Console    "This test always successful"

