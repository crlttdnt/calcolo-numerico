# Esercizio 1

Si consideri il seguente problema di Cauchy:

$$
\begin{cases}
y'(t)=t(2+t)-y(t), & t\in[0,2],\\
y(0)=1.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=t^2+e^{-t}.
$$

Si approssimi la soluzione del problema con il metodo di Eulero esplicito scegliendo il passo uniforme \(h=0.5\).

Si disegni il grafico della soluzione approssimata e di quella esatta.

Detta \(u_n\) la soluzione approssimata nel nodo

$$
t_n=t_0+nh,\qquad n=0,\ldots,N,
$$

si calcoli il massimo errore di approssimazione commesso nei nodi \(t_n\):

$$
e_h=\max_{n=0,\ldots,N}|y(t_n)-u_n|.
$$

Cosa succede se \(h\) diventa piccolo?

Si ricalcoli la soluzione con il metodo di Eulero per \(h=0.25\) e \(h=0.125\) e si disegnino nella stessa figura sia la soluzione esatta che quelle approssimate per i diversi valori di \(h\).

Si osservi che il metodo numerico converge.

Se il problema è regolare, la velocità con cui l'errore converge a zero individua l'ordine di convergenza del metodo stesso. Se

$$
e_h=\max_{n=0,\ldots,N}|y(t_n)-u_n|=O(h^p),
$$

si dice che il metodo ha ordine \(p\).

# Esercizio 2

Si considerino i seguenti problemi di Cauchy.

### (C1)

$$
\begin{cases}
y'(t)=-2ty^2(t), & t\in[0,2],\\
y(0)=1.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=\frac{1}{1+t^2}.
$$

### (C2)

$$
\begin{cases}
y'(t)=-25y(t), & t\in[0,2],\\
y(0)=1.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=e^{-25t}.
$$

### 2.a)

Si approssimi la soluzione del problema (C1) con il metodo di Eulero esplicito per diversi valori del passo uniforme

$$
h=0.1,\quad 0.01,\quad 0.001,\quad 0.0001.
$$

Detta \(u_n\) la soluzione approssimata nel nodo

$$
t_n=t_0+nh,
$$

si calcoli il massimo errore di approssimazione

$$
e_h=\max_{n=0,\ldots,N}|y(t_n)-u_n|,
$$

e si compili la seguente tabella:

|  \(h\) | \(e_h\) |
| -----: | ------: |
|    0.1 |         |
|   0.01 |         |
|  0.001 |         |
| 0.0001 |         |

Si deduca l'ordine del metodo.

Si osserva che il metodo di Eulero esplicito ha ordine 1.

### 2.b)

Si risolva il problema (C2) con il metodo di Eulero esplicito per

$$
h=0.1,\qquad \frac{2}{25},\qquad 0.05.
$$

Per ogni valore di \(h\), si disegni in una figura il grafico della soluzione esatta (rosso) e della soluzione ottenuta con il metodo di Eulero esplicito (blu).

Si osservino gli andamenti delle soluzioni calcolate.

Si noti che per il metodo di Eulero esplicito si evidenziano oscillazioni nella soluzione numerica calcolata per alcuni valori di \(h\).

In particolare, si noti che per \(h=0.1\) le oscillazioni si amplificano al crescere di \(t\).

Per

$$
h=\frac{2}{25}
$$

abbiamo il caso limite e le oscillazioni non si amplificano né si smorzano.

Infine, per \(h=0.05\), le oscillazioni si smorzano al crescere di \(t\).

Questi comportamenti vanno attribuiti al fatto che il metodo di Eulero, come ogni metodo esplicito, può risultare instabile (più precisamente si dice assolutamente instabile) per valori di \(h\) non sufficientemente piccoli:

$$
h<\frac{2}{25}
$$

nel nostro esempio.

### 2.c)

Si approssimi la soluzione del problema (C2) con il metodo di Eulero esplicito per i seguenti valori del passo uniforme:

$$
h=0.01,\qquad 0.001,\qquad 0.0001.
$$

In maniera analoga a quanto fatto al punto a), si compili la tabella degli errori per verificare che il metodo di Eulero esplicito converge con ordine 1.

# Esercizio 3

Si approssimi la soluzione di entrambi i problemi di Cauchy (C1) e (C2) con il metodo di Eulero implicito per diversi valori del passo uniforme

$$
h=0.1,\quad 0.01,\quad 0.001,\quad 0.0001.
$$

