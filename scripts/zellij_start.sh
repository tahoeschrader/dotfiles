#!/bin/bash

SESSION_NAME="$1"
LAYOUT_FILE="$2"

if zellij list-sessions | grep -q "$SESSION_NAME"; then
  zellij delete-session "$SESSION_NAME"
  zellij -s "$SESSION_NAME" -l "$LAYOUT_FILE"
else
  zellij -s "$SESSION_NAME" -l "$LAYOUT_FILE"
fi
