#!/bin/sh

sudo chvt $(ps x | grep -w sway | grep -o tty[0-9] | grep -o [0-9])
