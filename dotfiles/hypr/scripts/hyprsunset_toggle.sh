#!/usr/bin/env bash

# Archivo de registro (usado solo para verificar que el proceso anterior se haya iniciado)
LOG_FILE="/tmp/hyprsunset.log"

# Temperatura de color deseada
CUSTOM_TEMP="4800"

# Verificar si Hyprsunset ya está corriendo (por nombre de proceso)
if pgrep -x "hyprsunset" > /dev/null
then
    # 1. ESTADO ACTIVO -> ACCION: DESACTIVAR
    pkill hyprsunset
    if [ -f "$LOG_FILE" ]; then
        rm "$LOG_FILE"
    fi
    notify-send -t 3000 "󱩓 Hyprsunset" "Filtro de luz azul Desactivado (Normal)."
    
    # Le decimos a SwayNC que cambie el estado visual del botón
    exit 0 
else
    # 2. ESTADO INACTIVO -> ACCION: ACTIVAR
    hyprsunset --temperature "$CUSTOM_TEMP" > "$LOG_FILE" 2>&1 &
    notify-send -t 3000 "󱩓 Hyprsunset" "Filtro de luz azul Activado ($CUSTOM_TEMP K)."
    
    # Le decimos a SwayNC que cambie el estado visual del botón
    exit 0
fi

# Si el script fallara por alguna razón, podríamos usar 'exit 1'
# para que el botón mantenga su estado visual anterior.
