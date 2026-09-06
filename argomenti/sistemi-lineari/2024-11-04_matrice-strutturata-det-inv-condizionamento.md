# [Tema 04/11/2024] Matrice strutturata: determinante, inversa, condizionamento

## Testo originale (per cercarlo)
> Dato N=20, costruire la matrice A di dimensione N×N avente come soli
> elementi non nulli quelli della diagonale principale uguali a √N, quelli
> della prima sopradiagonale uguali a 2, quelli della seconda
> sottodiagonale uguali a −2 e A(1,N)=A(N,1)=1. Calcolare il determinante
> di A, la sua inversa, ed il prodotto ||A||∞·||A⁻¹||∞ (condizionamento
> della matrice in norma infinito).

**Parole chiave**: matrice a diagonali, `diag`, elementi negli angoli
opposti di una matrice (non su una diagonale), determinante, inversa,
norma infinito di una matrice, condizionamento.

## Soluzione

```matlab
N = 20;
A = sqrt(N)*diag(ones(N, 1)) + 2*diag(ones(N-1, 1), 1) - 2*diag(ones(N-2, 1), -2) + diag(1, N-1) + diag(1, -N+1);
detA = det(A)
invA = inv(A);
cond = norm(A, inf) * norm(invA, inf)
```

## Spiegazione riga per riga

- `sqrt(N)*diag(ones(N,1))` → la diagonale principale, tutta uguale a `√N`
  (schema già visto: `diag(ones(n,1))` dà l'identità, moltiplicata per uno
  scalare dà quel valore ripetuto sulla diagonale).
- `2*diag(ones(N-1,1), 1)` → la prima sopradiagonale (offset `+1`), tutta
  uguale a `2`.
- `-2*diag(ones(N-2,1), -2)` → la **seconda** sottodiagonale (offset `-2`,
  non `-1`!): nota che il vettore ha lunghezza `N-2`, non `N-1`, perché più
  ti allontani dalla diagonale principale, più corta è quella diagonale
  (offset `k` → lunghezza `N-|k|`).
- `diag(1, N-1)` e `diag(1, -N+1)` → la parte davvero nuova di questo
  esercizio: per mettere un singolo valore `1` negli **angoli opposti**
  della matrice (posizioni `(1,N)` e `(N,1)`), si usa `diag` con un vettore
  di un solo elemento (`1`) e un offset molto grande: l'offset `N-1` porta
  quell'unico elemento nell'angolo in alto a destra (posizione `(1,N)`),
  l'offset `-(N-1)` nell'angolo in basso a sinistra (posizione `(N,1)`).
  Tutti questi pezzi si sommano perché occupano posizioni diverse della
  matrice (nessuna sovrapposizione).
- `det(A)`, `inv(A)` → comandi predefiniti standard, niente di nuovo.
- `norm(A, inf) * norm(invA, inf)` → il **condizionamento** di una matrice:
  è semplicemente il prodotto della norma della matrice per la norma della
  sua inversa. Un condizionamento molto grande segnala che il sistema
  `Ax=b` è "sensibile" a piccoli errori nei dati (matrice mal condizionata).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| dimensione della matrice | `N` |
| i valori sulle diagonali | i coefficienti moltiplicativi davanti a ciascun `diag(...)` |
| quali diagonali sono non nulle (offset diversi) | il secondo argomento di ciascun `diag(vettore, offset)` |
| valori in posizioni "isolate" diverse dagli angoli | stesso trucco `diag(valore, offset)`, con l'offset giusto per la posizione richiesta |
| chiede la norma 1 invece che infinito | `norm(A, 1)` invece di `norm(A, inf)` |

**Concetto chiave riutilizzabile**: `diag(valore_scalare, offset)` mette un
singolo valore in una posizione precisa lontana dalla diagonale principale —
utile ogni volta che il testo chiede "elementi isolati" in posizioni
specifiche di una matrice, non solo per gli angoli.
