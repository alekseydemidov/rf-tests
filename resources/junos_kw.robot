*** Settings ***
Documentation   This file has the keywords for generic test cases

Library         SSHLibrary
Library		XML	${TRUE}
*** Variables ***

*** Keywords ***
Device Open Connection ${device}
	[Documentation]	 Try connect and login to device via ssh
	Open Connection		${device.ip}	timeout=60
	${output}=	Login   ${device.username}	${device.password}	delay=1

Check NTP configuration
	[Documentation]	 Check that ntp server is properly configured on device
	[Arguments]	${device}
	Device Open Connection ${device}
	${output}= 	Execute Command		show configuration system ntp | display xml
	${root}=	Parse XML	${output}
	${result}=	Evaluate Xpath	${output}	boolean(//system/ntp/server[name='${device.ntp}'])
	Should Be True  ${result}	msg=NTP is not properly configured on ${device.ip}
	Close Connection

Check Max SSH Connection more than ${count} on ${device}
        [Documentation]  Check that snmp community exists on device
        Device Open Connection ${device}
        ${output}=      Execute Command        show configuration system services | display xml 
        ${root}=        Parse XML       ${output}
        ${result}=      Get Element Count  ${output}       //system/services/ssh[max-sessions-per-connection>${count}]
        Should Be True  ${result}       msg=max-sessions-per-connection less that ${count} on ${device.ip}
        Close Connection

