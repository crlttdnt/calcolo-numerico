# Esercizio 1

Calcolare i polinomi che interpolano i dati nelle seguenti tabelle; farne un grafico che metta in evidenza i dati utilizzati disegnandoli con un cerchietto.

**Prima tabella**

$$
\begin{array}{c|cccc}
x & -2 & 1 & 2 & 7 \\
\hline
y & -4 & -1 & 0.5 & 3
\end{array}
$$

**Seconda tabella**

$$
\begin{array}{c|cccccc}
x & -5 & -3 & -1 & 1 & 3 & 5 \\
\hline
y & 0.1 & -0.5 & 0.5 & 1.1 & 0.9 & -2
\end{array}
$$

# Esercizio 2

Data la funzione

$$
f(x)=e^x\sin(x), \qquad x\in[-1,1]
$$

calcolare il polinomio \(p\) che interpola \(f\) in \(n+1\) nodi equispaziati nell’intervallo \([-1,1]\).

Disegnare sullo stesso grafico \(f\), \(p\) e i nodi usati per l’interpolazione, segnandoli con un cerchietto.

Provare per \(n=2,4,8,16\) ed osservare come cambia il polinomio d’interpolazione.

# Esercizio 3

Ripetere quanto svolto all’esercizio precedente per le seguenti funzioni nell’intervallo di definizione \([a,b]\) indicato.

Stimare inoltre l’errore d’interpolazione globale commesso, valutando \(f\) e \(p\) in 1000 punti equispaziati in \([a,b]\) e calcolando il massimo modulo della differenza dei vettori così generati.

Si considerino i seguenti casi:

### (i)

$$
f(x)=\frac{(x^2-5x+6)\log(x)}{x},
\qquad [a,b]=[1,4]
$$

Provare per \(n=5,10,15,20\) e controllare l’andamento dell’errore.

### (ii)

$$
f(x)=\frac{1}{1+x^2},
\qquad [a,b]=[-5,5]
$$

Provare per \(n=4,8,16,32\) e controllare l’andamento dell’errore.

# Esercizio 4

Disegnare per diversi valori di \(n\) i nodi di Chebyshev nell’intervallo \([-1,1]\), segnandoli con un pallino.

Osservare dal grafico che i nodi di Chebyshev non sono equispaziati nell’intervallo \([-1,1]\) e che al crescere di \(n\) si addensano in prossimità degli estremi dell’intervallo.

I nodi di Chebyshev si mappano in un qualsiasi intervallo \([a,b]\) mediante la trasformazione lineare

$$
f:[-1,1]\longrightarrow[a,b]
$$

tale che

$$
f(t)=\frac{b-a}{2}t+\frac{a+b}{2}
$$

e quindi i nodi di Chebyshev in \([a,b]\) sono definiti da:

$$
x_k=\frac{b-a}{2}c_k+\frac{a+b}{2},
\qquad \forall k=1,\ldots,n.
$$

# Esercizio 5

Ripetere quanto svolto all’esercizio 3 (ii) utilizzando al posto di \(n+1\) nodi equispaziati in \([-5,5]\) gli \(n+1\) nodi di Chebyshev definiti nel vettore `x` dai seguenti comandi Matlab, una volta fissato un valore di \(n\):

```matlab
ind = [1:n+1];
x = cos(pi*(2*ind-1)/(2*(n+1)));
x = x*5;
```

Come cambia l’errore in questo caso al variare di \(n\)?

# Esercizio 6

Approssimare con una spline lineare interpolante la funzione

$$
f(x)=\frac{1}{1+x^2}
$$

nell’intervallo \([-5,5]\), suddiviso in \(m\) sottointervalli di ampiezza

$$
H=\frac{10}{m}.
$$

Definire 10000 punti equispaziati in \([-5,5]\) che possono essere utilizzati per:

* disegnare nello stesso grafico la funzione e la spline;
* calcolare l’errore di approssimazione commesso, ovvero il massimo modulo della differenza tra la funzione \(f\) e la spline.

Riportare i risultati ottenuti nella tabella sottostante:

| \(m\) | \(H=10/m\) | Errore |
| ----: | ---------: | -----: |
|     5 |            |        |
|    50 |            |        |
|   500 |            |        |

Verificare che per \(H\) che tende a 0, l’errore tende a zero come \(O(H^2)\), come previsto dalla stima dell’errore nel Teorema sopracitato.

# Esercizio 7

Ripetere l’esercizio precedente con le funzioni

$$
f_1(x)=e^x\cos(4x),
\qquad x\in[0,\pi].
$$

