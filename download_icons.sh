#!/bin/bash

# Script para descargar todos los íconos de Iconify que se usan en la app

# Crear directorio de íconos si no existe
mkdir -p assets/icons

# Lista de íconos usados en la app (extraídos del código)
declare -a icons=(
    "majesticons:more-menu-line"
    "ic:round-close"
    "ic:round-plus"
    "iconoir:cancel"
    "material-symbols-light:search-rounded"
    "iconamoon:notification-thin"
    "icon-park-outline:left"
    "icon-park-outline:up"
    "iconamoon:news-thin"
    "material-symbols:cancel-outline-rounded"
    "fluent-mdl2:return-to-session"
    "mynaui:plus"
    "weui:location-outlined"
    "clarity:edit-line"
    "mdi:heart"
    "mdi:heart-outline"
    "mdi:bookmark"
    "mdi:bookmark-outline"
    "iconamoon:home-thin"
    "ph:bag-thin"
    "lets-icons:question-light"
    "material-symbols-light:edit-note-outline-sharp"
    "iconamoon:profile-thin"
)

echo "🔽 Descargando ${#icons[@]} íconos..."

for icon in "${icons[@]}"
do
    # Reemplazar : y / por _
    filename=$(echo "$icon" | sed 's/[:/]/_/g')
    
    # URL de Iconify API
    url="https://api.iconify.design/${icon}.svg"
    
    echo "  📥 Descargando $icon..."
    curl -s "$url" -o "assets/icons/${filename}.svg"
    
    if [ $? -eq 0 ]; then
        echo "  ✅ Guardado como ${filename}.svg"
    else
        echo "  ❌ Error descargando $icon"
    fi
done

echo ""
echo "✨ ¡Listo! Íconos guardados en assets/icons/"
echo "📝 Ahora actualiza pubspec.yaml para incluir:"
echo "  assets:"
echo "    - assets/icons/"
