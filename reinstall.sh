#!/bin/bash
# Script para limpiar y reinstalar la app Flutter
# Útil cuando necesitas asegurar que los cambios se apliquen completamente

set -e  # Detener si hay algún error

echo "🧹 Limpiando proyecto Flutter..."
echo "================================"

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Obtener el package name
PACKAGE_NAME=$(grep "applicationId" android/app/build.gradle.kts | sed 's/.*applicationId = "\(.*\)".*/\1/' | tr -d ' ')

echo -e "${BLUE}📦 Package name: ${NC}$PACKAGE_NAME"
echo ""

# 2. Verificar si hay un dispositivo conectado
DEVICE_COUNT=$(adb devices | grep -v "List" | grep "device$" | wc -l)

if [ $DEVICE_COUNT -eq 0 ]; then
    echo -e "${YELLOW}⚠️  No hay dispositivos conectados${NC}"
    echo "Conecta tu dispositivo y vuelve a ejecutar este script"
    exit 1
fi

echo -e "${BLUE}📱 Dispositivos conectados: $DEVICE_COUNT${NC}"
echo ""

# 3. Desinstalar la app del dispositivo
echo -e "${BLUE}🗑️  Desinstalando app del dispositivo...${NC}"
adb uninstall $PACKAGE_NAME 2>/dev/null || echo "App no estaba instalada"
echo ""

# 4. Limpiar proyecto Flutter
echo -e "${BLUE}🧼 Ejecutando flutter clean...${NC}"
flutter clean
echo ""

# 5. Obtener dependencias
echo -e "${BLUE}📥 Obteniendo dependencias...${NC}"
flutter pub get
echo ""

# 6. Regenerar iconos (si cambiaron)
# Este codigo solo lo hará si pasamos flag --regen-icons
if [[ " $@ " =~ " --regen-icons " ]]; then
  echo -e "${BLUE}🎨 Regenerando iconos de la app...${NC}"
  dart run flutter_launcher_icons
  echo ""
fi

# 7. Compilar e instalar
echo -e "${BLUE}🚀 Compilando e instalando en el dispositivo...${NC}"
echo ""
flutter run --uninstall-first

echo ""
echo -e "${GREEN}✅ ¡Proceso completado!${NC}"
echo "La app se ha limpiado, recompilado e instalado correctamente"