Si disegni il grafico della soluzione approssimata e di quella esatta.

Detta \(u_n\) la soluzione approssimata all'istante

$$
t_n=t_0+nh,
$$

si calcoli il massimo errore di approssimazione commesso nei nodi \(\{t_n\}_{n=0}^N\):

$$
e_h=\max_{n=0,\ldots,N}|y(t_n)-u_n|.
$$

Si compili la seguente tabella per ciascuno dei problemi (C1) e (C2):

|  \(h\) | \(e_h\) |
| -----: | ------: |
|    0.1 |         |
|   0.01 |         |
|  0.001 |         |
| 0.0001 |         |

Si deduca l'ordine del metodo e si osservi che il metodo di Eulero implicito è assolutamente stabile.

# Esercizio 4

Ripetere quanto richiesto nell'Esercizio 3 utilizzando il metodo di Heun.

Si deduca dalle tabelle che il metodo di Heun è di ordine 2 e si osservi l'effetto dell'instabilità per il secondo problema quando si sceglie

$$
h=0.1.
$$

# Esercizio 5

Si consideri il seguente problema di Cauchy:

$$
\begin{cases}
y'(t)=t^2[1-3y(t)], & t\in[0,2],\\
y(0)=2.
\end{cases}
$$

La cui soluzione esatta è:

$$
y(t)=\frac{1}{3}\left(1+5e^{-t^3}\right).
$$

Si approssimi la soluzione del problema con il metodo di Crank-Nicolson.

Si disegni il grafico della soluzione approssimata e di quella esatta.

Detta \(u_n\) la soluzione approssimata all'istante

$$
t_n=t_0+nh,
$$

si calcoli il massimo errore di approssimazione commesso nei nodi \(\{t_n\}_{n=0}^N\):

$$
e_h=\max_{n=0,\ldots,N}|y(t_n)-u_n|.
$$

Si risolva il problema per

$$
h=0.5,\quad 0.05,\quad 0.005,\quad 0.0005
$$

e si compili la seguente tabella:

|  \(h\) | \(e_h\) |
| -----: | ------: |
|    0.5 |         |
|   0.05 |         |
|  0.005 |         |
| 0.0005 |         |

Si deduca dalla tabella l'ordine del metodo motivando la risposta.

# Esercizi di riepilogo

Si considerino i seguenti problemi di Cauchy.

### Problema 1

$$
\begin{cases}
y'(t)=t^2[1-3y(t)], & t\in[0,2],\\
y(0)=2.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=\frac{1}{3}\left(1+5e^{-t^3}\right).
$$

### Problema 2

$$
\begin{cases}
y'(t)=\frac{y(t)}{t}+\left(\frac{y(t)}{t}\right)^2,
& t\in[e,e+2],\\
y(e)=e.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=t^2-\log(t).
$$

### Problema 3

$$
\begin{cases}
y'(t)=-\frac{1}{t}\left(2y(t)+t^2y^2(t)\right),
& t\in[1,5],\\
y(1)=1.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=\frac{1}{t^2(1+\log(t))}.
$$

### Problema 4

$$
\begin{cases}
y'(t)=-y^2(t), & t\in[0,10],\\
y(0)=5.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=\frac{5}{1+5t}.
$$

### Problema 5

$$
\begin{cases}
y'(t)=\frac{y(t)}{t}+\pi t\cos(\pi t),
& t\in[1,3],\\
y(1)=0.
\end{cases}
$$

Soluzione esatta:

$$
y(t)=t\sin(\pi t).
$$

Si approssimi la soluzione di ciascun problema con i metodi di Eulero esplicito/implicito, di Heun e di Crank-Nicolson per diversi valori del passo uniforme

$$
h=0.1,\quad 0.01,\quad 0.001.
$$

Si disegni il grafico della soluzione approssimata e di quella esatta.

Detta \(u_n\) la soluzione approssimata nel nodo

$$
t_n=t_0+nh,
$$

si calcoli il massimo errore di approssimazione commesso nei nodi \(\{t_n\}_{n=0}^N\):

$$
e_h=\max_{n=0,\ldots,N}|y(t_n)-u_n|.
$$

Si compili la seguente tabella per ciascun metodo e ciascun problema:

| \(h\) | \(e_h\) |
| ----: | ------: |
|   0.1 |         |
|  0.01 |         |
| 0.001 |         |

Dai risultati ottenuti si deduca l'ordine dei metodi.

