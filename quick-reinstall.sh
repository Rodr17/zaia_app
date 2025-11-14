#!/bin/bash
# Script rápido para reinstalar la app sin limpieza completa
# Útil para cambios menores

set -e

echo "🔄 Reinstalación rápida..."
echo "=========================="

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Obtener package name
PACKAGE_NAME=$(grep "applicationId" android/app/build.gradle.kts | sed 's/.*applicationId = "\(.*\)".*/\1/' | tr -d ' ')

echo -e "${BLUE}📦 Package: ${NC}$PACKAGE_NAME"

# Verificar dispositivo
DEVICE_COUNT=$(adb devices | grep -v "List" | grep "device$" | wc -l)

if [ $DEVICE_COUNT -eq 0 ]; then
    echo -e "${YELLOW}⚠️  No hay dispositivos conectados${NC}"
    exit 1
fi

# Desinstalar y reinstalar
echo -e "${BLUE}🗑️  Desinstalando versión anterior...${NC}"
adb uninstall $PACKAGE_NAME 2>/dev/null || echo "App no estaba instalada"

if [[ " $@ " =~ " --with-compiled " ]]; then
    echo ""
    echo -e "${BLUE}🚀 Compilando e instalando...${NC}"
    flutter run
fi

echo ""
echo -e "${GREEN}✅ Reinstalación completa${NC}"
