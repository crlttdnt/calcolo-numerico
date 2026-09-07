# Esercizio 1

Si considerino i sistemi lineari \(3 \times 3\) della forma \(A_{[M]}x = b_{[M]}\), per \(M = 1,2,3,4\), con \(b_{[M]}\) calcolato in modo che la soluzione del sistema sia sempre il vettore unitario, cioè

$$
b_{[M]} = A_{[M]} \cdot \texttt{ones(3,1)}.
$$

Le matrici \(A_{[M]}\) sono date da

$$
A_{[1]} =
\begin{bmatrix}
3 & 0 & 4 \\
7 & 4 & 2 \\
1 & 1 & 2
\end{bmatrix},
\qquad
A_{[2]} =
\begin{bmatrix}
-3 & 3 & -6 \\
-4 & 7 & -8 \\
5 & 7 & -9
\end{bmatrix},
$$

$$
A_{[3]} =
\begin{bmatrix}
4 & 1 & 1 \\
2 & -9 & 0 \\
0 & -8 & -6
\end{bmatrix},
\qquad
A_{[4]} =
\begin{bmatrix}
7 & 6 & 9 \\
4 & 5 & -4 \\
-7 & -3 & 8
\end{bmatrix}.
$$

Si verifichi che, per la matrice \(A_{[1]}\), il metodo di Jacobi diverge, mentre quello di Gauss-Seidel converge. Viceversa, nel caso della matrice \(A_{[2]}\), è il metodo di Jacobi a convergere, mentre quello di Gauss-Seidel diverge.

Nei due casi restanti, si confrontino le velocità di convergenza dei due metodi, verificando quale dei due converge più rapidamente.

# Esercizio 2

Stabilire quali tra le seguenti matrici soddisfano una condizione sufficiente a garantire la convergenza del metodo iterativo di Jacobi:

$$
A_{[1]} =
\begin{bmatrix}
-22 & 8 & 13 \\
5 & 7 & -1 \\
-4.5 & 2 & -9
\end{bmatrix},
\qquad
A_{[2]} =
\begin{bmatrix}
1 & 0.5 & 0.5 \\
-1 & 3 & -0.3 \\
0 & -0.3 & 0.4
\end{bmatrix},
$$

$$
A_{[3]} =
\begin{bmatrix}
1 & 0 & -1 \\
-1 & 3 & -0.1 \\
0.5 & 0.4 & 1
\end{bmatrix},
\qquad
A_{[4]} =
\begin{bmatrix}
1 & -3 & 2.5 \\
4 & -7 & 2 \\
-8 & 11 & 5
\end{bmatrix}.
$$

Per le matrici che non soddisfano la condizione sufficiente, calcolare il raggio spettrale della matrice di iterazione.

Per le matrici che risultano convergenti, risolvere i sistemi lineari

$$
A_{[M]}x = b,
\qquad M=1,2,3,4,
$$

con

$$
b =
\begin{bmatrix}
1 \\
0 \\
-1
\end{bmatrix},
$$

prendendo

$$
x^{(0)} =
\begin{bmatrix}
0 \\
0 \\
0
\end{bmatrix},
\qquad
\texttt{toll} = 1\mathrm{e}{-6},
\qquad
\texttt{nitmax} = 200.
$$

