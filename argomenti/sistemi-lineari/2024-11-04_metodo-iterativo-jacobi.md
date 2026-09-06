# [Tema 04/11/2024] Risoluzione di un sistema lineare con il metodo di Jacobi

## Testo originale (per cercarlo)
> Sia b = ones(N,1), fissati x0 = zeros(N,1), toll = 1e-6, nitmax = 200,
> risolvere il sistema Ax=b con il metodo di Jacobi e riportare il numero
> di iterazioni effettuate. Calcolare l'errore relativo commesso in norma
> infinito, prendendo come esatta la soluzione xe calcolata con `\`.

*(Nota: `A`, `N` sono definiti nell'esercizio sulla matrice strutturata —
vedi
`argomenti/sistemi-lineari/2024-11-04_matrice-strutturata-det-inv-condizionamento.md`.)*

**Parole chiave**: metodo iterativo di Jacobi, `jacobi`, numero di
iterazioni, tolleranza, errore relativo, confronto con `\`.

## Soluzione

```matlab
b = ones(N, 1);
x0 = zeros(N, 1);
toll = 1e-6;
nitmax = 200;
[xj, nitj] = jacobi(A, b, x0, toll, nitmax);
nitj
xe = A \ b;
relerr = norm(xj-xe, inf) / norm(xe, inf)
```

## Spiegazione riga per riga

- `b = ones(N,1)`, `x0 = zeros(N,1)` → il termine noto e il punto di
  partenza dell'iterazione, dati dal testo.
- `toll`, `nitmax` → criteri di arresto, stesso concetto già visto per
  Newton/Eulero implicito: il metodo si ferma quando è abbastanza vicino
  alla soluzione, o dopo un numero massimo di tentativi.
- `[xj, nitj] = jacobi(A, b, x0, toll, nitmax)` → funzione **custom** dalla
  cartella `lib`, mai vista nei temi raccolti finora: implementa il metodo
  iterativo di Jacobi. Da notare che restituisce **due valori insieme**:
  `xj` (la soluzione approssimata) e `nitj` (il numero di iterazioni
  effettivamente svolte prima di fermarsi) — quando una funzione MATLAB
  restituisce più output, si scrivono entrambi tra parentesi quadre a
  sinistra dell'`=`, separati da virgola.
- `xe = A \ b` → la soluzione "esatta" di riferimento, calcolata con
  l'operatore diretto già visto in molti altri esercizi.
- `relerr = norm(xj-xe, inf) / norm(xe, inf)` → l'**errore relativo** (non
  assoluto): si divide l'errore per la norma della soluzione di riferimento,
  stesso schema già visto per l'errore relativo di Heun nel tema di giugno
  2025 (vedi
  `argomenti/equazioni-differenziali/2025-06-18_heun-tabella-errori-ordine.md`).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la matrice `A` o il termine noto `b` | dipendono da come sono definiti nell'esercizio precedente |
| punto di partenza, tolleranza, iterazioni massime | `x0`, `toll`, `nitmax` |
| chiede Gauss-Seidel invece di Jacobi | usi una funzione diversa dalla cartella `lib` (es. `gaussseidel(...)`), con probabilmente la stessa firma di `jacobi` |
| chiede l'errore assoluto invece che relativo | togli la divisione per `norm(xe, inf)` |

**Promemoria**: `jacobi.m` è una funzione **nuova** da aggiungere in
`lib/`, insieme a tutte le altre viste finora (`newton`, `heun`,
`bisezione`, `eulero`, `eulimp`, `simpsc`). Se il corso tratta anche
Gauss-Seidel o altri metodi iterativi, conviene avere pronte anche quelle
funzioni prima dell'esame.
