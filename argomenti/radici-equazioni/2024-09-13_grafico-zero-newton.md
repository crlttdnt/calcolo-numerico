# [Tema 13/09/2024] Grafico di una funzione + ricerca di uno zero (fzero e Newton)

## Testo originale (per cercarlo)
> Siano a = 2 e b = 3, tracciare il grafico della seguente funzione
> nell'intervallo [a, b]: f(x) = −log(x)·cos(x) − 0.5
>
> Approssimare, usando l'apposita funzione di Matlab, la radice α di f
> nell'intervallo assegnato. Determinare la stessa radice utilizzando il
> metodo di Newton a partire dal punto iniziale x0 = 2 con tolleranza
> toll = 1e-5 e numero massimo di iterazioni 100. Indicato con αN il valore
> calcolato con il metodo di Newton si determini l'errore tra i due valori
> ottenuti.

**Parole chiave**: grafico funzione, zero/radice di una funzione, `fzero`,
metodo di Newton, tolleranza, iterazioni massime, derivata.

## Soluzione

```matlab
clc; clear; format short e;
hold on;

a = 2;
b = 3;
f = @(x) -log(x) .* cos(x) - 0.5;
zs = linspace(a, b, 100);
plot(zs, f(zs))

alpha = fzero(f, [a b])

x0 = 2;
toll = 1e-5;
nitmax = 100;
df = @(x) - ((1./x) .* cos(x) + log(x) .* -sin(x));
alphaN = newton(f, df, x0, toll, nitmax)
err = abs(alphaN - alpha)
```

## Spiegazione riga per riga

- `format short e` → il testo chiede i risultati in questo formato: mettilo
  sempre se richiesto esplicitamente.
- `hold on` → dice a MATLAB "se disegno altri grafici dopo, sovrapponili
  invece di cancellare questo". Utile se più avanti nello stesso esercizio
  disegni anche un polinomio o una retta sullo stesso grafico.
- `f = @(x) ...` → crea una **funzione anonima**: da qui in poi `f(3)` o
  `f(vettore)` calcola la formula. I punti in `.*` servono per applicare la
  formula a un intero vettore di punti insieme, non solo a un numero.
- `linspace(a,b,100)` + `plot(zs, f(zs))` → genera 100 punti tra a e b solo
  per disegnare una curva liscia; non ha altro scopo che il grafico.
- `fzero(f, [a b])` → comando **predefinito** di MATLAB: trova da solo lo
  zero di `f` dentro l'intervallo dato (funziona se la funzione cambia segno
  tra `a` e `b`). Non serve sapere come funziona dentro, solo come chiamarlo.
- `x0`, `toll`, `nitmax` → dati direttamente dal testo: punto di partenza,
  soglia di precisione, numero massimo di tentativi del metodo di Newton.
- `df = @(x) ...` → è la **derivata di f, calcolata a mano**. MATLAB non la
  calcola da solo in questo contesto: ogni volta che cambia `f`, devi
  ricalcolare `df` con le regole di derivazione (qui: derivata di un
  prodotto, di `log`, di `cos`).
- `newton(f, df, x0, toll, nitmax)` → funzione **custom** (non di MATLAB),
  presa dalla cartella `lib`. Le passi funzione, derivata, punto iniziale,
  tolleranza, iterazioni massime; restituisce la radice approssimata.
- `err = abs(alphaN - alpha)` → semplice differenza tra le due radici
  trovate, per verificare che i due metodi siano coerenti.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la formula della funzione | `f = @(x) ...` **e** ricalcoli a mano `df` |
| l'intervallo | `a`, `b` |
| il punto iniziale di Newton | `x0` |
| tolleranza / iterazioni massime | `toll`, `nitmax` |
| non chiede il grafico | salti le righe `hold on`, `plot(...)` |
| non chiede il confronto con `fzero` | salti solo quella riga, il resto resta uguale |

**Attenzione**: l'unico punto che non è "copia e adatta" è la derivata `df`
— va ricalcolata a mano ogni volta che cambia `f`. È l'errore più comune.
