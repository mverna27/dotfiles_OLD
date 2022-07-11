#!/bin/sh

# check if adaptive sync is enabled
test -z "$(swaymsg -t get_outputs | grep "\"adaptive_sync_status\": \"enabled\",")" || echo VRR on
