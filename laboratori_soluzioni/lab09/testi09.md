# Esercizio 1

Assegnati i seguenti integrali:

$$
\int_{-2}^{5}(7x-5)\,dx
$$

$$
\int_{-2}^{5}(5x^2-3x+8)\,dx
$$

$$
\int_{-2}^{5}(3x^3-2x^2+5x-1)\,dx
$$

scegliere opportunamente una delle seguenti formule di quadratura semplici: punto medio, trapezi e Simpson, in modo da calcolare esattamente gli integrali assegnati.

Confrontare il risultato con la soluzione calcolata utilizzando il comando `polyint`.

# Esercizio 2

Si approssimino i seguenti integrali (tra parentesi sono dati i valori esatti):

* $$
  \int_0^{\pi/2}\sin(x)\,dx=1
  $$

* $$
  \int_{-10}^{10}\cos(x)e^{\sin(x)}\,dx
  =
  e^{\sin(10)}-e^{-\sin(10)}
  $$

A tal scopo si consideri una suddivisione dell’intervallo di integrazione \([a,b]\) in \(m\) sottointervalli di uguale ampiezza

$$
H=\frac{b-a}{m}
$$

e si utilizzi il metodo dei trapezi compositi per

$$
m=20,200,2000,20000.
$$

Per ogni \(m\) si calcoli l’errore assoluto e si compili la seguente tabella:

| \(m\) | \(H\) | Errore assoluto |
| ----: | ----: | --------------: |
|    20 |       |                 |
|   200 |       |                 |
|  2000 |       |                 |
| 20000 |       |                 |

Si verifichi che l’errore è \(O(H^2)\).

# Esercizio 3

Per approssimare

$$
I=\int_a^b f(x)\,dx
$$

si scriva uno script-file che calcoli ripetutamente l’integrale con la formula dei trapezi composita utilizzando suddivisioni dell’intervallo di integrazione in sottointervalli di uguale ampiezza sempre più fitte.

Più precisamente, a partire da \(m=1\) suddivisioni di \([a,b]\) (e quindi a partire dalla formula semplice), si raddoppi iterativamente il numero di sottointervalli

$$
m\rightarrow2m
$$

e si calcoli l’approssimazione \(I_{2m}\) di \(I\) con il metodo dei trapezi composito su \(2m\) sottointervalli, finché la differenza

$$
err\approx|I_{2m}-I_m|
$$

non sia minore di

$$
tol=1\mathrm{e}{-6}.
$$

Si provi il codice scritto utilizzando l’ultimo integrale dell’esercizio 2 e si verifichi che al termine del processo l’errore di approssimazione commesso risulta inferiore alla precisione richiesta.

# Esercizio 4

Si considerino i seguenti integrali (tra parentesi i valori esatti):

* $$
  \int_1^2\left(\frac{1}{x}+e^x\right)\,dx
  =
  \log(2)+e^2-e
  $$

* $$
  \int_0^5\frac{1}{1+x^2}\,dx
  =
  \arctan(5)
  $$

e si ripeta quanto richiesto nell’Esercizio 2, ma utilizzando i codici sviluppati per i metodi del punto medio e di Simpson compositi.

Si calcoli il valore assoluto dell’errore commesso e si compili la seguente tabella per ciascun integrale e ciascun metodo.

| \(m\) | \(H\) | Errore assoluto |
| ----: | ----: | --------------: |
|    20 |       |                 |
|   200 |       |                 |
|  2000 |       |                 |
| 20000 |       |                 |

Si verifichi che l’errore è \(O(H^2)\) per il metodo del punto medio e che l’errore è \(O(H^4)\) per il metodo di Simpson, con

$$
H=\frac{b-a}{m}.
$$

# Equazioni non lineari

## Esercizio 1

Eseguire il grafico delle seguenti funzioni negli intervalli specificati ed in seguito, con la funzione `fzero`, trovarne le radici:

### a.

$$
f(x)=\sin(e^x),
\qquad x\in[0,2.5]
$$

### b.

$$
f(x)=(x^3-3x+2)e^x,
\qquad x\in[-3,1.5]
$$

# Esercizi di riepilogo

## Esercizio 1

Sia \(n\) l’ultima cifra del vostro numero di matricola, poniamo

$$
a=n+2.
$$

Data la funzione

$$
f(x)=\frac{ax^5-1}{x^5+1}
$$

si valuti tale funzione in 10 punti equispaziati dell’intervallo \([0,1]\) e, a partire da tali dati:

### (i)

Si calcoli l’integrale

$$
I=\int_0^1 f(x)\,dx
$$

utilizzando la funzione predefinita di Matlab `integral`.

### (ii)

Si approssimi l’integrale

$$
I=\int_0^1 f(x)\,dx
$$

utilizzando la formula dei trapezi composita.

### (iii)

Si calcoli la spline lineare interpolante \(s_1\) ed il valore \(s_1(z)\) da essa assunto nel punto

$$
z=\left(\frac{1}{a}\right)^{1/5}.
$$

### Risultati

Utilizzando, per esempio, come ultima cifra del numero di matricola il valore \(n=7\), si ottiene:

$$
a=9
$$

$$
I(\text{trapezi})=1.2975\mathrm{e}{-01}
$$

$$
I(\text{integral})=1.1686\mathrm{e}{-01}
$$