$$
f_2(x)=\sqrt{|x|},
\qquad x\in[-1,1].
$$

Si osservi l’effetto della non derivabilità di \(f_2\) in \(0\) sulla velocità di convergenza, ovvero sull’andamento dell’errore.

# Esercizi di riepilogo

## Esercizio 1

Si consideri la funzione

$$
f(x)=\frac{2\sin(x)\cos(x)}{1+x^2}.
$$

Si considerino 10 nodi equispaziati \(x_i\), \(i=1,\ldots,10\), sull’intervallo \([0,2]\).

### 1.

Si costruisca il polinomio \(p\) che interpola \(f\) nei punti \((x_i,f(x_i))\), \(i=1,\ldots,10\); si considerino 100 punti equispaziati \(z_k\) nell’intervallo \([0,2]\) e si calcoli

$$
E=\max_{1\leq k\leq100}|f(z_k)-p(z_k)|.
$$

**Risultato:** \(E=7.3525\mathrm{e}{-04}\).

### 2.

Si calcoli la derivata del polinomio interpolatore, \(p'\), si disegnino su uno stesso grafico \(f\), \(p\) e \(p'\), si calcolino infine gli zeri di \(p'\) e si individui tra di essi quello che approssima il punto di massimo di \(f\) nell’intervallo considerato.

**Risultato:** \(x_{\max}=5.8066\mathrm{e}{-01}\).

### 3.

Si costruisca la spline lineare \(s_1\) interpolante \(f\) nei punti \((x_i,f(x_i))\), \(i=1,\ldots,10\); si considerino 100 punti equispaziati \(z_k\) nell’intervallo \([0,2]\) e si calcoli

$$
E_1=\max_{1\leq k\leq100}|f(z_k)-s_1(z_k)|.
$$

**Risultato:** \(E_1=2.7356\mathrm{e}{-02}\).

## Esercizio 2

Si consideri la funzione

$$
g(x)=\frac{x^2}{1+x^2}
$$

nell’intervallo \([-4,4]\).

### 1.

Si calcoli il polinomio \(p\) di grado \(n=10\) che interpola \(g\) in nodi equispaziati nell’intervallo assegnato.

Si disegni il grafico di \(g\), \(p\) e dei nodi usati per l’interpolazione, segnandoli con un cerchietto.

Sia inoltre \(z\) il vettore di 100 punti equispaziati in \([-4,4]\), si calcoli l’errore

$$
E=\max_{1\leq k\leq100}|g(z_k)-p(z_k)|.
$$

### 2.

Si considerino \(n+1\) nodi di Chebyshev nell’intervallo \([-4,4]\) definiti da:

$$
c_k=4\cos\left(\frac{\pi(2k-1)}{2(n+1)}\right),
\qquad k=1,2,\ldots,n+1
$$

e si ripeta quanto richiesto al punto precedente interpolando \(g\) nei nodi di Chebyshev indicati.

**Risultati:**

$$
E=1.1767\mathrm{e}{+00},
\qquad
E_{\mathrm{Cheb}}=5.8412\mathrm{e}{-02}.
$$

## Esercizio 3

Si consideri la funzione

$$
f(x)=\sin(x+e^x)-\frac{7}{12},
\qquad x\in[0,1].
$$

### 1.

Si disegni il grafico della funzione nell’intervallo indicato.

Sia

$$
x_{\max}=\frac{4}{15}
$$

un’approssimazione del punto di massimo relativo di \(f\) nell’intervallo considerato.

### 2.

Si consideri il vettore \(z\) di punti equispaziati a distanza \(h\) nell’intervallo \([0,1]\).

Per i due seguenti valori di \(h=0.1,0.01\) si determini:

* la spline lineare \(s(x)\) che interpola \(f\) nei punti di \(z\);
* il valore assunto dalla spline nel punto \(x_{\max}\), ovvero \(s(x_{\max})\);
* l’errore \(E=|f(x_{\max})-s(x_{\max})|\).

Si completi quindi la seguente tabella:

| \(h\) | \(s(x_{\max})\) | \(|f(x_{\max})-s(x_{\max})|\) |
|---:|---:|---:|
| 0.1 | | |
| 0.01 | | |

Visualizzare i risultati in `format short e`.

**Risultati:**

Per \(h=0.1\):

$$
s\left(\frac{4}{15}\right)=4.1087\mathrm{e}{-01},
\qquad
E=5.7943\mathrm{e}{-03}.
$$

Per \(h=0.01\):

$$
s\left(\frac{4}{15}\right)=4.1661\mathrm{e}{-01},
\qquad
E=5.8974\mathrm{e}{-05}.
$$
