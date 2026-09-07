# Esercizio 1

Si considerino i dati:

```matlab
x = [0 1 2 3 4 5 6 7 8 9 10];
y = [0 1.25 2.27 3.04 3.77 4.71 5.91 7.19 8.29 9.12 9.83];
```

e si calcolino i coefficienti della retta di regressione lineare con il comando `polyfit`.

Si disegni il grafico della retta di regressione nell’intervallo \([-1,11]\) con una linea nera e si evidenzino i punti \((x_i,y_i)\) mediante un cerchietto rosso.

# Esercizio 2

Assegnati i punti di coordinate

```matlab
x = [-5 -2 0.5 1 1.5 3 6];
y = [1.5 2 -1 2.5 1 -2 3];
```

si calcolino i coefficienti della retta di regressione che approssima i dati nel senso dei minimi quadrati e si disegni il grafico della retta calcolata e dei dati \((x,y)\).

Verificare che la retta di regressione lineare passa per il punto che ha per coordinate rispettivamente la media delle ascisse e la media delle ordinate dei dati in tabella:

$$
(\bar{x},\bar{y})=
\left(
\frac{1}{7}\sum_{i=1}^{7}x_i,
\frac{1}{7}\sum_{i=1}^{7}y_i
\right).
$$

# Esercizio 3 (da un tema d’esame)

Siano

$$
f(t)=2e^{-2t}-t,
$$

\(x\) il vettore di 10 punti equispaziati nell’intervallo \([0,1]\) ed \(y=f(x)\).

1. Si calcolino i coefficienti della retta di regressione \(r\) che approssima i dati \((x,y)\).

2. Si costruisca la matrice \(M\) che ha come prima colonna i valori di \(x\) e come seconda colonna tutti gli elementi uguali a 1.

   Sia \(M^T\) la matrice trasposta di \(M\). Si calcolino la matrice

   $$
   A=M^T M
   $$

   e il vettore

   $$
   b=M^T y.
   $$

   Si risolva il sistema lineare

   $$
   Az=b
   $$

   utilizzando il comando apposito di Matlab.

Se avrete lavorato correttamente, la soluzione del sistema lineare corrisponderà ai coefficienti della retta di regressione calcolati al punto (i).

# Esercizio 4 (da un tema d’esame)

Si consideri la funzione

$$
f(x)=5\cos(\pi x^2)-\exp(x),
$$

sia \(x\) il vettore di 5 punti equispaziati nell’intervallo \([0,1]\) ed \(y=f(x)\).

### 1.

Si costruisca la retta di regressione

$$
r(x)=a_1x+a_0
$$

che approssima i dati \((x_i,y_i)\), \(i=1,\ldots,5\), nel senso dei minimi quadrati.

Si calcoli il valore assunto da tale retta nel valore medio dei dati \(x\), ovvero \(r(\bar{x})\), dove

$$
\bar{x}=\frac{\sum_{i=1}^{5}x_i}{5}.
$$

### 2.

Si costruisca il polinomio \(p\) che interpola i dati \((x_i,y_i)\), per \(i=1,\ldots,5\), e si calcolino le radici di \(p\) nell’intervallo \([0,1]\).

# Esercizio 5

Assegnati i punti di coordinate

```matlab
x = [-3 -2 0 2 4];
y = [3 2 0.5 1 3];
```

si calcolino i polinomi di grado \(m=0,1,2,3,4\) che approssimano tali dati nel senso dei minimi quadrati.

Si disegnino sullo stesso grafico i polinomi (linea continua) e i punti dati (cerchietti).

Verificare che per \(m=0\) il polinomio costante assume il valore

$$
p_0=\frac{1}{5}\sum_{i=1}^{5}y_i.
$$

Cosa accade per \(m=4\)?

# Esercizio 6

A partire dai dati \((x_i,y_i)\) memorizzati nei vettori

```matlab
x = [-55:10:55];
y = [3.22, 3.3, 3.32, 3.17, 3.07, 3.02, 3.02, 3.12, 3.2, 3.35, 3.37, 3.25];
```

eseguire quanto segue:

* approssimarli nel senso dei minimi quadrati con una retta;
* approssimarli nel senso dei minimi quadrati con una parabola;
* approssimarli nel senso dei minimi quadrati con un polinomio di grado 4;
* interpolarli con un polinomio di grado 11;
* rappresentare graficamente le curve ottenute nello stesso grafico, evidenziando con un cerchietto i dati \(x\) e \(y\) che sono stati considerati.

Cosa osservate?

# Esercizio 7

Approssimare i dati nella tabella sottostante nel senso dei minimi quadrati con una funzione esponenziale del tipo

$$
y(x)=Ce^{Ax}.
$$

$$
\begin{array}{c|ccccc}
x & 1 & 2 & 3 & 4 & 5\\
\hline
y & 4.9 & 8 & 12.3 & 23.1 & 36.5
\end{array}
$$

Rappresentare il grafico della funzione approssimante e dei dati \((x,y)\).

Valutare infine il valore assunto dalla funzione approssimante in \(x=2.5\).

# Esercizio 8

