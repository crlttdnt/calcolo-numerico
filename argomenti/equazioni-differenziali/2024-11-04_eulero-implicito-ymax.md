# [Tema 04/11/2024] Eulero implicito: valore massimo dell'approssimazione (non finale)

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy y' = y + e^t·cos(t), 0≤t≤1, y(0)=0, la
> cui soluzione esatta è y(t) = e^t·sin(t). Si approssimi con Eulero
> implicito, passo h=0.01 (toll=1e-6, nitmax=100). Si riporti il valore
> massimo assunto dall'approssimazione calcolata Y.

**Parole chiave**: problema di Cauchy, metodo di Eulero implicito, valore
massimo di un vettore (non l'ultimo elemento), derivata parziale costante.

## Soluzione

```matlab
f = @(t, y) y + exp(t).*cos(t);
t0 = 0;
tmax = 1;
y0 = 0;
sol = @(t) exp(t) .* sin(t);

h = 0.01;
toll = 1e-6;
nitmax = 100;
dfy = @(t, y) 1;
T = t0:h:tmax;
[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
Ymax = max(Y)

plot(T, sol(T), T, Y)
legend('Exact', 'EulImp')

norm(sol(T) - Y, inf)
```

## Spiegazione riga per riga

Stessa struttura di Eulero implicito già vista nel tema di luglio 2024 (vedi
`argomenti/equazioni-differenziali/2024-07-17_eulero-implicito.md`), con due
dettagli diversi da notare:

- `dfy = @(t, y) 1` → qui la derivata parziale di `f` rispetto a `y` è
  semplicemente la costante `1`, perché `f(t,y) = y + e^t·cos(t)`: derivando
  rispetto a `y` (trattando `t` come costante), il termine `y` dà `1` e il
  termine `e^t·cos(t)` (che non dipende da `y`) dà `0`. Anche quando la
  derivata è banale come in questo caso, va comunque scritta esplicitamente
  come funzione anonima (anche se costante, deve poter essere "chiamata"
  come una funzione dallo schema interno di `eulimp`).
- `Ymax = max(Y)` → **qui la differenza rispetto agli altri esercizi**: il
  testo non chiede il valore finale (`Y(end)`) ma il valore **più grande**
  raggiunto dall'intera soluzione approssimata lungo tutto l'intervallo —
  serve `max(Y)`, non `Y(end)`. Leggi sempre con attenzione cosa chiede
  esattamente il testo: "valore finale" e "valore massimo" sono richieste
  diverse anche se il codice per arrivarci è quasi identico.

Il resto (grafico di confronto, errore in norma infinito) è identico agli
altri esercizi di Cauchy già visti.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'equazione differenziale | `f = @(t,y) ...` **e** ricalcoli a mano `dfy` |
| chiede il valore finale invece del massimo | usi `Y(end)` invece di `max(Y)` |
| chiede il valore minimo | usi `min(Y)` |
| chiede in quale istante si raggiunge il massimo | usi `[Ymax, idx] = max(Y)` e poi `T(idx)` per l'istante corrispondente |
