#!/bin/bash

echo "Telepítés indul..."

# Függőségek
sudo apt update
sudo apt install -y python3 python3-pyqt5 wget

# Hangfájl letöltése
echo "Relaxációs zene letöltése..."
wget -O meditacio_zene.wav "https://drive.google.com/uc?id=FÁJL_AZONOSÍTÓ&export=download"

# Program másolása
sudo cp app.py /usr/local/bin/csendes-legzes
sudo chmod +x /usr/local/bin/csendes-legzes

# .desktop fájl másolása
if [ -f csendes-legzes.desktop ]; then
    echo "Menüikon telepítése..."
    sudo cp csendes-legzes.desktop /usr/share/applications/
else
    echo "Figyelem: csendes-legzes.desktop nem található, menübejegyzés nem készül."
fi

echo "Kész. A program elérhető a menüből vagy a 'csendes-legzes' paranccsal."#!/bin/bash

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
#!/bin/bash

echo "Telepítés indul..."

# Függőségek
sudo apt update
sudo apt install -y python3 python3-pyqt5 wget

# Hangfájl letöltése
echo "Relaxációs zene letöltése..."
wget -O meditacio_zene.wav "https://drive.google.com/uc?id=FÁJL_AZONOSÍTÓ&export=download"

# Program másolása
sudo cp app.py /usr/local/bin/csendes-legzes
sudo chmod +x /usr/local/bin/csendes-legzes

# .desktop fájl másolása
if [ -f csendes-legzes.desktop ]; then
    echo "Menüikon telepítése..."
    sudo cp csendes-legzes.desktop /usr/share/applications/
else
    echo "Figyelem: csendes-legzes.desktop nem található, menübejegyzés nem készül."
fi

echo "Kész. A program elérhető a menüből vagy a 'csendes-legzes' paranccsal."
