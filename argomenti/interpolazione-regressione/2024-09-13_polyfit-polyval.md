# [Tema 13/09/2024] Polinomio interpolante e retta di regressione

## Testo originale (per cercarlo)
> Calcolare il polinomio p che interpola f in 5 nodi equispaziati
> nell'intervallo [a, b]. Valutare p nel punto medio dell'intervallo xm. Sia
> z=linspace(a,b,100) calcolare l'errore commesso approssimando f con p nei
> punti assegnati.
>
> Calcolare la retta di regressione r interpolante f in 5 nodi equispaziati
> nell'intervallo [a, b]. Valutare tale retta nel punto medio dell'intervallo
> xm. Calcolare l'errore commesso approssimando f con r.

**Parole chiave**: interpolazione, polinomio interpolante, nodi equispaziati,
`polyfit`, `polyval`, retta di regressione, minimi quadrati, errore massimo.

*(Nota: `a`, `b`, `f` sono definiti nella parte dell'esercizio sulle radici —
vedi `argomenti/radici-equazioni/2024-09-13_grafico-zero-newton.md`, sono la
stessa funzione e lo stesso intervallo.)*

## Soluzione

```matlab
N = 5;
x = linspace(a, b, N);
y = f(x);
p = polyfit(x, y, N-1);
pxm = polyval(p, (a+b)/2)
z = linspace(a, b, 100);
err2 = max(abs(f(z) - polyval(p, z)))

r = polyfit(x, y, 1);
rxm = polyval(r, (a+b)/2)
err3 = max(abs(f(z) - polyval(r, z)))
```

## Spiegazione riga per riga

- `x = linspace(a,b,N)` → genera gli `N` nodi equispaziati richiesti.
- `y = f(x)` → calcola la funzione vera in quei nodi (serve `f` già
  definita).
- `polyfit(x, y, N-1)` → calcola i coefficienti del polinomio che passa
  **esattamente** per tutti gli `N` punti. **Regola da ricordare**: per
  interpolare esattamente `N` punti serve grado `N-1`.
- `polyval(p, valore)` → valuta il polinomio `p` in un punto specifico (qui
  il punto medio dell'intervallo).
- `z = linspace(a,b,100)` → una griglia più fitta di punti, usata solo per
  misurare l'errore su tanti punti diversi da quelli usati per costruire il
  polinomio.
- `err2 = max(abs(f(z) - polyval(p,z)))` → calcola la differenza tra
  funzione vera e polinomio in tutti i 100 punti di `z`, poi prende la più
  grande (l'errore nel punto peggiore).
- `r = polyfit(x, y, 1)` → **stesso comando** di prima, ma grado `1`: un
  polinomio di grado 1 è una retta. Con 5 punti e grado 1 la retta non può
  passare esattamente per tutti (troppi vincoli per una retta) — trova
  quella che li approssima meglio possibile: è la retta di **regressione**.
- Il resto (`polyval`, calcolo errore) è identico a prima.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| numero di nodi | `N` — il grado in `polyfit` per l'interpolazione resta sempre `N-1` |
| chiede una parabola di regressione invece di una retta | grado `2` invece di `1` nel secondo `polyfit` |
| chiede di valutare in un punto diverso dal punto medio | cambi l'argomento di `polyval`, non la logica |
| chiede l'errore su nodi diversi da quelli in `z` | cambi solo il vettore su cui applichi `max(abs(...))` |

**Concetto chiave**: interpolazione (passa esattamente per i punti) e
regressione (approssima al meglio, senza passarci esattamente) si fanno con
lo **stesso comando** `polyfit`/`polyval` — cambia solo il grado del
polinomio che chiedi.
