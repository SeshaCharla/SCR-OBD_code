#! /home/sesha/anaconda3/bin/python

import sympy as sp
import numpy as np

### Symbol Definitions ---------------------------------------------------------
# Nominal Parameters
f13 = sp.Symbol(r'\bar f_{13}')
f23 = sp.Symbol(r'\bar f_{23}')
f32 = sp.Symbol(r'\bar f_{32}')
f31 = sp.Symbol(r'\bar f_{31}')
f24 = sp.Symbol(r'\bar f_{24}')
g1 = sp.Symbol(r'\bar g_{1}')
g2 = sp.Symbol(r'\bar g_2')
g3 = sp.Symbol(r'\bar g_3')
g23 = sp.Symbol(r'\bar g_{23}')
g32 = sp.Symbol(r'\bar g_{32}')
g4 = sp.Symbol(r'g_4')
b11 = sp.Symbol(r'\bar b_{11}')
b42 = sp.Symbol(r'\bar b_{42}')

# Perturbation parameters
df13 = sp.Symbol(r'\delta f_{13}')
df23 = sp.Symbol(r'\delta f_{23}')
df32 = sp.Symbol(r'\delta f_{32}')
df31 = sp.Symbol(r'\delta f_{31}')
df24 = sp.Symbol(r'\delta f_{24}')
dg1 = sp.Symbol(r'\delta g_{1}')
dg2F = sp.Symbol(r'\delta g_{2_F}')
dg2T = sp.Symbol(r'\delta g_{2_T}')
dg3 = sp.Symbol(r'\delta g_3')
dg23 = sp.Symbol(r'\delta g_{23}')
dg32 = sp.Symbol(r'\delta g_{32}')
db11 = sp.Symbol(r'\delta b_{11}')
db42 = sp.Symbol(r'\delta b_{42}')

# Nominal states
x1 = sp.Symbol(r'\bar x_1')
x2 = sp.Symbol(r'\bar x_2')
x3 = sp.Symbol(r'\bar x_3')
x4 = sp.Symbol(r'\bar x_4')

# nominal inputs
u1 = sp.Symbol(r'\bar u_1')
u2 = sp.Symbol(r'\bar u_2')
T = sp.Symbol(r'\bar T')
F = sp.Symbol(r'\bar F')


### Acutual system parameters --------------------------------------------------
# Volume, flow-rate and urea cut off frequency, Storage
V = sp.Symbol(r'V')
bv = 1/V
wu = sp.Symbol(r'\omega_u')
bu = sp.Symbol(r'b_u')
theta = sp.Symbol(r'\Theta')

# Nominal rate constants
k1 = sp.Symbol(r'\bar k_1')
k3 = sp.Symbol(r'\bar k_3')
k4F = sp.Symbol(r'\bar k_{4F}')
k4R = sp.Symbol(r'k_{4R}')

# The temperature coeffients of rate constants
p1 = sp.Symbol(r'p_1')
p3 = sp.Symbol(r'p_3')
p4F =sp.Symbol(r'p_{4F}')
p4R = sp.Symbol(r'p_{4R}')


#### Substitution dictionary----------------------------------------------------
subs_dict = dict()

# Nominal Parameters
subs_dict[f13] = k1
subs_dict[f23] = k4F
subs_dict[f32] = k4F * theta
subs_dict[f31] = k1 * V
subs_dict[f24] = bv * F
subs_dict[g4] = bv * F
subs_dict[g2] = bv*F + k4F*theta
subs_dict[g3] = k4R + k3
subs_dict[g23] = k4R*bv
subs_dict[g32] = k4F * V * theta
subs_dict[g4] = wu
subs_dict[b11] = bv * F
subs_dict[b42] = (wu*bu)/F

# Purturbed parameters
subs_dict[df13] = p1 * k1
subs_dict[df23] = p4F * k4F
subs_dict[df32] = p4F * k4F * theta
subs_dict[df31] = p1 * k1 * V
subs_dict[df24] = bv
subs_dict[dg1] = bv
subs_dict[dg2F] = bv
subs_dict[dg2T] = p4F*k4F*theta
subs_dict[dg3] = p4R*k4R + p3*k3
subs_dict[dg23] = p4R*k4R*bv
subs_dict[dg32] = p4F*k4F*V*theta
subs_dict[db11] = bv
subs_dict[db42] = -(wu*bu)/(F**2)


### State-space matrices--------------------------------------------------------

# A matrix
A = sp.Matrix([[ -(f13 * x3 + g1), 0, -f13*x1, 0],
               [ 0,  (-g2 + f23*x3), (f23*x2 + g23), f24],
               [-f31*x3, (-f32*x3 + g32), (-f32*x2 - g3 - f31*x1), 0],
               [0, 0, 0, -g4]])

# B matrix
B = sp.Matrix([[b11, 0, df13*x1*x3, db11*u1 - dg1*x1],
               [0, 0, (-dg2T*x2 + df23*x2*x3 + dg23*x3), (-dg2F*x2 + df24*x4)],
               [0, 0, (-df32*x2*x3 - dg3*x3 - df31*x1*x3 + dg32*x2), 0],
               [0, b42, 0, db42*u2]])


### Matrix operation functions -------------------------------------------------

def calc_adj(A):
    """Returns adjoint of a 4x4 matrix"""
    adjA = [[(-1)**i * (-1)**j * get_minor(A, i, j) for j in range(4)] for i in range(4)]
    return sp.Matrix(adjA)

def get_minor(A, i, j):
    """Calculates the symbolic minor of a matrix"""
    M = get_minor_mat(A, i, j)
    return sp.simplify(sp.expand(M.det()))


def get_minor_mat(A, i, j):
    """Returns the minor matrix"""
    rows = list(range(0,i))
    rows.extend(list(range(i+1,4)))
    cols = list(range(0,j))
    cols.extend(list(range(j+1,4)))
    list_M = [[A[rows[p], cols[q]] for q in range(3)] for p in range(3)]
    M = sp.Matrix(list_M)
    return M
