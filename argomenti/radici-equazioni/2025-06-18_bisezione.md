# [Tema 18/06/2025] Ricerca di uno zero con il metodo di bisezione

## Testo originale (per cercarlo)
> Si approssimi la radice di f nell'intervallo [2,3] utilizzando il metodo
> di bisezione con tolleranza 1e-6.

*(Nota: `f` è la funzione definita nell'esercizio sulla spline — vedi
`argomenti/interpolazione-regressione/2025-06-18_spline-lineare.md`.)*

**Parole chiave**: metodo di bisezione, zero di una funzione, tolleranza,
alternativa a Newton e a `fzero`.

## Soluzione

```matlab
toll = 1e-6;
res3 = bisezione(f, 2, 3, toll)
```

## Spiegazione riga per riga

- `toll = 1e-6` → la precisione richiesta dal testo, sotto la quale il
  metodo si considera arrivato a convergenza.
- `bisezione(f, 2, 3, toll)` → funzione **custom** (non di MATLAB) dalla
  cartella `lib`, come `newton` e `heun`. Le passi la funzione, i due
  estremi dell'intervallo in cui sai che c'è uno zero (deve valere
  `f(2)` e `f(3)` di segno opposto), e la tolleranza; restituisce lo zero
  approssimato.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione | dipende da dove `f` è definita nell'esercizio collegato |
| l'intervallo di ricerca | i due estremi passati a `bisezione(f, ..., ...)` |
| la tolleranza | `toll` |
| chiede di confrontare con Newton o `fzero` | aggiungi le rispettive righe, come nel tema del 13/09/2024 (vedi `argomenti/radici-equazioni/2024-09-13_grafico-zero-newton.md`) |

**Differenza rispetto a Newton**: la bisezione non richiede la derivata
della funzione (a differenza di Newton) — ti basta sapere che la funzione
cambia segno nell'intervallo dato. È più lenta ma più "sicura" (non richiede
calcoli aggiuntivi a mano).

**Promemoria**: verifica di avere il file `bisezione.m` nella cartella
`lib/` insieme a `newton.m` e `heun.m` — se ti manca, chiedila o scrivila
prima dell'esame.
