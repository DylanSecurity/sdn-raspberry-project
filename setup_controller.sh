#!/bin/bash
# Script de Instalación - Controlador SDN (Ryu)
# Autor: Dylan Moraga
# Fecha: Enero 2026

echo "--- Iniciando instalación del Controlador SDN ---"

# 1. Actualizar sistema
sudo apt update && sudo apt upgrade -y

# 2. Instalar dependencias de Python y Git
sudo apt install git python3-pip python3-venv -y

# 3. Crear entorno virtual
echo "--- Creando entorno virtual (sdn-env) ---"
python3 -m venv sdn-env
source sdn-env/bin/activate

# 4. Instalar Ryu y Eventlet
echo "--- Instalando Ryu y dependencias ---"
pip install --upgrade pip
pip install ryu eventlet

# 5. PARCHE AUTOMÁTICO para error de Python 3.13 y Eventlet
# Esto soluciona el error 'ALREADY_HANDLED' automáticamente
echo "--- Aplicando parche de compatibilidad para Python 3.13 ---"
FILE_PATH=$(find sdn-env/lib/ -name wsgi.py | grep ryu/app)

if [ -f "$FILE_PATH" ]; then
    sed -i 's/from eventlet.wsgi import ALREADY_HANDLED/# from eventlet.wsgi import ALREADY_HANDLED\nALREADY_HANDLED = object()/g' "$FILE_PATH"
    echo "Parche aplicado exitosamente en: $FILE_PATH"
else
    echo "ADVERTENCIA: No se encontró el archivo wsgi.py para parchar."
fi

echo "--- Instalación Completa ---"
echo "Para iniciar el controlador usa:"
echo "source sdn-env/bin/activate"
echo "ryu-manager ryu.app.simple_switch_13"