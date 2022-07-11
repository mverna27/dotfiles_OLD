#!/bin/sh

sudo chvt $(ps aux | grep -w "sway" | grep -o tty[0-9] | grep -o [0-9])
