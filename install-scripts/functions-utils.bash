#!/bin/bash

# Test if a command exist
test_command() {
    command $@ >/dev/null 2>&1
}
