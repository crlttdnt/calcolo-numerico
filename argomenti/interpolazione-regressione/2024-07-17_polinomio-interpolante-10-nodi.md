# [Tema 17/07/2024] Polinomio interpolante su 10 nodi, valutazione ed errore

## Testo originale (per cercarlo)
> Si consideri la funzione f(x) = e^cos(x) / (x²+1) nell'intervallo [0,1].
> Calcolare il polinomio p che interpola f in 10 nodi equispaziati
> nell'intervallo [0,1]. Valutare p nel punto medio dell'intervallo xm. Sia
> z=linspace(a,b,100) calcolare l'errore commesso approssimando f con p.

**Parole chiave**: polinomio interpolante, 10 nodi, punto medio
dell'intervallo, errore massimo di approssimazione.

## Soluzione

```matlab
f = @(x) (exp(cos(x))) ./ (x.^2 + 1);
a = 0;
b = 1;

x = linspace(a, b, 10);
y = f(x);
p = polyfit(x, y, 9);
xm = (a+b)/2;
pxm = polyval(p, xm)
z = linspace(a,b, 100);
maxerr = max(abs(f(z) - polyval(p, z)))
```

## Spiegazione riga per riga

Stesso schema già visto più volte (vedi
`argomenti/interpolazione-regressione/2024-09-13_polyfit-polyval.md`), qui
con 10 nodi invece di 5 o 6:

- `x = linspace(a,b,10)` → i 10 nodi equispaziati richiesti.
- `p = polyfit(x, y, 9)` → grado `9` perché con 10 punti serve grado
  `10-1=9` per interpolare esattamente (stessa regola di sempre: grado =
  numero di punti meno 1).
- `xm = (a+b)/2` → il punto medio dell'intervallo, calcolato esplicitamente
  invece di scriverlo come numero fisso — comodo se cambia l'intervallo.
- `polyval(p, xm)` → il polinomio valutato lì.
- `z = linspace(a,b,100)` e `maxerr = max(abs(f(z)-polyval(p,z)))` → griglia
  fitta ed errore massimo, identico a tutti gli altri esercizi di questo
  tipo.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione o l'intervallo | `f`, `a`, `b` |
| il numero di nodi | il terzo argomento di `linspace` **e** il grado in `polyfit` (sempre `n-1`) |
| il punto di valutazione | non serve calcolarlo come punto medio se il testo dà un valore specifico — sostituisci `xm` con quel numero |
