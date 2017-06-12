# -*- coding: utf-8 -*-

import random

def fonctionTestA():
	print "Je fais des operations"

def fonctionTestB():
	print "Pas facile les mardis apres-midi!"

def spartiate300(funcOperation):
    for i in range(0,300):
        funcOperation()

# On se cree une variable de type pointeur de fonction
# A partir de ce moment, la variable peut etre utilise comme la fonction
# L'operateur () sert a executer les instructions que pointent un pointeur de fonctions

referenceFonction = fonctionTestA
referenceFonction()

# Possibilite de changer la reference
referenceFonction = fonctionTestB
referenceFonction()

# Passage d'un pointeur de fonction en parametre
spartiate300(referenceFonction)

listeNombreHasard = [random.randint(0,50) for i in range(0,100)]
print "Liste avant traitement"
print listeNombreHasard 

# Vieu code qui pue
# for i in range(0,100):
#     listeNombreHasard.append(random.randint(0,100))

# Definition d'une fonction filtre
# Doit retourner un bool et doit prendre un parametre (selon ce qu'on veut filtrer)
# Return true si on garde le chiffre, false si on l'ignore
def filtrerNombre25(nombreAFiltrer):
    return nombreAFiltrer <= 25

listeFiltree = filter(filtrerNombre25, listeNombreHasard)
print "Liste apres traitement"
print listeFiltree

def additionnerNombre(nombreATraiter):
    return nombreATraiter + 1000

listeAddition = map(additionnerNombre, listeNombreHasard)
print "Liste addition"
print listeAddition

# Premier Lambda
premierLambda = lambda nombre:nombre <= 25
listeLambda = filter(premierLambda, listeNombreHasard)
print "liste filtre avec lambda"
print listeLambda

listeAuCarre = map(lambda unNombre:unNombre*unNombre,listeNombreHasard)
print "liste au carre"
print listeAuCarre
