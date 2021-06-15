#!/bin/bash

# Test if a command exist
test_command() {
    command_to_check="$1"

    return "$(command $command_to_check > /dev/null 2>&1)"
}