## Soluzioni

### Eulero esplicito

| \(h\) |                Problema 1 |                Problema 2 |                Problema 3 |                Problema 4 |                Problema 5 |
| ----: | ------------------------: | ------------------------: | ------------------------: | ------------------------: | ------------------------: |
|   0.1 | \(7.2020\mathrm{e}{-02}\) | \(6.0500\mathrm{e}{-01}\) | \(6.8682\mathrm{e}{-02}\) | \(8.3333\mathrm{e}{-01}\) | \(5.9215\mathrm{e}{-01}\) |
|  0.01 | \(6.9588\mathrm{e}{-03}\) | \(6.8508\mathrm{e}{-02}\) | \(5.8926\mathrm{e}{-03}\) | \(4.7658\mathrm{e}{-02}\) | \(6.1857\mathrm{e}{-02}\) |
| 0.001 | \(6.9282\mathrm{e}{-04}\) | \(6.9443\mathrm{e}{-03}\) | \(5.8111\mathrm{e}{-04}\) | \(4.6146\mathrm{e}{-03}\) | \(6.2142\mathrm{e}{-03}\) |

### Eulero implicito

| \(h\) |                Problema 1 |                Problema 2 |                Problema 3 |                Problema 4 |                Problema 5 |
| ----: | ------------------------: | ------------------------: | ------------------------: | ------------------------: | ------------------------: |
|   0.1 | \(6.6063\mathrm{e}{-02}\) | \(8.2366\mathrm{e}{-01}\) | \(5.0612\mathrm{e}{-02}\) | \(3.4873\mathrm{e}{-01}\) | \(6.5256\mathrm{e}{-01}\) |
|  0.01 | \(6.8905\mathrm{e}{-03}\) | \(7.0626\mathrm{e}{-02}\) | \(5.7151\mathrm{e}{-03}\) | \(4.4451\mathrm{e}{-02}\) | \(6.2491\mathrm{e}{-02}\) |
| 0.001 | \(6.9213\mathrm{e}{-04}\) | \(6.9655\mathrm{e}{-03}\) | \(5.7934\mathrm{e}{-04}\) | \(4.5826\mathrm{e}{-03}\) | \(6.2205\mathrm{e}{-03}\) |

### Heun

| \(h\) |                Problema 1 |                Problema 2 |                Problema 3 |                Problema 4 |                Problema 5 |
| ----: | ------------------------: | ------------------------: | ------------------------: | ------------------------: | ------------------------: |
|   0.1 | \(9.1083\mathrm{e}{-03}\) | \(2.6057\mathrm{e}{-02}\) | \(6.1335\mathrm{e}{-03}\) | \(1.0417\mathrm{e}{-01}\) | \(1.8575\mathrm{e}{-02}\) |
|  0.01 | \(6.7473\mathrm{e}{-05}\) | \(2.7893\mathrm{e}{-04}\) | \(5.2473\mathrm{e}{-05}\) | \(9.6408\mathrm{e}{-04}\) | \(1.8347\mathrm{e}{-04}\) |
| 0.001 | \(6.5658\mathrm{e}{-07}\) | \(2.8073\mathrm{e}{-06}\) | \(5.1504\mathrm{e}{-07}\) | \(9.2978\mathrm{e}{-06}\) | \(1.8318\mathrm{e}{-06}\) |

### Crank-Nicolson

| \(h\) |                Problema 1 |                Problema 2 |                Problema 3 |                Problema 4 |                Problema 5 |
| ----: | ------------------------: | ------------------------: | ------------------------: | ------------------------: | ------------------------: |
|   0.1 | \(2.6840\mathrm{e}{-03}\) | \(9.3645\mathrm{e}{-03}\) | \(4.7691\mathrm{e}{-03}\) | \(1.0458\mathrm{e}{-01}\) | \(2.6550\mathrm{e}{-02}\) |
|  0.01 | \(2.7398\mathrm{e}{-05}\) | \(9.3331\mathrm{e}{-05}\) | \(4.7382\mathrm{e}{-05}\) | \(9.2700\mathrm{e}{-04}\) | \(2.6713\mathrm{e}{-04}\) |
| 0.001 | \(2.7398\mathrm{e}{-07}\) | \(9.3328\mathrm{e}{-07}\) | \(4.7379\mathrm{e}{-07}\) | \(9.2594\mathrm{e}{-06}\) | \(2.6714\mathrm{e}{-06}\) |
