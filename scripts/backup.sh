#!/bin/bash

# Configuración de rutas y fechas
BACKUP_DIR="../docs"
FECHA=$(date +%Y-%m-%d_%H-%M-%S)
NOMBRE_RESPALDO="backup_wordpress_$FECHA.sql"

echo "=================================================="
echo "🚀 Iniciando respaldo automático de la Base de Datos..."
echo "=================================================="

# Comando de Docker para exportar la base de datos MariaDB sin detener el servicio
docker exec wordpress_db mysqldump -u wp_user -pwp_password_segura wordpress_db > "$BACKUP_DIR/$NOMBRE_RESPALDO"

# Verificar si el archivo se creó correctamente
if [ -f "$BACKUP_DIR/$NOMBRE_RESPALDO" ]; then
    echo "✅ ¡Respaldo completado con éxito!"
    echo "📁 Guardado en: $BACKUP_DIR/$NOMBRE_RESPALDO"
else
    echo "❌ Error: No se pudo generar el respaldo."
fi
echo "=================================================="
