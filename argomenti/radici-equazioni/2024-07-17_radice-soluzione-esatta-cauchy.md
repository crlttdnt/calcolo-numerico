# [Tema 17/07/2024] Radice della soluzione esatta di un problema di Cauchy

## Testo originale (per cercarlo)
> Si approssimi la radice della funzione y(t) definita dalla soluzione
> esatta del problema di Cauchy precedente, utilizzando il metodo di Newton
> a partire da t0=1, tolleranza toll=1e-6 e numero massimo iterazioni
> nitmax=100. Si calcoli la stessa radice α con la funzione predefinita di
> Matlab.

*(Nota: `y` (soluzione esatta), `t0`, `tmax` sono definiti nell'esercizio su
Eulero implicito — vedi
`argomenti/equazioni-differenziali/2024-07-17_eulero-implicito.md`. Qui `y`
non è più usata come "soluzione approssimata da confrontare", ma trattata
come una qualsiasi funzione di cui cercare lo zero.)*

**Parole chiave**: radice/zero di una funzione, metodo di Newton, `fzero`,
funzione che è essa stessa una soluzione di un problema di Cauchy.

## Soluzione

```matlab
t0 = 1;
toll = 1e-6;
nitmax = 100;
dy = @(t) 1.*log(t) + t.*(1./t);
alphaN = newton(y, dy, t0, toll, nitmax)
alpha = fzero(y, [t0 tmax])
```

## Spiegazione riga per riga

Questo esercizio è concettualmente identico al primo esercizio sulle radici
visto nel tema di settembre (vedi
`argomenti/radici-equazioni/2024-09-13_grafico-zero-newton.md`) — cambia
solo **su quale funzione** si cerca lo zero: qui non è una funzione data
esplicitamente dal testo come `f(x)=...`, ma è `y(t)`, la soluzione esatta
del problema di Cauchy dell'esercizio precedente, già definita come funzione
anonima lì.

- `dy = @(t) ...` → la derivata di `y(t) = t·log(t) - 1`, calcolata a mano
  (regola del prodotto: derivata di `t·log(t)` è `log(t) + t·(1/t)`, e la
  derivata di `-1` è zero).
- `newton(y, dy, t0, toll, nitmax)` → stessa funzione custom vista altrove,
  qui applicata a `y` invece che a una `f` generica.
- `fzero(y, [t0 tmax])` → stesso comando predefinito di sempre, con
  `[t0 tmax]` come intervallo di ricerca (qui riusa i valori già definiti per
  il problema di Cauchy, che formano comunque un intervallo valido in cui
  cercare la radice).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione di cui cercare la radice | se è la soluzione esatta di un Cauchy, riprendi la sua definizione dall'esercizio collegato; ricalcoli comunque `dy` a mano |
| punto iniziale, tolleranza, iterazioni | `t0`, `toll`, `nitmax` |
| l'intervallo per `fzero` | i due estremi passati a `fzero(y, [...])` |

**Concetto chiave**: non lasciarti confondere dal fatto che la funzione si
chiami `y` invece di `f` — per MATLAB è comunque solo una funzione anonima
come un'altra; `newton` e `fzero` non sanno né gli interessa che `y`
"rappresenti" la soluzione di un'equazione differenziale.
