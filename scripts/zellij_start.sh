#!/bin/bash

SESSION_NAME="$1"
LAYOUT_FILE="$2"

zellij delete-session "$SESSION_NAME"
zellij -s "$SESSION_NAME" -l "$LAYOUT_FILE"
