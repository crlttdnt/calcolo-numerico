# [Tema 11/02/2025] Punto di massimo di una funzione (Newton sulla derivata prima)

## Testo originale (per cercarlo)
> Si consideri f(x) = sin(x) + e^(-x), x∈[0,2]. Per determinare il punto di
> massimo relativo di f nell'intervallo [0,2] si calcoli la radice della sua
> derivata prima f'(x) utilizzando il metodo di Newton a partire da
> x0=1.5, tolleranza 1e-6, numero massimo di iterazioni 100. Sia xmax il
> risultato, si valuti f(xmax).

**Parole chiave**: punto di massimo/minimo di una funzione, derivata prima,
derivata seconda, metodo di Newton applicato alla derivata (non alla
funzione).

## Soluzione

```matlab
f = @(x) sin(x) + exp(-x);

df = @(x) cos(x) - exp(-x);
ddf = @(x) - sin(x) + exp(-x);
x0 = 1.5;
toll = 1e-6;
nitmax = 100;
xmax = newton(df, ddf, x0, toll, nitmax)
fxmax = f(xmax)
```

## Spiegazione riga per riga

Questo è un caso particolare, concettualmente diverso da "trovare lo zero di
f" — è il primo esempio raccolto finora di **usare Newton per trovare un
massimo/minimo** invece che uno zero diretto della funzione.

- **L'idea matematica**: nei punti di massimo o minimo di una funzione, la
  sua derivata prima si annulla (`f'(x)=0`). Quindi "trovare il massimo di
  f" equivale a "trovare lo zero di f'".
- `df = @(x) ...` → qui `df` **non è la derivata usata come argomento per
  Newton come al solito** — è proprio la funzione di cui vogliamo trovare lo
  zero (perché il "problema" che risolviamo è `f'(x)=0`, non `f(x)=0`).
- `ddf = @(x) ...` → di conseguenza, la funzione che Newton usa come
  "derivata" nel suo algoritmo è la **derivata seconda** di `f` (cioè la
  derivata di `df`), non la derivata prima. Segui bene questo scalino:
  Newton, per trovare lo zero di una funzione `g`, ha sempre bisogno di
  `g'`. Qui `g = df` (cioè `f'`), quindi serve `g' = ddf` (cioè `f''`).
- `newton(df, ddf, x0, toll, nitmax)` → stessa funzione custom di sempre,
  ma applicata a `df` (non a `f`) come "funzione di cui cercare lo zero", e
  a `ddf` come sua derivata.
- `fxmax = f(xmax)` → una volta trovato il punto `xmax` (dove `f'=0`), si
  valuta la funzione originale `f` in quel punto per ottenere il valore del
  massimo — questo passaggio finale torna a usare `f`, non `df`.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione `f` | ricalcoli a mano sia `f'` (`df`) sia `f''` (`ddf`) |
| punto iniziale, tolleranza, iterazioni | `x0`, `toll`, `nitmax` |
| chiede un punto di minimo invece di massimo | il procedimento è identico — cambia solo l'interpretazione del risultato, non il codice |
| chiede di verificare che sia un massimo (non un minimo) | dovresti controllare il segno di `ddf(xmax)`: negativo = massimo, positivo = minimo (non richiesto in questo tema, ma utile saperlo) |

**Il punto da non confondere**: quando l'esercizio chiede un
massimo/minimo, la "funzione di cui trovare lo zero" per Newton è la
**derivata** della funzione originale, e la "derivata" da passare a Newton
è la **derivata seconda**. Se applichi lo schema standard usando `f` e `f'`
direttamente, trovi uno zero di `f`, non un massimo — sbagliato.
