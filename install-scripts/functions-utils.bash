#!/bin/bash

# Test if a command exist
test_command() {
    command_to_check="$1"
    command $command_to_check > /dev/null 2>&1
}
