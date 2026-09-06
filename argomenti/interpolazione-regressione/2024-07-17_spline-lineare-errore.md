# [Tema 17/07/2024] Spline lineare, valutazione ed errore rispetto alla funzione

## Testo originale (per cercarlo)
> Calcolare la spline lineare s1 interpolante f in 10 nodi equispaziati
> nell'intervallo [0,1]. Valutare tale spline nel punto medio
> dell'intervallo xm. Calcolare l'errore commesso approssimando f con s1.

*(Nota: `f`, `a`, `b`, `x`, `y`, `xm`, `z` sono definiti nell'esercizio sul
polinomio interpolante — vedi
`argomenti/interpolazione-regressione/2024-07-17_polinomio-interpolante-10-nodi.md`,
sono gli stessi 10 nodi.)*

**Parole chiave**: spline lineare, `griddedInterpolant`, errore massimo di
approssimazione (a differenza degli altri esercizi con spline, qui si
calcola anche l'errore, non solo il valore in un punto).

## Soluzione

```matlab
s1 = griddedInterpolant(x, y, 'linear');
s1xm = s1(xm)
maxerr = max(abs(f(z) - s1(z)))
```

## Spiegazione riga per riga

- `griddedInterpolant(x, y, 'linear')` → costruisce la spline lineare sugli
  stessi 10 nodi `(x,y)` già usati per il polinomio — stesso comando visto
  nel tema di giugno 2025 (vedi
  `argomenti/interpolazione-regressione/2025-06-18_spline-lineare.md`).
- `s1(xm)` → valuta la spline nel punto medio.
- `maxerr = max(abs(f(z) - s1(z)))` → la parte nuova rispetto agli altri
  esercizi sulle spline: qui si chiede anche l'**errore massimo**, calcolato
  esattamente come per il polinomio interpolante (stessa griglia fitta `z`,
  stesso schema `max(abs(vero - approssimato))`) — nota come `s1` si possa
  valutare su un intero vettore `z` in un colpo solo, proprio come farebbe
  `polyval`.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| i nodi di partenza | dipende da dove sono definiti `x`, `y` nell'esercizio collegato |
| il punto di valutazione | l'argomento di `s1(...)` |
| spline cubica invece che lineare | cambi `'linear'` in `'spline'`/`'cubic'`, il resto (valutazione, errore) resta identico |

**Concetto chiave**: confrontando questo esercizio con quello sul polinomio
interpolante, si vede che **polinomio e spline si trattano allo stesso
modo**: si costruiscono con un comando diverso (`polyfit` vs
`griddedInterpolant`), ma poi si valutano e si misura l'errore esattamente
con lo stesso schema (`polyval`/chiamata diretta + `max(abs(f(z)-...(z)))`).
