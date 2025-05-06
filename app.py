#!/usr/bin/env python3
import sys
import os
import webbrowser
import time
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout, QTextEdit, QLabel
from PyQt5.QtCore import QTimer, Qt
import pygame

class MeditacioApp(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Csendes Légzés")
        self.setGeometry(100, 100, 400, 400)
        self.setStyleSheet("background-color: #f4f4f4;")

        self.zene_eleres = "meditacio_zene.wav"
        self.harang_eleres = "harang.wav"

        self.init_ui()

        pygame.mixer.init()
        self.hatter_zene = None
        self.harang_timer = QTimer()
        self.harang_timer.timeout.connect(self.szolaljon_meg_a_harang)

    def init_ui(self):
        layout = QVBoxLayout()

        self.cimke = QLabel("Csendes Légzés - Meditációs alkalmazás")
        self.cimke.setAlignment(Qt.AlignCenter)
        self.cimke.setStyleSheet("font-size: 18px; margin-bottom: 20px;")
        layout.addWidget(self.cimke)

        self.indit_gomb = QPushButton("Indítás")
        self.indit_gomb.clicked.connect(self.indit_meditacio)
        layout.addWidget(self.indit_gomb)

        self.leallit_gomb = QPushButton("Leállítás")
        self.leallit_gomb.clicked.connect(self.leallit_meditacio)
        layout.addWidget(self.leallit_gomb)

        self.tamogatas_gomb = QPushButton("Támogatás")
        self.tamogatas_gomb.clicked.connect(lambda: webbrowser.open("https://www.paypal.me/laszlorobert1"))
        layout.addWidget(self.tamogatas_gomb)

        self.naplo = QTextEdit()
        self.naplo.setPlaceholderText("Írd ide a meditációs élményeidet...")
        layout.addWidget(self.naplo)

        self.setLayout(layout)

    def indit_meditacio(self):
        if os.path.exists(self.zene_eleres):
            self.hatter_zene = pygame.mixer.Sound(self.zene_eleres)
            self.hatter_zene.set_volume(0.3)  # halk zene
            self.hatter_zene.play(-1)  # ismétlés végtelenül
        else:
            print("Nem található a háttérzene fájl.")

        QTimer.singleShot(3000, self.elso_harang)

    def elso_harang(self):
        self.szolaljon_meg_a_harang()
        self.harang_timer.start(9000)  # 8-10 mp közötti harang intervallum

    def szolaljon_meg_a_harang(self):
        if os.path.exists(self.harang_eleres):
            harang = pygame.mixer.Sound(self.harang_eleres)
            harang.set_volume(0.5)
            harang.play()
        else:
            print("Nem található a harang fájl.")

    def leallit_meditacio(self):
        self.harang_timer.stop()
        if self.hatter_zene:
            self.hatter_zene.stop()
        pygame.mixer.stop()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    ablak = MeditacioApp()
    ablak.show()
    sys.exit(app.exec_())

