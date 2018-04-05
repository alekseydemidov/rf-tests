*** Settings ***
Documentation   Testing Junos OS
Library		../libraries/pybot_base.py

Resource	../resources/junos_kw.robot
Resource        ../resources/local_kw.robot
Variables       ../variables/all.yaml

Suite Teardown	Close All Connections
*** Variables ***

*** Test Cases ***

1-1: Test icmp vMX availability
	[Documentation]	 To check hosts availability
	[Tags]	Availability

	Set Section	Ping vMX routers
	Check Icmp Reply From ${r1}
	Check Icmp Reply From ${r2}
	Check Icmp Reply From ${r3}

1-2: Test ssh login to vMX 
        [Documentation]  To test login via ssh to routers
        [Tags]  Availability
        Set Section     Test SSH connection to vMX routers
	Device Open Connection ${r1}
        Device Open Connection ${r2}
        Device Open Connection ${r3}
	Close All Connections

2-1: Test NTP configuration
        [Documentation]  To that every vMX has configured NTP server
        [Tags]	Configuration
	Set Section     Check NTP configuration
	Check NTP configuration		${r1}
        Check NTP configuration         ${r2}
        Check NTP configuration         ${r3}

2-2: Test SSH max-sessions-per-connection
        [Documentation]  Check that vMX configured with max-sessions-per-connection >= 10
        [Tags]  Configuration
        Set Section     Check SSH max-sessions-per-connection
	Check Max SSH Connection more than 31 on ${r1}
        Check Max SSH Connection more than 31 on ${r2}
        Check Max SSH Connection more than 31 on ${r3}
