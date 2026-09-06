# [Tema 21/06/2024] Matrice con diagonale a valori decrescenti, autovalore minimo, determinante

## Testo originale (per cercarlo)
> Sia N=20, costruire la matrice A avente come soli elementi non nulli
> quelli della diagonale principale uguali ai primi N numeri naturali
> positivi in ordine decrescente moltiplicati per 10, quelli delle terze
> sopra e sottodiagonali uguali a -2. Sia b il vettore colonna di tutti 1.
> Si calcoli il determinante ed il più piccolo autovalore di A.

**Parole chiave**: diagonale principale non costante (vettore, non uno
scalare ripetuto), numeri decrescenti, terza sopra/sottodiagonale,
autovalore minimo, `eig`, `min`.

## Soluzione

```matlab
N = 20;
A = 10*diag(N:-1:1) - 2*diag(ones(N-3, 1), 3) - 2*diag(ones(N-3, 1), -3)
b = ones(N, 1)

lamdamin = min(eig(A))
detA = det(A)
```

## Spiegazione riga per riga

- `diag(N:-1:1)` → **novità rispetto agli esempi precedenti con `diag`**:
  finora la diagonale era sempre un valore costante ripetuto
  (`diag(k*ones(n,1))`); qui invece `N:-1:1` genera il vettore `[20, 19, 18,
  ..., 1]` (i numeri da N a 1, in ordine decrescente, passo -1), e `diag(...)`
  lo mette sulla diagonale principale — quindi la diagonale non è costante,
  ha valori diversi posizione per posizione. `10*` moltiplica tutto per 10.
- `diag(ones(N-3,1), 3)` e `diag(ones(N-3,1), -3)` → terza sopra e
  sottodiagonale (offset `±3`), con vettore di lunghezza `N-3` (regola già
  vista: offset `k` → lunghezza `N-|k|`).
- `b = ones(N,1)` → il termine noto, tutto a 1.
- `min(eig(A))` → `eig(A)` calcola **tutti** gli autovalori di `A` (un
  vettore); `min(...)` ne prende il più piccolo. Analogo a come `max(abs(eig(...)))`
  dava il raggio spettrale nel tema di novembre 2024 (vedi
  `argomenti/sistemi-lineari/2024-11-04_raggio-spettrale-jacobi.md`) — qui
  invece serve il valore minimo, senza valore assoluto (il testo chiede
  proprio il più piccolo autovalore, che potrebbe anche essere negativo).
- `det(A)` → comando standard.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| i valori sulla diagonale (altra sequenza, altro ordine) | il vettore dentro il primo `diag(...)` — es. `1:N` per crescente, `N:-1:1` per decrescente |
| quali sopra/sottodiagonali sono non nulle | l'offset nei `diag(ones(...), offset)` successivi |
| chiede l'autovalore massimo invece di minimo | `max(eig(A))` invece di `min(eig(A))` |
| chiede il raggio spettrale | `max(abs(eig(A)))` (nota il valore assoluto, assente qui) |
