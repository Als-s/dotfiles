#!/usr/bin/env bash

# ~/.config/hypr/scripts/hypridle_toggle.sh

LOG_FILE="/tmp/hypridle_paused.log"
CAFE_ICON="󰜎"  
ACTIVE_ICON="󰒲" 

if [ -f "$LOG_FILE" ]; then
    # Pausado -> Reactivar
    hypridle &
    rm "$LOG_FILE"
    notify-send -t 3000 "$ACTIVE_ICON MODO ACTIVO" "Hypridle activado. La PC volverá a bloquearse."
else
    # Activo -> Pausar
    pkill hypridle
    touch "$LOG_FILE"
    notify-send -t 3000 "$CAFE_ICON MODO CAFÉ" "Hypridle desactivado. La PC NO se bloqueará."
fi
