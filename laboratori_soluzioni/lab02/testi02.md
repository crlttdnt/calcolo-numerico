# Es 1
assegnati i vettori u = [1, 0, 2, −3] e v = [3; 0; 2; 1] calcolare i
vettori colonna z, w, y definiti, componente per componente...
generato il vettore contenente 11 punti equispaziati tra 1 e 2,
valutare nei suoi elementi le funzioni x log x e x^3 cos x

# Es 2
Sia x = [−3, 5, 8, 0, 1, 5, −2, 4]:
- imporre sesto elemento =100
- imporre 1,2,3  elemento = [4, 7, −1]
- togliere 4 quarto elemento
- aggiungere in testa = [1, 2, 3]

# Es 3
Si consideri la successione di termine n-esimo \(a_n = \sin(n^2)\), con \(n \geq 1\). Si calcolino il più grande e il più piccolo numero tra i primi 10 elementi della successione.
Suggerimento: si eseguano operazioni sul vettore \([1, 2, 3, \ldots, 10]\).
Verificare le seguenti uguaglianze:
$$
\sum_{i=1}^{10} i = 55
$$

$$
\sum_{i=1}^{10} i^2 = 385
$$
Suggerimento: si eseguano operazioni sul vettore \([1, 2, 3, \ldots, 10]\).
Si consideri la successione di termine n-esimo \(a_n = \frac{1}{n}\), con \(n \geq 1\).
* Calcolare il prodotto dei primi 10 termini di indice dispari della successione. (Sol.: \(1.5273 \times 10^{-9}\))
* Calcolare il vettore \(b\) di componenti \(b_n = a_{n+1} - a_n\), con \(n = 1, \ldots, 99\), e verificare che la somma delle sue componenti è uguale ad \(a_{100} - 1\).
N.B. Si risolva l’esercizio eseguendo operazioni vettoriali.

# es 4
Assegnati i vettori u = [1, 0, 2, −3] e v = [3; 0; 2; 1] calcolare il
prodotto scalare dei due vettori e le norme euclidee di ciascun
vettore. Cosa forniscono i prodotti u ∗ v e v ∗ u?

# es 5
Esercizio 5

Costruire, con comandi opportuni, le seguenti matrici \(5 \times 5\): identità, nulla, con tutti gli elementi uguali a 1 e di Hilbert. Quindi farne la somma.

Assegnate le matrici

$$
A =
\begin{bmatrix}
2 & 1 & 0 \\
3 & 1 & 0 \\
-2 & 1 & 1
\end{bmatrix},
\qquad
E =
\begin{bmatrix}
1 & -1 & 1 \\
2 & -1 & 0 \\
3 & 2 & 1
\end{bmatrix}
$$

calcolare i prodotti di matrici \(AE\) e \(EA\). Sono uguali? In cosa si differenziano?

Calcolare infine la matrice \(C\) le cui componenti sono

$$
c_{i,j} = a_{i,j} \cdot e_{i,j},
\qquad i,j = 1,\ldots,3.
$$

# es 6
Esercizio 6

Sia

$$
A =
\begin{bmatrix}
1 & 2 & 3 & 4 \\
-1 & 0 & -1 & 0 \\
4 & 5 & 6 & 7 \\
5 & 4 & 3 & 2
\end{bmatrix}
$$

a. Assegnare il valore 100 agli elementi della terza colonna.

b. Assegnare il valore -3 agli elementi della seconda riga.

c. Assegnare il valore \([1\ 2\ 3\ 4]\) alla sottomatrice definita dalle colonne 2 e 3 e dalle righe 3 e 4.

d. Eliminare la terza colonna di \(A\).

e. Aggiungere ad \(A\) la riga \([3,\ 1,\ 5]\).

# es 7
Esercizio 7

Assegnate le matrici

$$
A =
\begin{bmatrix}
2 & 1 & 0 \\
3 & 1 & 0 \\
-2 & 1 & 1
\end{bmatrix},
\qquad
E =
\begin{bmatrix}
1 & -1 & 1 \\
2 & -1 & 0 \\
3 & 2 & 1
\end{bmatrix}
$$

