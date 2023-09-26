#!/bin/bash
filepath="/home/ubuntu/memorylogs"

echo "$(date)" >> "$filepath"
echo "============================================" >> "$filepath"
free -h >> "${filepath}"
echo "============================================" >> "${filepath}"

echo "saved to memory logs"
