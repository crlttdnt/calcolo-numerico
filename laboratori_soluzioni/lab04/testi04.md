# Esercizio 3 (Sistemi di "grandi" dimensioni)

Costruire la matrice \(A_{N \times N}\), con \(N = 43\), avente come soli elementi non nulli:

* quelli della diagonale principale, uguali a 7;
* quelli della prima riga, eccetto \(A(1,1)\), uguali a 0.1;
* quelli della seconda sottodiagonale, uguali a \(-3\).

Sia \(b\) il vettore colonna unitario di lunghezza \(N\).

Risolvere il sistema lineare \(Ax = b\) mediante il metodo di eliminazione gaussiana.

# Esercizio 4

Si consideri la matrice

$$
A =
\begin{bmatrix}
4 & -2 & 1 \\
-2 & 5 & -2 \\
1 & -2 & 6
\end{bmatrix}.
$$

* Calcolare la fattorizzazione LU tramite il comando MATLAB `lu`, usando la sintassi:

```matlab
[L,U,P] = lu(A)
```

* Osservare se la matrice di permutazione \(P\) fornita da MATLAB è o meno l’identità.
* Scegliere \(b = A \cdot \texttt{ones(3,1)}\) e considerare il sistema lineare \(Ax = b\), che avrà in tal modo soluzione esatta nota \(x = \texttt{ones(3,1)}\).
* Risolvere il sistema lineare assegnato sfruttando la fattorizzazione calcolata.

# Esercizio 5

Si consideri la seguente matrice:

$$
A =
\begin{bmatrix}
-5 & 8 & -7 \\
12 & -5 & -3 \\
1 & 10 & 14
\end{bmatrix}.
$$

Si ripeta quanto richiesto per l’esercizio precedente.

Si osservi che la matrice di permutazione \(P\) non è l’identità, il che significa che è stato effettuato il pivoting. Pertanto si ha:

$$
PA = LU.
$$

Quando dobbiamo risolvere più sistemi lineari con diversi termini noti, ma tutti con la stessa matrice \(A\), è più conveniente separare il calcolo della fattorizzazione da quello della soluzione del sistema.

# Esercizio 6

Sia \(A\) la matrice \(100 \times 100\) tridiagonale avente coefficienti uguali a 4 sulla diagonale principale e uguali a \(-2\) sulle prime sopra- e sottodiagonali.

Si calcoli l’inversa \(A^{-1}\) risolvendo i sistemi lineari

$$
Ax = e_i,
$$

dove

$$
e_i = (0,\ldots,\underbrace{1}_{i\text{-esima posizione}},\ldots,0)^T,
\qquad i=1,\ldots,n,
$$

denota i vettori della base canonica di \(\mathbb{R}^n\).

La soluzione dell’\(i\)-esimo sistema \(Ax=e_i\) fornisce infatti la colonna \(i\)-esima della matrice \(A^{-1}\).

Si proceda nei due modi seguenti, confrontandone le prestazioni mediante i comandi `tic` e `toc` per il calcolo dei tempi di calcolo:

* Risolvere ogni sistema per eliminazione gaussiana con il comando `\`.
* Poiché la matrice dei coefficienti di ciascun sistema è sempre \(A\), calcolare una sola volta la fattorizzazione LU e risolvere i diversi sistemi per sostituzioni in avanti e indietro.

# Esercizio 7

Per ognuna delle seguenti matrici calcolare la fattorizzazione LU, controllare se viene effettuato il pivoting e verificare il fenomeno del fill-in applicando il comando `spy` ad \(L\) e \(U\).

$$
A_{10\times10} =
\begin{bmatrix}
4 & -1 \\
-1 & 4 & -1 \\
& -1 & 4 & -1 \\
& & \ddots & \ddots & \ddots \\
& & & -1 & 4
\end{bmatrix}
$$

$$
B_{10\times10} =
\begin{bmatrix}
3 & -2 \\
-2 & 3 & -2 \\
& -2 & 3 & -2 \\
& & \ddots & \ddots & \ddots \\
& & & -2 & 3
\end{bmatrix}
$$

$$
C_{10\times10} =
\begin{bmatrix}
2 & 0.1 & 0.1 & \ldots & 0.1 \\
0.1 & 2 \\
0.1 & & 2 \\
\vdots & & & \ddots \\
0.1 & & & & 2
\end{bmatrix}
$$

$$
D_{7\times7} =
\begin{bmatrix}
1 & 1 \\
1 & 1 \\
1 & 1 \\
\vdots & \vdots \\
2 & 3 & 4 & \ldots & 8
\end{bmatrix}
$$

Esempio:

```matlab
A = 4*diag(ones(10,1)) - diag(ones(9,1),1) - diag(ones(9,1),-1)
[L,U,P] = lu(A)