Approssimare i dati nella tabella sottostante nel senso dei minimi quadrati con una funzione potenza del tipo

$$
y(x)=Cx^A.
$$

$$
\begin{array}{c|ccccc}
x & 1 & 2 & 3 & 4 & 5\\
\hline
y & 0.6 & 1.9 & 4.3 & 7.6 & 12.6
\end{array}
$$

Rappresentare il grafico della funzione approssimante e dei dati \((x,y)\).

Valutare infine il valore assunto dalla funzione approssimante in \(x=2.5\).

# Modelli di regressione lineare

Siano date \(N+1\) coppie \((x_i,y_i)\), per \(i=0,\ldots,N\), di dati di origine sperimentale.

Possiamo ragionare in modo analogo per determinare funzioni di altro tipo che approssimino i dati assegnati.

Ad esempio:

### c) \(y=A\ln x+B\)

Sostituendo

$$
X=\ln x
$$

i coefficienti della retta di regressione lineare

$$
r(X)=AX+B
$$

che approssima nel senso dei minimi quadrati i dati

$$
(\ln x_i,y_i)
$$

individuano i coefficienti \(A\) e \(B\) cercati.

### d) \(y=\dfrac{A}{x}+B\)

Sostituendo

$$
X=\frac{1}{x}
$$

i coefficienti della retta di regressione lineare

$$
r(X)=AX+B
$$

che approssima nel senso dei minimi quadrati i dati

$$
\left(\frac{1}{x_i},y_i\right)
$$

individuano i coefficienti \(A\) e \(B\) cercati.

### e) \(y=\dfrac{1}{Ax+B}\)

Da cui

$$
\frac{1}{y}=Ax+B.
$$

Sostituendo

$$
Y=\frac{1}{y}
$$

i coefficienti della retta di regressione lineare

$$
r(x)=Ax+B
$$

che approssima nel senso dei minimi quadrati i dati

$$
\left(x_i,\frac{1}{y_i}\right)
$$

individuano i coefficienti \(A\) e \(B\) cercati.

### f) \(y=\dfrac{x}{A+Bx}\)

Da cui

$$
\frac{1}{y}=\frac{A+Bx}{x}=A\frac{1}{x}+B.
$$

Sostituendo

$$
X=\frac{1}{x},
\qquad
Y=\frac{1}{y},
$$

i coefficienti della retta di regressione lineare

$$
r(X)=AX+B
$$

che approssima nel senso dei minimi quadrati i dati

$$
\left(\frac{1}{x_i},\frac{1}{y_i}\right)
$$

individuano i coefficienti \(A\) e \(B\) cercati.

# Esercizio 9

Approssimare l’integrale definito

$$
\int_{-10}^{10}\frac{\cos(10x)}{e^{\sin(10x)}}\,dx
$$

con la funzione `integral` di Matlab.

Calcolare l’errore assoluto e l’errore relativo e verificare che soddisfano la precisione di default.

# Integrali generalizzati

È possibile anche calcolare integrali generalizzati, come ad esempio:

$$
\int_0^{+\infty}e^{-3x}\,dx
=
\lim_{M\to\infty}\int_0^M e^{-3x}\,dx
$$

$$
=
\lim_{M\to\infty}
\left[
-\frac{1}{3}e^{-3M}+\frac{1}{3}
\right]
=
\frac{1}{3}.
$$

In Matlab:

```matlab
f = @(x) exp(-3*x);
I = integral(f,0,inf)
```

```text
I = 0.3333
```

# Esercizi di riepilogo

## Esercizio 1

Si considerino i dati \((q_i,z_i)\), per \(i=1,\ldots,6\), nella tabella sottostante, relativi alla quantità di zinco \(z_i\) deposta al catodo di un bagno elettrochimico in corrispondenza di differenti quantità di carica \(q_i\).

| \(q\) (in Coulomb) |    1 |    3 |    5 |    9 |    12 |    15 |
| ------------------ | ---: | ---: | ---: | ---: | ----: | ----: |
| \(z\) (in grammi)  | 10.7 | 30.9 | 41.8 | 80.9 | 100.5 | 129.5 |

Calcolare la retta di regressione

$$
z(q)=mq+z_0
$$

che approssima i dati.

Si osservi che \(z_0\) rappresenta la quantità di zinco già presente al catodo al momento dell’accensione del bagno, ovvero quando \(q=0\).

**Risultato:**

$$
m=8.3508,
\qquad
z_0=3.0853.
$$

## Esercizio 2

In tabella sono riportati i dati relativi alle misurazioni di concentrazione di un erbicida

$$
C=\{c_i\}_{i=1,\ldots,8}
$$

nel tempo

$$
T=\{t_i\}_{i=1,\ldots,8}
$$

misurato in giorni, in un terreno trattato con diserbante.

| \(T\) |    0 |   10 |   20 |    30 |   40 |  50 |  60 |  70 |
| ----- | ---: | ---: | ---: | ----: | ---: | --: | --: | --: |
| \(C\) | 96.4 | 46.3 | 21.2 | 17.89 | 10.1 | 6.9 | 3.5 | 1.9 |

