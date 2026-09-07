# Esercizio 1

Si consideri il problema della ricerca degli zeri \(\alpha_1\) e \(\alpha_2\), con \(\alpha_1 < \alpha_2\), della funzione

$$
f(x) = e^x - x^2 - \sin(x) - 1, \qquad -2 \leq x \leq 2.
$$

### 1.a)

Tracciare un grafico della funzione nell'intervallo considerato. Localizzare graficamente gli zeri di \(f(x)=0\), eventualmente con l'aiuto dello zoom.

### 1.b)

Il metodo di bisezione è applicabile per calcolare tutti gli zeri?

### 1.c)

Applicare il metodo, quando possibile, utilizzando la function `bisezione` con tolleranza `eps=1e-8` e considerando un opportuno intervallo di partenza.

# Esercizio 2

Si considerino le funzioni:

### 2.a)

$$
f(x) = e^{-x} - \sin(x), \qquad x \in [-1,5].
$$

### 2.b)

$$
f(x) = (5x^3 - 8x^2 + x + 2)\sin(x), \qquad x \in [-1,2].
$$

Si determinino, ove possibile, le radici negli intervalli di definizione sopraindicati utilizzando il metodo di bisezione con tolleranza \(10^{-5}\) e scegliendo in modo opportuno gli intervalli di partenza.

# Esercizio 3

Si applichi il metodo di Newton alla funzione

$$
f(x) = x^2 - 7
$$

con

$$
x_0 = 10, \qquad \text{tol}=10^{-12}, \qquad \text{nitmax}=200.
$$

# Esercizio 4

Eseguire il grafico delle seguenti funzioni negli intervalli specificati e in seguito trovarne le radici con il metodo di Newton scegliendo tolleranza \(10^{-6}\) e numero massimo di iterazioni pari a 100.

### 4.a)

$$
f(x) = e^{-x}\sin(x), \qquad x \in [-1,5].
$$

### 4.b)

$$
f(x) = (x-1)^2\left(x+\frac{2}{5}\right), \qquad x \in [-1,2].
$$

Nel caso 4.b) la funzione \(f\) ha una radice doppia e una semplice. Si osservi che il metodo di Newton è in grado di calcolare la radice doppia di \(f\).

Si confronti il numero di iterazioni effettuate dal metodo di Newton per calcolare ciascuna radice. Quale viene calcolata più velocemente?

Nel caso di radici multiple la velocità di convergenza di Newton si riduce: non ha più ordine 2 ma solo 1. Per recuperare velocità lo si può modificare così:

$$
x_{k+1} = x_k - m\frac{f(x_k)}{f'(x_k)},
\qquad k=0,1,2,3,\ldots
$$

dove \(m\) denota la molteplicità della radice. Nel nostro esempio \(m=2\).

# Esercizio 5

## Combinazione dei metodi di bisezione e di Newton

Per il calcolo dello zero della funzione

$$
f(x)=\arctan(x),
$$

applicare sia il metodo di bisezione (a partire dall'intervallo \([-15,20]\)) che il metodo di Newton (con punto iniziale \(x_0=20\)), entrambi con

$$
\text{tol}=10^{-12}.
$$

Commentare i risultati. Sono soddisfacenti in entrambi i casi?

Si scriva uno script file in cui si usi in successione, prima il metodo di bisezione (`tol=0.001`) e poi quello di Newton (`tol=1e-12`), utilizzando come valore di innesco del metodo di Newton il valore ottenuto con il metodo di bisezione.

# Problemi di Cauchy

Si considerino i seguenti problemi di Cauchy, che useremo negli esercizi:

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

# Esercizio 6

Si realizzi uno script file che approssimi la soluzione dei problemi di Cauchy (C1) e (C2) utilizzando la function `ode45`.

Si disegnino nella stessa figura il grafico della soluzione esatta e di quella approssimata.

Si calcoli la norma infinito della differenza tra la soluzione esatta ed approssimata nei nodi \(t_n\), \(n=0,\ldots,N\).

# Esercizi di riepilogo

## Esercizio 1

Si consideri la funzione

$$
f(x)=x-\frac{1}{\sin(x)+2}.
$$

1. Si approssimi la radice \(\alpha\) di \(f\) nell'intervallo \([0,5]\) utilizzando la function di Matlab `fzero`.

   $$
   \text{SOL}=0.415961353241024
   $$

2. Si approssimi la radice \(\alpha\) di \(f\) nell'intervallo \([0,5]\) utilizzando il metodo di bisezione con tolleranza \(10^{-8}\).

   $$
   \text{SOL}=0.415961353241024,\qquad \text{NIT}=29
   $$

3. Si approssimi la radice \(\alpha\) di \(f\) nell'intervallo \([0,5]\) utilizzando il metodo di Newton con tolleranza \(10^{-8}\) e numero massimo di iterazioni 200, a partire dal punto iniziale \(x_0=2\).

   $$
   \text{SOL}=0.415961353241024,\qquad \text{NIT}=5
   $$

4. Considerando come soluzione esatta la radice trovata con `fzero`, calcolare gli errori di approssimazione commessi utilizzando gli altri due metodi.

   $$
   \text{err(bis)}=7.317843775389576\times10^{-9}
   $$

   $$
   \text{err(New)}=5.551115123125783\times10^{-17}
   $$

## Esercizio 2

Si consideri la funzione

$$
f(x)=2x^2-\frac{1}{\cos(x^2)+3}.
$$

1. Si approssimi la radice \(\alpha\) nell'intervallo \([0,5]\) utilizzando la function di Matlab `fzero`.

   $$
   \text{SOL}=0.353900070161445
   $$

2. Si utilizzi il metodo di bisezione nell'intervallo \([0,5]\) con tolleranza \(10^{-2}\) per determinare il punto iniziale \(x_0\) da passare come valore di innesco al metodo di Newton per approssimare la radice \(\alpha\) di \(f\) nell'intervallo \([0,5]\).

   Si scelga per il metodo di Newton tolleranza \(10^{-6}\) e numero massimo di iterazioni 200. Sia \(\tilde{\alpha}\) l'approssimazione calcolata.

   $$
   \text{bisez}=0.361328125000000,\qquad \text{NIT}=9
   $$

   $$
   \text{Newton}=0.353900070161445,\qquad \text{NIT}=3
   $$

3. Considerando come soluzione esatta \(\alpha\) la radice trovata con `fzero`, calcolare l'errore di approssimazione commesso:

$$
|\alpha-\tilde{\alpha}|.
$$

$$
\text{err(New)}=1.110223024625157\times10^{-16}
$$

## Esercizio 3

Si consideri il problema di Cauchy

$$
\begin{cases}
y'=(\cos(2\pi t)-4t^2)y, & 0\leq t\leq5,\\
y(0)=4.
\end{cases}
$$

La cui soluzione esatta è

$$
y(t)=4\exp\left(
\frac{1}{2\pi}\sin(2\pi t)-\frac{4}{3}t^3
\right).
$$

1. Si approssimi il problema di Cauchy nell'intervallo \([0,5]\) utilizzando la function Matlab `ode45`.

   Sia \(T\) il vettore degli istanti temporali fornito da `ode45` e sia \(Y\) il vettore contenente la soluzione approssimata a tali istanti.

   Si calcoli l'errore relativo in norma infinito `err` tra la soluzione approssimata e quella esatta e il valore massimo (`Ymax`) assunto dalla soluzione approssimata \(Y\).

   $$
   \text{Ymax}=4.6049\times10^{0}
   $$

   $$
   \text{err}=1.1850\times10^{-3}
   $$

2. Si approssimi l'integrale

$$
I=\int_0^5 y(t)\,dt,
$$

dove \(y(t)\) è la soluzione esatta del problema di Cauchy sopra definito, utilizzando la formula di quadratura dei trapezi composita.

A tale scopo si utilizzino le coppie di valori \(T,Y\) calcolati al punto precedente.

Si denoti con \(I_t\) il valore calcolato.

Si calcolino inoltre il valore \(I_e\), ottenuto approssimando l'integrale \(I\) con la function `integral` di Matlab, e l'errore relativo `errI` tra \(I_t\) e \(I_e\), prendendo \(I_e\) come valore esatto.

Si riportino \(I_t\) e `errI` in `format short e`.

$$
I_t=3.3597\times10^{0}
$$

$$
\text{errI}=5.0312\times10^{-3}.
$$