e scelto un numero reale \(\alpha\) a piacere, verificare le seguenti proprietà del determinante di matrici:

a. \(\det(A) = \det(A^T)\)

b. \(\det(\alpha A) = \alpha^n \det(A)\), \(\forall \alpha \in \mathbb{R},\ A \in \mathbb{R}^{n \times n}\), con \(n = 3\)

c. \(\det(AE) = \det(A)\det(E)\)

Calcolare il determinante ed il rango delle seguenti matrici:

$$
A =
\begin{bmatrix}
1 & 2 & 3 & 4 \\
-1 & 0 & -1 & 0 \\
4 & 5 & 4 & 7 \\
5 & 4 & 3 & 2
\end{bmatrix}
$$

$$
B =
\begin{bmatrix}
1 & 3 & 0 & -1 \\
-1 & 0 & 1 & 2 \\
1 & 2 & 3 & 4 \\
0 & 3 & 1 & 1
\end{bmatrix}
$$

Testare sulla matrice \(A\) i seguenti comandi: `prod`, `sum`, `max`, `min`, `sort`.

$$
A =
\begin{bmatrix}
1 & 2 & 3 & 4 \\
-1 & 0 & -1 & 0 \\
4 & 5 & 4 & 7 \\
5 & 4 & 3 & 2
\end{bmatrix}
$$

# es di riepilogo
Esercizi di riepilogo

1. Sia

$$
x = [-1,\ 2,\ 3,\ 8,\ 10,\ 5,\ -4,\ 3].
$$

* Imporre il 1°, 3° e 4° elemento uguali a \([5,\ 6,\ 7]\).
* Aggiungere in coda \([10,\ 11,\ 12]\).
* Eliminare, con un comando, gli elementi dal 4° al 7°.

2. Si consideri la successione di termine n-esimo \(a_n = \frac{1}{n}\), con \(n \geq 1\).

Considerare i primi 20 termini della successione e calcolare:

$$
B_1 = \sum_{n=1}^{19} \frac{a_{n+1}}{a_n}
$$

$$
B_2 = \sqrt{\prod_{n=2}^{20}(a_n + a_1)}
$$

Soluzioni: \(B_1 = 16.4023\), \(B_2 = 3.2404\).

3. Assegnate le matrici

$$
A =
\begin{bmatrix}
2 & 1 \\
3 & 1 \\
-2 & 1
\end{bmatrix},
\qquad
E =
\begin{bmatrix}
1 & -1 & 1 \\
2 & -1 & 0
\end{bmatrix}
$$

calcolare i prodotti di matrici \(AE\) e \(EA\). Sono uguali? In cosa si differenziano?

4. Siano

$$
A =
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix},
\qquad
P =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & 1 & 0
\end{bmatrix}.
$$

Si osservi che \(P\) si ottiene dalla matrice identica scambiando la seconda e la terza riga/colonna. Una matrice di questo tipo è detta matrice di permutazione.

Si calcolino i prodotti \(PA\) e \(AP\). Cosa si osserva?

Soluzione: moltiplicando \(A\) a sinistra o a destra per \(P\) si scambiano rispettivamente righe o colonne.

5. Sia

$$
A =
\begin{bmatrix}
4 & 3 & 2 & 1 \\
-1 & 0 & -1 & 0 \\
2 & 9 & 1 & 1 \\
5 & 4 & 3 & -2
\end{bmatrix}.
$$

a. Assegnare il valore 10 agli elementi della seconda riga.

b. Assegnare il valore -1 agli elementi della quarta colonna.

c. Assegnare la matrice

$$
\begin{bmatrix}
1 & 2 \\
3 & 4
\end{bmatrix}
$$

alla sottomatrice definita dalle righe 2 e 3 e dalle colonne 3 e 4.

d. Eliminare la prima riga e l’ultima colonna di \(A\).

e. Aggiungere ad \(A\) la colonna

$$
\begin{bmatrix}
3 \\
1 \\
5
\end{bmatrix}.
$$
