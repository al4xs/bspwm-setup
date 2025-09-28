#!/usr/bin/env bash
set -e

# Atualiza pacotes
sudo apt update

# Instala dependências necessárias
sudo apt install -y \
  cmake \
  pkg-config \
  libfreetype6-dev \
  libfontconfig1-dev \
  libxcb-xfixes0-dev \
  libxkbcommon-dev \
  python3

# Verifica se cargo está instalado
if ! command -v cargo &> /dev/null; then
  echo "❌ Cargo não encontrado. Instale o Rust primeiro:"
  echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
  exit 1
fi

# Instala o Alacritty pelo cargo
cargo install alacritty

# Cria link simbólico do binário (caso não esteja no PATH)
if [ -f "$HOME/.cargo/bin/alacritty" ]; then
  sudo ln -sf "$HOME/.cargo/bin/alacritty" /usr/local/bin/alacritty
fi

echo "✅ Alacritty instalado com sucesso!"



