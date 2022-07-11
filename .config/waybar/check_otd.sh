#!/bin/sh

# check if opentabletdriver.service is running
test -z "$(systemctl --user status opentabletdriver.service | grep inactive)" && echo OTD on