### 1.

Si calcoli:

* la retta di regressione \(r\) che approssima i dati nel senso dei minimi quadrati;
* la spline lineare \(s_1\);
* il polinomio \(p\) di grado 7 che interpola gli stessi dati.

Si disegni il grafico delle funzioni approssimanti calcolate e dei dati.

A tal fine si utilizzi il vettore di punti ausiliario

```matlab
z = 0:0.2:70;
```

### 2.

Si utilizzino le tre approssimanti calcolate per stimare la concentrazione di erbicida nel terreno trattato dopo due mesi esatti, ovvero al tempo \(t=62\).

**Risultati:**

$$
r(62)=-4.2466
$$

$$
s_1(62)=3.1800
$$

$$
p(62)=1.0298.
$$

### 3.

Per la retta di regressione si calcoli lo scarto quadratico

$$
s_r=\sum_{i=1}^{8}|c_i-r(t_i)|^2.
$$

Si indichi senza calcolarlo lo scarto quadratico

$$
s_p=\sum_{i=1}^{8}|c_i-p(t_i)|^2
$$

nel caso del polinomio interpolatore, giustificando la risposta.

**Risultati:**

$$
s_r=2.0538\mathrm{e}{+03},
\qquad
s_p=0.
$$

## Esercizio 3

Si consideri la funzione

$$
f(t)=\frac{2}{3}\log\left(\frac{2}{3}t\right)
$$

nell’intervallo

$$
\left[\frac{3e}{2},\frac{3e}{2}+1\right].
$$

Sia \(x\) il vettore di 10 punti equispaziati nell’intervallo considerato e \(y=f(x)\).

### 1.

Si calcoli la retta di regressione \(r\) che approssima i dati \((x,y)\).

**Risultato:**

$$
r(x)=0.1461x+0.0736.
$$

### 2.

Si determini il valore \(r(\bar{x})\) assunto dalla retta nel punto

$$
\bar{x}=\frac{1}{10}\sum_{i=1}^{10}x_i.
$$

**Risultato:**

$$
r(\bar{x})=0.7422.
$$

### 3.

Si costruisca la matrice \(M\) che ha come prima colonna i valori di \(x\) e come seconda colonna tutti gli elementi uguali a 1.

Sia \(M^T\) la matrice trasposta di \(M\). Si calcolino la matrice

$$
A=M^T M
$$

e il vettore

$$
b=M^T y.
$$

Si risolva il sistema lineare

$$
Az=b
$$

utilizzando il comando apposito di Matlab.

**Risultato:** la soluzione del sistema lineare corrisponde ai coefficienti della retta di regressione calcolati al punto (1).

## Esercizio 4

Approssimare i dati nella tabella sottostante nel senso dei minimi quadrati:

1. con una parabola;
2. con una funzione potenza del tipo \(y=Cx^A\).

Per ognuno dei due casi calcolare il valore assunto dalla curva approssimante in \(x=1.75\).

| \(x\) |   1 | 1.15 | 1.3 | 1.45 | 1.6 | 1.75 |  1.9 | 2.05 | 2.2 | 2.35 |  2.5 |
| ----- | --: | ---: | --: | ---: | --: | ---: | ---: | ---: | --: | ---: | ---: |
| \(y\) | 0.1 | 0.15 | 0.2 |  0.3 | 0.5 | 0.65 | 0.78 |    1 | 1.2 | 1.35 | 1.45 |

**Risultati:**

$$
p(x)=0.2606x^2+0.0717x-0.2839
$$

$$
A=3.100,
\qquad
C=0.1005
$$

$$
p(1.75)=0.6396,
\qquad
y(1.75)=0.5698.
$$

## Esercizio 5

Approssimare i dati nella tabella sottostante nel senso dei minimi quadrati con una funzione del tipo

$$
y(x)=\frac{1}{Ax+B}.
$$

| \(x\) |    1 |    2 |   3 |    4 |    5 |
| ----- | ---: | ---: | --: | ---: | ---: |
| \(y\) | 0.35 | 0.25 | 0.2 | 0.15 | 0.12 |

Disegnare il grafico della funzione approssimante a confronto con i dati.

Valutare infine il valore assunto dalla funzione approssimante in \(x=1.5\).

**Risultati:**

$$
A=1.3619,
\qquad
B=1.2857,
\qquad
y(1.5)=0.3004.
$$

## Esercizio 6

Approssimare i dati nella tabella sottostante nel senso dei minimi quadrati con una funzione del tipo

$$
y(x)=\frac{x}{A+Bx}.
$$

| \(x\) |    1 |    2 |    3 |   4 |    5 |
| ----- | ---: | ---: | ---: | --: | ---: |
| \(y\) | 0.25 | 0.31 | 0.35 | 0.4 | 0.41 |

Disegnare il grafico della funzione approssimante a confronto con i dati.

Valutare infine il valore assunto dalla funzione approssimante in \(x=4.5\).

**Risultati:**

$$
A=1.9436,
\qquad
B=2.1168,
\qquad
y(4.5)=0.3924.
$$
