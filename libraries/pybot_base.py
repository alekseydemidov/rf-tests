#!/usr/bin/env python
from __future__ import print_function

from robot.libraries.BuiltIn import BuiltIn

def set_section (msg):
	BuiltIn().log_to_console ("\n##"+"#"*len(msg)+"##")
	BuiltIn().log_to_console ("# "+msg+" #")
	BuiltIn().log_to_console ("##"+"#"*len(msg)+"##")

if __name__ == "__main__":
	set_section("Hello")
