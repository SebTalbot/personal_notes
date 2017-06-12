#-*- coding: utf-8 -*-

# Nous allons changer notre compteur pour un singleton.
# En Python, l'implementation est differente des autres languages.
# Nous allons creer un Borg

class Compteur():

    # 1) Creation d'une variable "static"
    __shared_state = {}

    def __init__(self):
        # 2) Le dictionnaire d'attributs sera le meme pour toutes les instances
        self.__dict__ = self.__shared_state

        # 3) Si le dictionnaire global est vide, ajouter la variable
        if not hasattr(self,"dictCompte"):
            self.dictCompte = {}

    def ajouter(self,strNomClasse, nombre=1):
        self.dictCompte[strNomClasse] = self.dictCompte.get(strNomClasse, 0) + nombre

    def afficherCompte(self):
        print "---------------------Nombre d'instances---------------------"
        for key, value in self.dictCompte.iteritems():
            print key + " = " + str(value)
        print "---------------------Fin du rapport----------------"

