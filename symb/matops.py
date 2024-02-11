#! /home/sesha/anaconda3/bin/python

import sympy as sp


### Matrix operation functions -------------------------------------------------

def calc_adj(A):
    """Returns adjoint of a 4x4 matrix"""
    adjA = [[(-1)**(i+1) * (-1)**(j+1) * get_minor(A, i, j) for j in range(4)] for i in range(4)]
    return sp.Matrix(adjA)

def get_minor(A, i, j):
    """Calculates the symbolic minor of a matrix"""
    M = A.copy()
    M.row_del(i)
    M.col_del(j)
    return M.det()


def get_minor_mat(A, i, j):
    """Returns the minor matrix"""
    rows = list(range(0,i))
    rows.extend(list(range(i+1,4)))
    cols = list(range(0,j))
    cols.extend(list(range(j+1,4)))
    list_M = [[A[rows[p], cols[q]] for q in range(3)] for p in range(3)]
    M = sp.Matrix(list_M)
    return M
