def sublist(lista):
    l = []
    paises = []
    faltas = []
    for el in lista:
        for i in range(2):
            if el[i] not in paises:
                paises.append(el[i])
                faltas.append(el[2][i])
            else:
                faltas[paises.index(el[i])] += el[2][i]
    for j in range(len(paises)):
        l.append([paises[j], faltas[j]])
    return l
            
    
lista = [["Brasil","Italia",[10,5]],["Alemanha","Brasil",[11,3]],["Italia","Alemanha",[7,8]]]

print(sublist(lista))