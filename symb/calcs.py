from symb import *
import matops as m

### Calculating the determinant
det_sIA = sIA.det()
sIA_TL = sIA[0:3, 0:3]
det_factor = sIA_TL.det()


### Calculating adjoint
def calc_adj(A):
    """Returns adjoint of a 4x4 matrix"""
    adjA = [[(-1)**(i+1) * (-1)**(j+1) * A.minor(i, j) for j in range(4)] for i in range(4)]
    return sp.Matrix(adjA)


adj_sIA = calc_adj(sIA)
