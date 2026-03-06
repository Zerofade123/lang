#!/usr/bin/env bash
set -e

echo "🚀 Installing LANG: The Intelligent Shell..."

REPO="Zerofade123/lang"
BINARY="lang"

# Download latest binary
echo "📦 Downloading latest LANG binary..."
sudo curl -L "https://github.com/$REPO/releases/latest/download/$BINARY" -o /usr/local/bin/$BINARY

# Make executable
sudo chmod +x /usr/local/bin/$BINARY

# Install Ollama if missing
if ! command -v ollama >/dev/null 2>&1; then
    echo "🧠 Brain not found. Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
fi

# Pull model silently
echo "📥 Downloading AI model..."
ollama pull qwen2:1.5b >/dev/null 2>&1

echo "✅ SUCCESS! Your terminal is now smart."
echo "Run: lang"
