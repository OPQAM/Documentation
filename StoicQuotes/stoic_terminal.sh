#!/bin/bash
# Path to stoic quotes
QUOTES_FILE=/home/opqam/PROJECTS/Documentation/StoicQuotes/stoic-quotes.md

# Count number of lines in stoic file
NUM_QUOTES=$(wc -l < "$QUOTES_FILE")

# Generate random number between 1 and that number
RANDOM_NUM=$((1 + RANDOM % NUM_QUOTES))

# Display the quote and empty lines
echo ""
sed -n "${RANDOM_NUM}p" "$QUOTES_FILE"
echo ""
