#!/bin/bash

# Archivo de salida
ARCHIVO="usuarios_linux.csv"

# Encabezado del archivo CSV
echo "Usuario, UID, GID, Directorio Home, Shell, Privilegios (sudo), Dominio" > "$ARCHIVO"

# Listar usuarios y obtener información relevante
while IFS=':' read -r usuario pass uid gid info home shell
do
  # Verificar privilegios sudo
  if grep -q "^$usuario" /etc/sudoers || sudo -l -U "$usuario" | grep -q "ALL : ALL" ; then
    privilegios="sudo"
  else
    privilegios="no sudo"
  fi

  # Determinar si el usuario pertenece a un dominio (ejemplo con realm)
  if realm list | grep -q "domain-name: example.com" ; then
    dominio="example.com"
  else
    dominio="local"
  fi

  # Imprimir en el archivo CSV
  echo "$usuario, $uid, $gid, $home, $shell, $privilegios, $dominio" >> "$ARCHIVO"

done < /etc/passwd

echo "Información de usuarios guardada en: $ARCHIVO"
# Fin del script

# Este script extrae información de usuarios en un sistema Linux y la guarda en un archivo CSV.
# Elaborado por Alex Cabello Leiva - AlexCocoPro

echo "Script elaborado por Alex Cabello Leiva - AlexCocoPro"

