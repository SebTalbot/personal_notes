#-*- coding: utf-8 -*-
from compteur import Compteur
from poulet import Poulet

#Test du compteur de classe
Compteur().ajouter("test")
Compteur().ajouter("test")
Compteur().afficherCompte()

listePoulet = [Poulet() for i in range(100)]

Compteur() = Compteur()
Compteur().ajouter("tryhard", 5)
Compteur().afficherCompte()

#Imprimer le nom d'une classe
print(Compteur().__class__.__name__)
