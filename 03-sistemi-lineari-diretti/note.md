# Sistemi lineari: metodi diretti (LU, Cholesky)

## File in questa cartella
- `metodidiretti.m` — `\` su sistemi ben posti/singolari, sistemi grandi (a banda),
  fattorizzazione LU con e senza pivoting, riuso della fattorizzazione per calcolare
  l'inversa, fenomeno del fill-in con `spy`, fattorizzazione di Cholesky (Lab 4)
- `metodidiretti2.m` — altri esempi di risoluzione via LU (con pivoting), calcolo
  dell'inversa via LU, Cholesky su matrice diversa (Lab 4, seconda parte)

## Mappa comandi → dove cercare

| Devo fare... | Comando chiave | Dove guardare |
|---|---|---|
| Risolvere Ax=b | `x = A\b` | `metodidiretti.m` es.1 |
| Capire se un sistema non ha soluzione / ne ha infinite | `det(A)`, `rank(A)`, `rank([A b])` | `metodidiretti.m` es.2 |
| Sistema di grandi dimensioni, matrice a banda | costruire A con `eye`/`diag`, poi `\` | `metodidiretti.m` es.3 |
| Fattorizzazione LU (con pivoting) | `[L,U,P] = lu(A)` | `metodidiretti.m` es.4-5 |
| Controllare se è stato fatto pivoting | `isequal(P, eye(n))` | `metodidiretti.m` es.4 |
| Risolvere Ax=b sfruttando LU | `y=L\(P*b); x=U\y;` | `metodidiretti.m` es.4-5, `metodidiretti2.m` es.1-2 |
| Calcolare l'inversa risolvendo n sistemi (colonna per colonna, vettori base ei) | ciclo `for i=1:n` con `ei=zeros(n,1); ei(i)=1;` poi risolvi `A*x=ei` | `metodidiretti.m` es.6, `metodidiretti2.m` es.3 |
| Confrontare tempi di calcolo | `tic ... toc` | `metodidiretti.m` es.6 |
| Vedere gli zeri/non-zeri di una matrice (fill-in) | `spy(A)` (con `subplot` per più matrici affiancate) | `metodidiretti.m` es.7 |
| Fattorizzazione di Cholesky (A simmetrica def. positiva) | `R = chol(A)` (con `A=R'*R`) | `metodidiretti.m` fondo, `metodidiretti2.m` es.5 |
| Risolvere Ax=b via Cholesky | `y=R'\b; x=R\y;` | `metodidiretti.m`, `metodidiretti2.m` es.5 |
| Controllare che A sia simmetrica | `issymmetric(A)` | `metodidiretti.m` |
| Confrontare due matrici/vettori a meno di tolleranza | funzione custom `matcmp`/`matrixcmp` (fondo file) | `metodidiretti.m`, `metodidiretti2.m` |

## Pattern da adattare (i più "esportabili" all'esame)
1. **Schema generale per risolvere con LU** (vale sempre, cambia solo se serve P):
   ```matlab
   [L, U, P] = lu(A);
   y = L \ (P*b);
   x = U \ y;
   ```
   Se `isequal(P, eye(n))` puoi anche scrivere semplicemente `y = L\b; x = U\y;`
   ma usare `P*b` funziona comunque anche quando P è l'identità, quindi è lo
   schema "sempre corretto" da tenere a mente.

2. **Schema per Cholesky** (solo se A è simmetrica e definita positiva):
   ```matlab
   R = chol(A);
   y = R' \ b;
   x = R \ y;
   ```

3. **Calcolo dell'inversa via sistemi lineari** (utile se ti chiedono di evitare `inv`):
   ```matlab
   invA = zeros(n);
   for i = 1:n
       ei = zeros(n,1); ei(i) = 1;
       invA(:,i) = A \ ei;     % oppure via LU come sopra
   end
   ```

4. **Costruzione di matrici strutturate per questi esercizi** (tridiagonali, a banda,
   con parametro N grande): quasi sempre `diag(valore*ones(1,k), offset)` sommati tra
   loro — stesso pattern della cartella 02, riusalo qui.

5. **Diagnosticare un sistema "sospetto" prima di risolverlo**: controlla sempre
   `det(A)` e confronta `rank(A)` con `rank([A b])` — è il modo standard per capire
   se avrai nessuna soluzione, infinite soluzioni, o una soluzione ai minimi quadrati
   (vedi `metodidiretti.m` es.2).
