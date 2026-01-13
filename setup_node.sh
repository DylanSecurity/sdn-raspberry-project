#!/bin/bash
# Script de Instalación - Nodo OVS
# Autor: Dylan Moraga

# CONFIGURACION: Cambia esto por la IP de tu controlador real
IP_CONTROLADOR="192.168.1.127"

echo "--- Iniciando instalación del Nodo OVS ---"

# 1. Instalar Open vSwitch
sudo apt update
sudo apt install openvswitch-switch -y

# 2. Validar servicio
sudo ovs-vsctl show

# 3. Crear Bridge y configurar OpenFlow 1.3
echo "--- Configurando Bridge br0 ---"
sudo ovs-vsctl add-br br0
sudo ovs-vsctl set bridge br0 protocols=OpenFlow13

# 4. Conectar al controlador
echo "--- Conectando al controlador en $IP_CONTROLADOR ---"
sudo ovs-vsctl set-controller br0 tcp:$IP_CONTROLADOR:6653

# 5. Verificación final
echo "--- Estado Final ---"
sudo ovs-vsctl show
sudo ovs-ofctl -O OpenFlow13 show br0