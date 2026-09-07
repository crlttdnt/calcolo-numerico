# Esercizio 1

Scrivere uno script-file Matlab per disegnare il grafico delle seguenti funzioni negli intervalli indicati:

* \(f(x) = 2\log(x+2)\sqrt{x+1}\), \(x \in [1,2]\)
* \(g(x) = \dfrac{x^2+2x+1}{x^2+1}\), \(x \in [0,5]\)

con le seguenti modalità:

* disegnare due grafici distinti nella stessa finestra;
* disporre i due grafici in due finestre distinte.

A tale scopo si definisca un vettore \(z\) di 50 punti equispaziati nell’intervallo di definizione di ciascuna funzione, la si valuti nei punti di \(z\) e si disegni il grafico utilizzando il comando `plot`.

# Esercizio 2

Disegnare il grafico delle seguenti funzioni negli intervalli specificati in due finestre grafiche distinte utilizzando il colore rosso per la prima funzione e blu per la seconda.

A ciascun grafico assegnare un titolo ed inserire una griglia per visualizzare in quanti e quali punti le differenti funzioni incrociano l’asse delle ascisse \(x\).

$$
f_1(x) = \sin(e^x), \qquad x \in [0,2.5]
$$

$$
f_2(x) = (x^3-3x+2)e^x, \qquad x \in [-3,1.5]
$$

# Esercizio 3

Per \(n = 0,\ldots,20\) si considerino le funzioni

$$
f_n(x) = x^n
$$

nell’intervallo \([0,1]\), e se ne disegnino i grafici nella medesima finestra grafica.

In una seconda finestra grafica, per gli stessi valori di \(n\), disegnare i grafici delle funzioni

$$
g_n(x) = x^{1/n}
$$

nell’intervallo \([0,1]\).

Corredare entrambi i grafici con un titolo ed etichette sugli assi.

# Esercizio 4

Dopo averla definita con `@`, fare un grafico della funzione

$$
f(x) =
2\log(x+2)\sqrt{x+1}
-
\frac{x^2+2x+1}{x^2+1}
$$

nell’intervallo \([1,2]\) con linea nera tratteggiata.

# Esercizio 5

Dopo aver definito la funzione

$$
f(a,x)=a^x
$$

con `@` come funzione di due variabili, disegnare i grafici di

$$
f_a(x)=f(a,x)
$$

in \([0,1]\) per \(a=0.1,1,10\), nella stessa finestra grafica utilizzando colori diversi e corredandola di legenda.

# Esercizio 6

Scrivere la funzione `polysum`, che, ricevuti in ingresso i coefficienti di due polinomi di grado qualsiasi, fornisca in uscita i coefficienti del polinomio somma

$$
z(x)=p(x)+q(x)
$$

$$
z = \texttt{polysum(p,q)}
$$

# Riepilogo

## 1.

Dati

$$
p(x)=x^3-x^2+4x-1
$$

e

$$
q(x)=x^2-3x-1
$$

si calcoli:

* \(p-q\);
* \(3p+5q\);
* \(pq\);
* \(2p^2-3q^3\);
* il quoziente e il resto della divisione di \(p\) per \(q\);
* la derivata \(p'\);
* il valore \(p(3)-q(3)\).

## 2.

Disegnare il grafico dei seguenti polinomi:

$$
x^3-x+4
$$

in \([-2,1]\);

$$
x^5+6x^4-24x^2-x-30
$$

in \([-6,3]\).

Trovarne le radici verificando i risultati sul grafico.

## 3.

Calcolare i seguenti integrali:

$$
\int_0^3 (x^2-2x-1)\,dx
$$

$$
\int_{-1}^7 (4x^5+5x^4+5x^3-x)\,dx
$$

## 4.

Calcolare i massimi ed i minimi relativi dei seguenti polinomi:

$$
3x^3-x^2-15x+5
$$

in \([-2,2]\);

$$
12x^5-15x^4-40x^3
$$

in \([-1.5,2.5]\).

Disegnarne il grafico negli intervalli indicati.
