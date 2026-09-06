# [Tema 21/06/2024] Jacobi (variante: un solo output, errore assoluto)

## Testo originale (per cercarlo)
> Si risolva il sistema lineare con il metodo iterativo di Jacobi a partire
> dal vettore iniziale di tutti zeri, tolleranza 1e-6, numero massimo
> d'iterazioni 100. Si valuti l'errore assoluto ||xJ - x||∞, dove x è la
> soluzione calcolata al passo precedente (con LU).

*(Nota: `A`, `b`, `x` sono definiti negli esercizi collegati — vedi
`argomenti/sistemi-lineari/2024-06-21_matrice-decrescente-autovalore-minimo.md`
e
`argomenti/sistemi-lineari/2024-06-21_fattorizzazione-lu-sostituzioni.md`.)*

**Parole chiave**: metodo di Jacobi, errore assoluto (non relativo),
confronto con soluzione da LU invece che da `\`.

## Soluzione

```matlab
x0 = zeros(N, 1);
toll = 1e-6;
maxit = 100;
xj = jacobi(A, b, x0, toll, maxit);
diffnorm = norm(xj - x, inf)
```

## Spiegazione

Stessa funzione `jacobi` già vista nel tema di novembre 2024 (vedi
`argomenti/sistemi-lineari/2024-11-04_metodo-iterativo-jacobi.md`), con due
differenze da notare:

- **Qui si usa un solo output**: `xj = jacobi(...)`, mentre nell'altro tema
  si prendevano due output insieme, `[xj, nitj] = jacobi(...)`, per avere
  anche il numero di iterazioni. La funzione è la stessa: se il testo non
  chiede il numero di iterazioni, semplicemente non lo richiedi (MATLAB
  permette di ignorare gli output aggiuntivi di una funzione).
- **L'errore qui è assoluto**, non relativo: `norm(xj - x, inf)` senza
  dividere per `norm(x, inf)` — confronta sempre cosa chiede esattamente il
  testo (assoluto vs relativo), è un dettaglio facile da perdere sotto
  stress.
- **Il confronto è con `x` calcolato via LU**, non con `A\b` direttamente
  (anche se numericamente sono la stessa soluzione) — usa la variabile che
  hai effettivamente già calcolato nello script, invece di ricalcolarla da
  zero.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| chiede anche il numero di iterazioni | `[xj, nitj] = jacobi(...)` |
| chiede l'errore relativo | dividi per `norm(x, inf)` |
| il vettore/tolleranza/iterazioni di partenza | `x0`, `toll`, `maxit` |
