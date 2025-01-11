#!/bin/bash

command="$1"
path="$2"
DATABASE_URL=postgresql://tester:password@127.0.0.1:5432/testing cargo "$command" --manifest-path "$path"
