#!/usr/bin/env bash

# ~/.config/hypr/scripts/hypridle_status.sh

LOG_FILE="/tmp/hypridle_paused.log"
CAFE_ICON="󰜎"
ACTIVE_ICON="󰒲"

if [ -f "$LOG_FILE" ]; then
    # MODO CAFÉ ON: Devuelve JSON con la clase "cafe-active"
    echo "{\"text\":\"$CAFE_ICON\", \"class\":\"cafe-active\", \"tooltip\": \"Modo Café (Pausado)\"}"
else
    # MODO ACTIVO OFF: Devuelve JSON sin la clase
    echo "{\"text\":\"$ACTIVE_ICON\", \"class\":\"\", \"tooltip\": \"Modo Activo\"}"
fi
