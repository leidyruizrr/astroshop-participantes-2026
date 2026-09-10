# Guia del participante - Lab AstroShop AI (Copilot)

Bienvenido. Sigue estos pasos para tener tu entorno listo. Toma ~5 minutos.
Tu numero de participante te lo asigna el instructor (01, 02 o 03).
Reemplaza 0X por tu numero.

---

## Paso 1 - Abre tu Codespace
1. Entra al repositorio del lab (el instructor te da el link).
2. Boton verde Code -> pestana Codespaces -> Create codespace on main.
3. Espera 2-3 minutos mientras se construye. Se abrira VS Code en el navegador.

## Paso 2 - Activa tu instruction file
En la terminal (reemplaza 0X por tu numero):
    cp INSTRUCCIONES-0X.md .github/copilot-instructions.md

## Paso 3 - Pon tu token de GitHub
Abre .vscode/mcp.json y reemplaza TU_TOKEN_GITHUB por tu Personal Access Token.
(El token de Dynatrace ya viene configurado.) Guarda el archivo.

## Paso 4 - Arranca el MCP de Dynatrace
1. Ctrl+Shift+P -> escribe "MCP: List Servers"
2. Selecciona "dynatrace" -> Start
3. Si pide autenticacion, completala.

## Paso 5 - Abre Copilot en Agent mode
1. Abre Copilot Chat (Ctrl+Alt+I).
2. En el selector de modo (arriba del chat), elige "Agent".

## Paso 6 - Verifica
Preguntale a Copilot:
    A que tenant de Dynatrace estoy conectado y que herramientas MCP tienes?

Debe responder tu tenant y listar las herramientas. Listo!

---

Tu flujo del ejercicio:
1. Investigar un incidente con el MCP de Dynatrace
2. Documentarlo con dtctl (notebook, SLO, dashboard)
3. Proponer el fix con un Pull Request
4. Verificar que se resolvio
