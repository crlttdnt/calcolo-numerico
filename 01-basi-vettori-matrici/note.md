# Basi: scalari, vettori, matrici

## File in questa cartella
- `intro.m` — espressioni scalari, numeri complessi (Lab 1, Es. 1-3)
- `vectors.m` — creazione vettori, slicing, operazioni base (Lab 1, Es. 4 + recap)
- `lab02.m` — operazioni componente per componente, manipolazione vettori/matrici,
  norme, determinante, rango, funzione `fpcmp` per confronto float (Lab 2)
- `lab02_recap.m` — esercizi di riepilogo su vettori e matrici (Lab 2 recap)

## Mappa comandi → dove cercare

| Devo fare... | Comando chiave | Dove guardare |
|---|---|---|
| Generare un range di numeri | `a:passo:b` | `vectors.m` es. 4 |
| Generare N punti equispaziati | `linspace(a,b,N)` | `vectors.m` es. 4 |
| Radice n-esima reale (anche di negativi) | `nthroot(x,n)` | `intro.m`, `vectors.m` |
| Operazioni elemento-per-elemento su vettori | `.*` `./` `.^` | `lab02.m` inizio |
| Sostituire/rimuovere elementi di un vettore | `v(i)=...`, `v(i)=[]` | `lab02.m` sez. "Exercise 2", `lab02_recap.m` es.1 |
| Concatenare vettori | `[v w]` | `lab02.m` |
| Somma/prodotto/max/min/sort di un vettore | `sum` `prod` `max` `min` `sort` | `lab02.m` |
| Differenze successive | `diff` | `lab02.m` |
| Prodotto scalare, norma | `dot(v,w)`, `norm(v,2)`, `norm(v,inf)` | `lab02.m` |
| Creare matrici, sommarle, trasporle | `[..;..]`, `A+B`, `A'` | `lab02.m` |
| Prodotto matriciale vs elemento-per-elemento | `A*B` vs `A.*B` | `lab02.m` |
| Matrici particolari | `eye(n)` `zeros` `ones` `hilb(n)` | `lab02.m` |
| Estrarre/sostituire sottoblocchi (righe/colonne) | `A(i,:)`, `A(:,j)`, `A(r1:r2,c1:c2)=...` | `lab02.m`, `lab02_recap.m` es.4-5 |
| Eliminare righe/colonne | `A(i,:)=[]`, `A(:,j)=[]` | `lab02.m`, `lab02_recap.m` es.5 |
| Concatenare matrici (blocchi) | `[A B]`, `[A;B]` | `lab02.m` |
| Determinante, rango | `det(A)`, `rank(A)` | `lab02.m` Exercise 7 |
| Confrontare numeri float con tolleranza | funzione custom `fpcmp` | `lab02.m` fondo file |
| Matrice di permutazione (scambia righe/colonne) | costruirla da `eye(n)` riordinando le righe | `lab02_recap.m` es.4 |

## Pattern da adattare (non da imparare a memoria)
- **Scambiare righe/colonne di una matrice**: costruisci `P` come `eye(n)` con le righe
  riordinate, poi `P*A` scambia righe, `A*P` scambia colonne (vedi `lab02_recap.m` es.4).
- **Confronto "quasi uguale" tra float**: mai usare `==` tra risultati di calcoli — usa
  una funzione tipo `fpcmp`/`matrixcmp` con tolleranza (vedi fondo `lab02.m` e
  `metodidiretti.m`).
- **Modificare sottoblocchi**: la sintassi `A(righe, colonne) = valore_o_matrice` è la
  stessa sia per assegnare un blocco sia per azzerarlo con `[]` — cambia solo cosa metti
  a destra dell'`=`.