figure(1)
spy(L)

figure(2)
spy(U)
```

# Esercizi di riepilogo

1. Data la matrice

$$
A =
\begin{bmatrix}
7 & 0 & 1 & 4 \\
0 & 5 & 10 & 1 \\
1 & -3 & 1 & 0 \\
4 & 1 & 1 & -9
\end{bmatrix}
$$

e i termini noti

$$
b_1 =
\begin{bmatrix}
3 \\
1 \\
1 \\
0
\end{bmatrix},
\qquad
b_2 =
\begin{bmatrix}
0 \\
4 \\
7 \\
50
\end{bmatrix},
$$

si risolvano i sistemi lineari \(Ax_i = b_i\), per \(i=1,2\), mediante la fattorizzazione LU di \(A\) e la risoluzione dei corrispondenti sistemi triangolari.

2. Data la matrice

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

si risolvano i sistemi lineari \(Ax_i = b_i\), per \(i=1,2\), mediante la fattorizzazione LU di \(A\) e la risoluzione dei corrispondenti sistemi triangolari.

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

3. Data la matrice \(A\) dell’esercizio precedente, si calcoli, mediante la fattorizzazione LU di \(A\) e la risoluzione dei corrispondenti sistemi triangolari, l’inversa di \(A\).

4. Sia \(n=10\) e \(A\) la matrice di dimensione \(n \times n\) ottenuta sommando la matrice di Hilbert di ordine \(n\) con la matrice tridiagonale avente gli elementi diagonali tutti uguali a 3 e quelli sulla prima sottodiagonale e sopradiagonale pari a \(-1\).

* Si calcoli, se possibile, la fattorizzazione LU della matrice \(A\) assegnata e si determinino inoltre \(\|L\|_\infty\) e \(\|U\|_\infty\).
* Sia \(b\) il vettore colonna di 10 coefficienti tutti uguali a 1. Sfruttando la fattorizzazione \(A=LU\) calcolata, si determini la soluzione \(x\) del sistema lineare \(Ax=b\).
* Sia \(y\) il termine noto del sistema lineare che occorrerà risolvere per sostituzione all’indietro. Si calcolino le seguenti norme:

$$
\|y\|_\infty
\qquad
\|x\|_\infty.
$$

5. Si consideri il sistema lineare \(Ax=b\), dove \(A\) è la matrice tridiagonale di dimensione \(8 \times 8\) avente gli elementi diagonali pari a 5 e gli elementi sulla prima sopra- e sottodiagonale pari a \(-2\), e

$$
b =
\begin{bmatrix}
1 \\
2 \\
3 \\
4 \\
5 \\
6 \\
7 \\
26
\end{bmatrix}.
$$

* Si calcoli la fattorizzazione di Cholesky della matrice assegnata \(A = R^T R\) e la norma

$$
\|R\|_\infty.
$$

* Sfruttando la fattorizzazione calcolata, si determini la soluzione \(x\) del sistema lineare \(Ax=b\).
* Sia \(y\) il termine noto del sistema lineare che occorrerà risolvere per sostituzione all’indietro. Si calcolino le seguenti norme euclidee:

$$
\|y\|_2
\qquad
\|x\|_2.
$$

