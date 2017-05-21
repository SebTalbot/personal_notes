#-*- coding:utf-8 -*-

# Inherit from object
class Clou(object):
    def __init__(self):
        # Preceder une variable de __ emule le mot-cle private
        self.__nbClou = 0

    def setNbClou(self,in_nbClou):
        print("set")
        self.__nbClou = in_nbClou

    def getNbClou(self):
        print("get")
        return self.__nbClou

    # Creat property
    nbClou = property(getNbClou,setNbClou)

if __name__ == "__main__":
    exempleClou = Clou()
    exempleClou.nbClou = 5

    print(exempleClou.nbClou)
