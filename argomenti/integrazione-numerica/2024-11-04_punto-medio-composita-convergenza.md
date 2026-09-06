# [Tema 04/11/2024] Formula del punto medio composita e verifica dell'ordine per dimezzamento

## Testo originale (per cercarlo)
> Si approssimi l'integrale della soluzione esatta, utilizzando la funzione
> predefinita di Matlab, sia I il valore calcolato. Si approssimi lo stesso
> integrale con la formula di quadratura del punto medio due volte: prima
> con 20 sottointervalli, poi con 40 (il doppio). Siano Ip20, Ip40 i due
> valori. Si calcoli il rapporto tra gli errori |Ip20-I|/|Ip40-I|.

*(Nota: `sol` (soluzione esatta) è definita nell'esercizio su Eulero
implicito — vedi
`argomenti/equazioni-differenziali/2024-11-04_eulero-implicito-ymax.md`.)*

**Parole chiave**: integrale, formula di quadratura del punto medio
composita, `pmedc`, raddoppiare il numero di sottointervalli, rapporto tra
errori, verifica dell'ordine di convergenza per dimezzamento del passo.

## Soluzione

```matlab
I = integral(sol, 0, 1)
Ip20 = pmedc(0, 1, 20, sol)
Ip40 = pmedc(0, 1, 40, sol)
rapp = abs(Ip20 - I) / abs(Ip40 - I)
```

## Spiegazione riga per riga

- `I = integral(sol, 0, 1)` → l'integrale "vero", schema standard di
  sempre.
- `pmedc(0, 1, 20, sol)` → funzione **custom** dalla cartella `lib`, mai
  vista nei temi raccolti finora: implementa la formula di quadratura del
  **punto medio composita** (un altro modo di approssimare un integrale,
  diverso sia dai trapezi che da Simpson). Stessa "firma" di `simpsc`:
  estremi, numero di sottointervalli, funzione.
- `pmedc(0, 1, 40, sol)` → stesso calcolo ma con il doppio dei
  sottointervalli (più punti = approssimazione più precisa).
- `rapp = abs(Ip20-I) / abs(Ip40-I)` → il rapporto tra i due errori. Questo
  è concettualmente imparentato con la stima dell'**ordine di convergenza**
  vista nel tema di giugno 2025 (vedi
  `argomenti/equazioni-differenziali/2025-06-18_heun-tabella-errori-ordine.md`),
  ma qui si procede in modo più diretto: se un metodo ha ordine `p`, quando
  dimezzi il passo (o raddoppi i sottointervalli) l'errore si riduce di un
  fattore `2^p`. Quindi questo rapporto dovrebbe risultare vicino a `2^p`
  (per la formula del punto medio, che ha ordine 2, ci si aspetta un
  rapporto vicino a 4).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione o l'intervallo | argomenti di `integral(...)` e `pmedc(...)` |
| il numero di sottointervalli richiesti | il terzo argomento di `pmedc(...)` |
| chiede la formula dei trapezi o di Simpson invece del punto medio | usi `trapz`/`simpsc` invece di `pmedc`, la logica del rapporto tra errori resta identica |
| chiede di dedurre l'ordine dal rapporto, non solo di calcolarlo | ricorda: rapporto ≈ `2^p` → `p ≈ log2(rapporto)` |

**Concetto chiave**: questo esercizio e quello sull'ordine di convergenza di
Heun (giugno 2025) misurano la stessa cosa concettuale — quanto velocemente
un metodo migliora se lo "raffini" — ma con due tecniche diverse: qui un
singolo rapporto tra due errori con passi diversi; là una regressione su più
punti in scala logaritmica. Usa quella che il testo chiede esplicitamente.

**Promemoria**: `pmedc.m` è una funzione **nuova** da aggiungere in `lib/`,
insieme a `simpsc.m`, `jacobi.m` e tutte le altre già raccolte.
