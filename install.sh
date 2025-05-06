#!/bin/bash

echo "Telepítés indul..."

# Másolja a fájlokat megfelelő helyekre
sudo cp app.py /usr/local/bin/csendes-legzes
sudo chmod +x /usr/local/bin/csendes-legzes

# Hangfájlokat másolja a /usr/local/share/csendes-legzes/ könyvtárba
sudo mkdir -p /usr/local/share/csendes-legzes/
sudo cp meditacio_zene.wav harang.wav /usr/local/share/csendes-legzes/

# .desktop fájl (opcionális)
sudo cp csendes-legzes.desktop /usr/share/applications/

echo "Kész. A program elérhető a menüből vagy a 'csendes-legzes' paranccsal."
