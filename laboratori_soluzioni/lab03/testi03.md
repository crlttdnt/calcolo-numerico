# Es 4

Sia
$$
A =
\begin{bmatrix}
3 & 9 & 0 & -7 \\
2 & 2 & 2 & 1 \\
0 & 2 & 1 & 3 \\
4 & -3 & 0 & 9
\end{bmatrix}.
$$

Calcolare \(\|A\|_1\) e \(\|A^{-1}\|_\infty\) con il comando `norm` e, per conferma, con l’opportuna combinazione dei comandi `abs`, `max`, `sum`.

# Es 5
1. Sia \(v\) il vettore generato con il comando `v = [1:0.3:2.2]`.

Calcolare:

`diag(v)`, `diag(v,1)`, `diag(v,-1)`, `diag(v,3)`, `diag(v,-2)`.

2. Utilizzando la funzione `diag`, costruire le seguenti matrici \(10 \times 10\):

$$
A =
\begin{bmatrix}
1 & 0 & -1 & 0 & \ldots & 0 \\
-1 & 2 & 0 & -1 & \ldots & 0 \\
\vdots & \vdots & \ddots & \ddots & \ddots & \vdots \\
0 & \ldots & -1 & 8 & 0 & -1 \\
0 & \ldots & \ldots & -1 & 9 & 0 \\
0 & \ldots & \ldots & \ldots & -1 & 10
\end{bmatrix}
$$

$$
B =
\begin{bmatrix}
1 & 0.1 & 0.1 & \ldots & 0.1 \\
1 & 4 & 0 & \ldots & 0 \\
1 & 0 & 9 & \ldots & 0 \\
1 & \vdots & \ddots & \ddots & \vdots \\
1 & 0 & \ldots & 81 & 0 \\
1 & 0 & \ldots & 0 & 100
\end{bmatrix}.
$$

# Es 6
Sia \(A\) la matrice di Hilbert \(4 \times 4\). Estrarre da \(A\) le matrici triangolari inferiore e superiore aventi, rispettivamente, sotto e sopra la diagonale gli stessi elementi di \(A\).

# Es 7
Si trasformi la matrice \(A = \texttt{ones(10)}\) in una matrice con 2 sottodiagonali e 4 sopradiagonali non nulle, utilizzando una combinazione dei comandi `tril` e `triu`.

Esercizio 8

Risolvere il seguente sistema lineare con l’operatore `\`:

$$
\begin{bmatrix}
-16 & 8 & -7 \\
1 & -5 & -3 \\
1 & 10 & 14
\end{bmatrix}
x
=
\begin{bmatrix}
-9 \\
4 \\
-13
\end{bmatrix}
\quad \longrightarrow \quad
x =
\begin{bmatrix}
1 \\
0 \\
-1
\end{bmatrix}.
$$

Visualizzare i risultati in `format long e` e confrontarli con quelli che si ottengono dal prodotto dell’inversa di \(A\) con il vettore \(b\), ossia:

```matlab
x = inv(A)*b
```

# Esercizi di riepilogo

Scrivere uno script file in cui si risolvono gli esercizi seguenti:

1. In aritmetica esatta vale l’identità

$$
\frac{(x+1)-1}{x}=1, \qquad \forall x \neq 0.
$$

Valutare la quantità a sinistra dell’uguale per i seguenti valori di \(x\):

$$
1\mathrm{e}{-8},\quad 1\mathrm{e}{-10},\quad 1\mathrm{e}{-12},\quad 1\mathrm{e}{-14}
$$

e calcolare l’errore rispetto al valore esatto 1. Cosa si osserva?

2. Costruire la matrice \(A\) di dimensione \(10 \times 10\) avente come soli elementi non nulli:

* quelli della diagonale principale uguali a 20;
* quelli delle prime sopra- e sottodiagonali uguali ai primi numeri naturali positivi;
* quelli della terza sopra- e sottodiagonale uguali a \(-2\).

3. Si costruisca la matrice \(A\) che ha coefficienti uguali a 2 sulla diagonale principale, uguali a \(-1\) sotto la diagonale e uguali a 1 sopra la diagonale, in due modi differenti:

* a partire dalla matrice diagonale con coefficienti uguali a 2, utilizzando poi un singolo ciclo `for`;
* sfruttando i comandi `tril` e `triu`.

Si trasformi infine la matrice in una matrice che ha solo 5 sotto- e sopradiagonali non nulle.

4. Data la matrice

$$
A =
\begin{bmatrix}
-5 & 8 & -7 & 1 \\
12 & -5 & -3 & 1 \\
1 & 10 & 14 & 1 \\
1 & 0 & 1 & 2
\end{bmatrix}
$$

e i termini noti

$$
b_1 =
\begin{bmatrix}
-43 \\
21 \\
-1 \\
3
\end{bmatrix},
\qquad
b_2 =
\begin{bmatrix}
-1 \\
76 \\
-26 \\
3
\end{bmatrix},
$$

si risolvano i sistemi lineari

$$
Ax_i = b_i, \qquad i=1,2.
$$

Soluzioni:

$$
x_1 =
\begin{bmatrix}
1 \\
-3 \\
2 \\
0
\end{bmatrix},
\qquad
x_2 =
\begin{bmatrix}
6 \\
1 \\
-3 \\
0
\end{bmatrix}.
$$
