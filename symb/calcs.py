from symb import *
import matops as m

### Calculating the determinant
det_sIA = sIA.det()
sIA_TL = sIA[0:3, 0:3]
det_factor = sIA_TL.det()
det_factor_coeffs = (det_factor.as_poly(s)).coeffs()
# Getting the detailed coefficient expressions
# det_factor_coeffs[3].as_poly(x3)
# (det_factor_coeffs[3].subs(subs_dict)).as_poly(theta, x3)

### Calculating adjoint
def calc_adj(A):
    """Returns adjoint of a 4x4 matrix"""
    adjA = [[(-1)**(i+1) * (-1)**(j+1) * A.minor(i, j) for j in range(4)] for i in range(4)]
    return sp.Matrix(adjA)


adj_sIA = calc_adj(sIA)
