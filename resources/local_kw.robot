*** Settings ***
Documentation	This file has the keywords for generic test cases

Library		OperatingSystem
*** Variables ***
*** Keywords ***
Check Icmp Reply From ${device}
	[Documentation]  Ping to ${device} 4 times and check that reply more 75%
	${output}=	Run	ping ${device.ip} -c 4
	Should Contain	${output}    4 received 	${output}
