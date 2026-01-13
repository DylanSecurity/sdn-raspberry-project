# Implementación de Red SDN con Raspberry Pi y Ryu

Este repositorio contiene los scripts de configuración para desplegar una infraestructura SDN básica utilizando Raspberry Pi 4, Open vSwitch y el controlador Ryu.

## 📋 Requisitos
* **Hardware:** 2x Raspberry Pi (o máquinas virtuales).
* **SO:** Raspberry Pi OS Lite (64-bit).
* **Red:** Conexión TCP/IP configurada (IPs Estáticas recomendadas).

## 🚀 Instalación y Uso

### 1. Preparar el Controlador (Cerebro)
En la Raspberry destinada a ser el controlador:
1. Clonar este repositorio.
2. Dar permisos de ejecución: `chmod +x setup_controller.sh`
3. Ejecutar el script: `./setup_controller.sh`
4. Iniciar el controlador:
   ```bash
   source sdn-env/bin/activate
   ryu-manager ryu.app.simple_switch_13

### 2. Preparar el Nodo (Switch OVS)
En la Raspberry destinada a ser el nodo:
1. Editar el archivo setup_node.sh y colocar la IP correcta del controlador.
2. Dar permisos: chmod +x setup_node.sh
3. Ejecutar: ./setup_node.sh

✅ Verificación
Para validar la conexión, ejecutar en el nodo:
`sudo ovs-vsctl show`