Calcolare l’errore relativo, prendendo come esatta la soluzione del sistema calcolata con `\`, e confrontarlo con la tolleranza richiesta.

# Esercizio 3

Stabilire quali tra le seguenti matrici soddisfano condizioni sufficienti a garantire la convergenza del metodo iterativo di Gauss-Seidel:

$$
A_{[1]} =
\begin{bmatrix}
4 & -1 & 0 \\
-1 & 4 & -1 \\
0 & -1 & 4
\end{bmatrix},
\qquad
A_{[2]} =
\begin{bmatrix}
-5 & 4 & 1 \\
4 & -6 & -2 \\
1 & -2 & -8
\end{bmatrix},
$$

$$
A_{[3]} =
\begin{bmatrix}
1 & \frac{1}{2} & \frac{1}{3} \\
\frac{1}{2} & \frac{1}{3} & \frac{1}{4} \\
\frac{1}{3} & \frac{1}{4} & \frac{1}{5}
\end{bmatrix},
\qquad
A_{[4]} =
\begin{bmatrix}
4 & 0 & 7 \\
1 & 5 & 0 \\
-4 & 5 & 8
\end{bmatrix}.
$$

Per le matrici che non soddisfano le condizioni sufficienti, calcolare il raggio spettrale della matrice di iterazione.

Per le matrici che risultano convergenti, risolvere i sistemi lineari

$$
A_{[M]}x = b,
\qquad M=1,2,3,4,
$$

con

$$
b =
\begin{bmatrix}
1 \\
0 \\
-1
\end{bmatrix},
$$

prendendo

$$
x^{(0)} =
\begin{bmatrix}
0 \\
0 \\
0
\end{bmatrix},
\qquad
\texttt{toll} = 1\mathrm{e}{-6},
\qquad
\texttt{nitmax} = 200.
$$

Calcolare l’errore relativo, prendendo come esatta la soluzione del sistema calcolata con `\`, e confrontarlo con la tolleranza richiesta.

Cosa accade nel caso della matrice \(A_{[3]}\)? Riprovare a risolvere il sistema aumentando il numero massimo di iterazioni permesse fino a \(\texttt{nitmax}=700\).

# Esercizio 4

Dato \(N=15\), costruire la matrice \(A\) di dimensione \(N \times N\) avente elementi nulli, eccetto:

* quelli della diagonale principale, uguali ai primi \(N\) numeri naturali;
* quelli della terza sopradiagonale, uguali ai quadrati dei primi \(N\) numeri naturali;
* quelli della prima sottodiagonale, uguali a \(-0.5\).

Assegnato

$$
b = \texttt{ones(N,1)},
$$

si consideri il sistema lineare

$$
Ax=b.
$$

Fissati inoltre

$$
x^{(0)} = \texttt{zeros(N,1)},
\qquad
\texttt{toll} = 1\mathrm{e}{-6},
\qquad
\texttt{nitmax} = 200,
$$

risolvere il sistema \(Ax=b\) con i metodi di Jacobi e di Gauss-Seidel.

Dette \(x_J\) e \(x_{GS}\) le soluzioni così ottenute, prendendo come esatta la soluzione del sistema calcolata con `\`, valutare infine gli errori assoluti in norma euclidea.

Esercizio 5 — Jacobi e Gauss-Seidel per matrici tridiagonali

Sia \(A\) la matrice tridiagonale di ordine \(n \in \mathbb{N}\), avente elementi uguali a 3 sulla diagonale principale, uguali a \(-2\) sulla prima sopradiagonale e uguali a \(-1\) sulla prima sottodiagonale.

Si scelga il vettore \(b \in \mathbb{R}^n\) in modo tale che

$$
\texttt{ones(n,1)}
$$

sia la soluzione esatta del sistema

$$
Ax=b.
$$

Verificare sperimentalmente se i metodi di Jacobi e di Gauss-Seidel convergono alla soluzione esatta del sistema lineare assegnato.

A tal fine si scelgano

$$
x^{(0)} = \texttt{zeros(n,1)},
\qquad
\texttt{toll} = 10^{-12},
\qquad
\texttt{nitmax} = 10000.
$$

Calcolare l’errore relativo e confrontare le prestazioni dei due metodi in termini di numero di iterazioni effettuate. Quale metodo è più veloce?

Giustificare i risultati ottenuti alla luce dei risultati teorici noti.

Risolvere diversi sistemi cambiando il valore di \(n\).

# Esercizi di riepilogo

## Esercizio 1

Siano \(A_n \in \mathbb{R}^{n \times n}\) e \(b_n \in \mathbb{R}^n\) tali che

$$
A_n =
\begin{bmatrix}
2 & -1 \\
-1 & 2 & \ddots \\
& \ddots & \ddots & -1 \\
& & -1 & 2
\end{bmatrix},
\qquad
b_n =
\begin{bmatrix}
1 \\
1 \\
\vdots \\
1
\end{bmatrix}.
$$

Si risolvano i sistemi lineari

$$
A_nx=b_n
$$

per \(n=5,10,100\), mediante i metodi di Jacobi e Gauss-Seidel, prendendo

$$
x^{(0)} = \texttt{zeros(n,1)},
\qquad
\texttt{toll} = 10^{-6},
\qquad
\texttt{nitmax} = 100000.
$$

Calcolare l’errore relativo prendendo come esatta la soluzione del sistema calcolata con un metodo diretto.

Confrontare i risultati tra i due metodi iterativi, sia in termini di errore relativo sia in termini di numero di iterazioni.

Risultati (in `format short e`):

| \(n\) | nit J | nit GS |                    err J |                   err GS |
| ----- | ----: | -----: | -----------------------: | -----------------------: |
| 5     |    99 |     50 | \(6.5351\mathrm{e}{-7}\) | \(6.3125\mathrm{e}{-7}\) |
| 10    |   340 |    172 | \(7.8325\mathrm{e}{-7}\) | \(6.8541\mathrm{e}{-7}\) |
| 100   | 29054 |  14528 | \(7.8463\mathrm{e}{-7}\) | \(7.8416\mathrm{e}{-7}\) |

## Esercizio 2 (da un tema d’esame)

Sia \(x\) il vettore di 9 punti equispaziati nell’intervallo \([0,\pi/2]\).

1. Costruire la matrice \(A\) di dimensione \(10 \times 10\) avente:

   * tutti i coefficienti uguali a 11 sulla diagonale principale;
   * tutti i coefficienti uguali a \(-1\) sulla prima sottodiagonale;
   * il vettore \(x\) sulla prima sopradiagonale.

   Sia \(b\) il vettore colonna unitario di lunghezza appropriata.

2. Calcolare il raggio spettrale della matrice di iterazione del metodo iterativo di Jacobi per la risoluzione del sistema lineare \(Ax=b\).

3. Fissati

$$
x^{(0)} = \texttt{zeros(10,1)},
\qquad
\texttt{toll} = 10^{-5},
\qquad
\texttt{nitmax} = 200,
$$

risolvere il sistema \(Ax=b\) con il metodo di Jacobi. Siano \(x_J\) la soluzione calcolata e `nitJ` il numero di iterazioni effettuate.

4. Risolvere il sistema \(Ax=b\) con l’apposito comando MATLAB `\`. Sia \(x_e\) la soluzione ottenuta. Considerando \(x_e\) come soluzione esatta, determinare l’errore commesso con Jacobi calcolando

$$
\|x_e-x_J\|_2.
$$

Risultati (in `format short e`):

$$
\rho(B_J)=1.8179\mathrm{e}{-1},
\qquad
\texttt{nitJ}=8,
\qquad
\|x_e-x_J\|_2=5.2528\mathrm{e}{-8}.
$$

## Esercizio 3 (da un tema d’esame)

Dato \(N=16\), costruire la matrice \(A\) di dimensione \(N \times N\) avente come soli elementi non nulli:

* quelli della diagonale principale, uguali ai primi \(N\) numeri naturali a partire da 20;
* quelli della prima sottodiagonale, uguali a \(-5\);
* quelli della seconda sopradiagonale, uguali a 5.

Sia

$$
b = \texttt{ones(N,1)}.
$$

1. Calcolare il determinante della matrice \(A\).

2. Calcolare il raggio spettrale della matrice di iterazione del metodo iterativo di Gauss-Seidel per la risoluzione del sistema lineare \(Ax=b\).

3. Fissati

$$
x^{(0)} = \texttt{zeros(N,1)},
\qquad
\texttt{toll} = 10^{-6},
\qquad
\texttt{nitmax} = 200,
$$

risolvere il sistema \(Ax=b\) con il metodo di Gauss-Seidel.

Calcolare l’errore relativo commesso in norma euclidea, prendendo come esatta la soluzione \(x_e\) del sistema calcolata con il comando MATLAB `\`.
