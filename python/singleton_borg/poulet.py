#-*- coding: utf-8 -*-

from compteur import Compteur

class Poulet():
    def __init__(self):
        Compteur().ajouter(self.__class__.__name__)
        self.son = "Pok pok pok"

    def emettreSon(self):
        print self.son
