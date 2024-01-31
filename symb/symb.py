#! /home/sesha/anaconda3/bin/python

import sympy as sp

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
db11 = sp.Symbol(r'delta b_{11}')
db42 = sp.Symbol(r'delta b_{42}')

# Nominal states
x1 = sp.Symbol(r'\bar x_1')
x2 = sp.Symbol(r'\bar x_2')
x3 = sp.Symbol(r'\bar x_3')


# Acutual system parameters
# Nominal rate constants
k1 = sp.Symbol(r'\bar k_1')
k3 = sp.Symbol(r'\bar k_3')
k4F = sp.Symbol(r'\bar k_{4F}')
k4R = sp.Symbol(r'k_{4R}')
# Volume, flow-rate and urea cut off frequency, Storage
V = sp.Symbol(r'V')
bv = 1/V
F = sp.Symbol(r'\bar F')
wu = sp.Symbol(r'\omega_u')
theta = sp.Symbol(r'\Theta')
# The temperature coeffients of rate constants
p1 = sp.Symbol(r'p_1')
p3 = sp.Symbol(r'p_3')
p4F =sp.Symbol(r'p_{4F}')
p4R = sp.Symbol(r'p_{4R}')
