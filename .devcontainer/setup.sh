#!/bin/bash
# Se ejecuta automáticamente al crear el Codespace (versión Copilot).

set -e
echo "=== Configurando el entorno del lab (Copilot) ==="

# --- 1. Instalar dtctl ---
echo "[1/4] Instalando dtctl..."
curl -fsSL https://raw.githubusercontent.com/dynatrace-oss/dtctl/main/install.sh | bash || echo "   (revisa dtctl manualmente si fallo)"
export PATH="$PATH:$HOME/.local/bin"

# --- 2. Instalar el skill de dtctl para Copilot ---
echo "[2/4] Instalando el skill de dtctl para Copilot..."
dtctl skills install --for copilot 2>/dev/null || echo "   (instala el skill con: dtctl skills install --for copilot)"

# --- 3. Configurar dtctl ---
echo "[3/4] Configurando dtctl..."
if [ -n "$DT_PLATFORM_TOKEN" ]; then
  echo "export DTCTL_TOKEN_STORAGE=file" >> ~/.bashrc
  export DTCTL_TOKEN_STORAGE=file
  dtctl config set-credentials lab-token --token "$DT_PLATFORM_TOKEN" 2>/dev/null
  dtctl config set-context astroshop \
    --environment "https://ulk04354.sprint.apps.dynatracelabs.com" \
    --token-ref lab-token 2>/dev/null
  dtctl config use-context astroshop 2>/dev/null
  echo "   dtctl configurado."
else
  echo "   AVISO: no se encontro DT_PLATFORM_TOKEN."
fi

# --- 4. Crear .vscode/mcp.json (que es lo que Copilot lee) con el token inyectado ---
echo "[4/4] Configurando el MCP de Dynatrace..."
mkdir -p .vscode
if [ -n "$DT_PLATFORM_TOKEN" ] && [ -f "mcp-template.json" ]; then
  cp mcp-template.json .vscode/mcp.json
  sed -i "s|TU_TOKEN_DYNATRACE|${DT_PLATFORM_TOKEN}|g" .vscode/mcp.json
  echo "   .vscode/mcp.json creado con el token de Dynatrace inyectado."
else
  echo "   AVISO: no se pudo crear .vscode/mcp.json."
fi

echo ""
echo "=========================================="
echo "  Entorno listo (Copilot)"
echo "=========================================="
echo "Faltan estos pasos:"
echo "  1. Copia tu instruction file:   cp INSTRUCCIONES-0X.md .github/copilot-instructions.md"
echo "  2. Pon tu token de GitHub en .vscode/mcp.json (reemplaza TU_TOKEN_GITHUB)"
echo "  3. Arranca el MCP: Ctrl+Shift+P > MCP: List Servers > dynatrace > Start"
echo "  4. Abre Copilot Chat y cambia a Agent mode"
echo ""