$$
z=\left(\frac{1}{a}\right)^{1/5}=6.4439\mathrm{e}{-01}
$$

$$
s_1(z)=3.1133\mathrm{e}{-02}.
$$

## Esercizio 2

Si approssimino i seguenti integrali (tra parentesi i valori esatti):

### 2.a

$$
\int_0^{\pi/4}\frac{1}{\cos(x)}\,dx
=
\log(\sqrt{2}+1)
$$

### 2.b

$$
\int_1^3\frac{1}{\sqrt{2x+5}}\,dx
=
\frac{\sqrt{11}-\sqrt{7}}{1}
$$

A tale scopo si consideri una suddivisione dell’intervallo di integrazione \([a,b]\) in \(m\) sottointervalli di uguale ampiezza

$$
H=\frac{b-a}{m}
$$

per diversi valori di

$$
m=10,100,1000,10000
$$

e si utilizzino le formule dei trapezi, del punto medio e di Cavalieri-Simpson composite.

Per ogni integrale e per ogni formula di quadratura si calcoli l’errore assoluto e si compili la seguente tabella:

| \(m\) | \(H\) | Errore assoluto |
| ----: | ----: | --------------: |
|    10 |       |                 |
|   100 |       |                 |
|  1000 |       |                 |
| 10000 |       |                 |

Si verifichi che l’errore è \(O(H^2)\) per i metodi dei trapezi e del punto medio e che l’errore è \(O(H^4)\) per il metodo di Simpson.

### Risultati — Esercizio 2.a — Trapezi

| \(m\) |                     \(H\) |           Errore assoluto |
| ----: | ------------------------: | ------------------------: |
|    10 | \(1.0000\mathrm{e}{-01}\) | \(3.7191\mathrm{e}{-05}\) |
|   100 | \(1.0000\mathrm{e}{-02}\) | \(3.7191\mathrm{e}{-07}\) |
|  1000 | \(1.0000\mathrm{e}{-03}\) | \(3.7191\mathrm{e}{-09}\) |
| 10000 | \(1.0000\mathrm{e}{-04}\) | \(3.7191\mathrm{e}{-11}\) |

### Risultati — Esercizio 2.a — Punto medio

| \(m\) |                     \(H\) |           Errore assoluto |
| ----: | ------------------------: | ------------------------: |
|    10 | \(1.0000\mathrm{e}{-01}\) | \(1.8595\mathrm{e}{-05}\) |
|   100 | \(1.0000\mathrm{e}{-02}\) | \(1.8595\mathrm{e}{-07}\) |
|  1000 | \(1.0000\mathrm{e}{-03}\) | \(1.8595\mathrm{e}{-09}\) |
| 10000 | \(1.0000\mathrm{e}{-04}\) | \(1.8595\mathrm{e}{-11}\) |

### Risultati — Esercizio 2.a — Cavalieri-Simpson

| \(m\) |                     \(H\) |           Errore assoluto |
| ----: | ------------------------: | ------------------------: |
|    10 | \(1.0000\mathrm{e}{-01}\) | \(3.7471\mathrm{e}{-10}\) |
|   100 | \(1.0000\mathrm{e}{-02}\) | \(3.6859\mathrm{e}{-14}\) |
|  1000 | \(1.0000\mathrm{e}{-03}\) |                     \(0\) |
| 10000 | \(1.0000\mathrm{e}{-04}\) |                     \(0\) |

### Risultati — Esercizio 2.b — Trapezi

| \(m\) |                     \(H\) |           Errore assoluto |
| ----: | ------------------------: | ------------------------: |
|    10 | \(7.8540\mathrm{e}{-02}\) | \(7.2615\mathrm{e}{-04}\) |
|   100 | \(7.8540\mathrm{e}{-03}\) | \(7.2696\mathrm{e}{-06}\) |
|  1000 | \(7.8540\mathrm{e}{-04}\) | \(7.2696\mathrm{e}{-08}\) |
| 10000 | \(7.8540\mathrm{e}{-05}\) | \(7.2697\mathrm{e}{-10}\) |

### Risultati — Esercizio 2.b — Punto medio

| \(m\) |                     \(H\) |           Errore assoluto |
| ----: | ------------------------: | ------------------------: |
|    10 | \(7.8540\mathrm{e}{-02}\) | \(3.6277\mathrm{e}{-04}\) |
|   100 | \(7.8540\mathrm{e}{-03}\) | \(3.6348\mathrm{e}{-06}\) |
|  1000 | \(7.8540\mathrm{e}{-04}\) | \(3.6348\mathrm{e}{-08}\) |
| 10000 | \(7.8540\mathrm{e}{-05}\) | \(3.6348\mathrm{e}{-10}\) |

### Risultati — Esercizio 2.b — Cavalieri-Simpson

| \(m\) |                     \(H\) |           Errore assoluto |
| ----: | ------------------------: | ------------------------: |
|    10 | \(7.8540\mathrm{e}{-02}\) | \(2.0430\mathrm{e}{-07}\) |
|   100 | \(7.8540\mathrm{e}{-03}\) | \(2.0552\mathrm{e}{-11}\) |
|  1000 | \(7.8540\mathrm{e}{-04}\) | \(2.3315\mathrm{e}{-15}\) |
| 10000 | \(7.8540\mathrm{e}{-05}\) | \(5.5511\mathrm{e}{-16}\) |
