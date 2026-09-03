# Floating point, script-file, controllo di flusso

## File in questa cartella
- `lab03.m` — aritmetica finita, `format`, script-file con `input`/`if`/`for`,
  inversa e norme di matrici, `diag`, `tril`/`triu`, prima occhiata a `\` (Lab 3)
- `lab03_recap.m` — esercizi di riepilogo, incluse function locali (Lab 3 recap)

## Mappa comandi → dove cercare

| Devo fare... | Comando chiave | Dove guardare |
|---|---|---|
| Vedere numero macchina più grande/piccolo | `realmax`, `realmin` | `lab03.m` inizio |
| Cambiare precisione di visualizzazione | `format long`, `format short e`... | `lab03.m` |
| Epsilon macchina | `eps` | `lab03.m` |
| Leggere un input da tastiera | `input('testo ')` | `lab03.m` sez. `mat_trisup.m` |
| Uscire in anticipo da uno script con condizione | `if(...) ... return; end` | `lab03.m` |
| Riempire una matrice con un ciclo (evitando doppio for) | `for i=1:n ... A(i, i+1:n) = ... end` | `lab03.m` sez. `mat_trisup.m` |
| Inversa di una matrice | `inv(A)` | `lab03.m` |
| Norme di matrici (1, inf) | `norm(A,1)`, `norm(A,inf)` | `lab03.m` Exercise 4 |
| Stessa norma "a mano" con abs/sum/max | `max(sum(abs(A)))` | `lab03.m` Exercise 4 |
| Costruire matrice diagonale da un vettore | `diag(v)`, `diag(v,k)` per sopra/sottodiagonali | `lab03.m` |
| Estrarre la diagonale (o una sopra/sotto) da una matrice | `diag(M)`, `diag(M,k)` | `lab03.m` |
| Matrice tridiagonale (es. -1,4,-1) | combinazione di 3 `diag(...,k)` | `lab03.m`, `lab03_recap.m` es.2 |
| Parte triangolare inf/sup di una matrice | `tril(A)`, `triu(A)`, con offset `tril(A,-1)` ecc. | `lab03.m` |
| Matrice "a banda" (solo k diagonali non nulle) | combinare `tril(triu(A,-k1), k2)` | `lab03.m` Exercise 7, `lab03_recap.m` es.3 |
| Risolvere un sistema lineare | `x = A\b` | `lab03.m` Exercise 8 |
| Definire una funzione dentro lo script | `function y = nome(x) ... end` in fondo al file | `lab03_recap.m` es.1 |

## Pattern da adattare
- **Evitare i doppi cicli `for`**: quasi ogni volta che ti viene voglia di scrivere
  `for i ... for j ...` su una matrice strutturata (triangolare, a banda, con pattern
  regolare), prova prima con `diag`, `tril`, `triu` o indicizzazione vettoriale — è
  più veloce da scrivere e meno soggetto a errori di indice.
- **Matrici "a pattern" (tipo quelle con -2, 20, ecc. su diagonali diverse)**: si
  costruiscono sempre sommando più `diag(vettore, offset)`, un pezzo per diagonale
  (vedi `lab03_recap.m` es.2 — è lo schema più riciclabile per l'esame).
- **`A\b` vs `inv(A)*b`**: numericamente `A\b` è preferibile (più stabile, non calcola
  esplicitamente l'inversa) — se l'esame chiede "confronta i due metodi", il punto è
  proprio questo.
- **Function locali in uno script**: vanno scritte in fondo al file `.m`, e possono
  essere richiamate anche più in alto nello script (MATLAB legge tutto il file prima
  di eseguirlo).
