# [Tema 04/11/2024] Raggio spettrale della matrice di iterazione di Jacobi

## Testo originale (per cercarlo)
> Calcolare il raggio spettrale della matrice di iterazione del metodo
> iterativo di Jacobi per la risoluzione di un sistema lineare Ax=b.

*(Nota: `A` è definita nell'esercizio sulla matrice strutturata — vedi
`argomenti/sistemi-lineari/2024-11-04_matrice-strutturata-det-inv-condizionamento.md`.)*

**Parole chiave**: metodo di Jacobi, matrice di iterazione, raggio
spettrale, autovalori, `eig`, convergenza di un metodo iterativo.

## Soluzione

```matlab
D = diag(diag(A));
E = -tril(A, -1);
F = -triu(A, 1);
% B = D^-1*(E-F) = D\(E+F)
Bj = D \ (E + F);
rho = max(abs(eig(Bj)))
```

## Spiegazione riga per riga

Prima il concetto: nei metodi iterativi (Jacobi, Gauss-Seidel...) si scompone
la matrice `A` come somma di tre pezzi: la sua parte diagonale `D`, la parte
sotto la diagonale (con segno cambiato) `E`, e la parte sopra la diagonale
(con segno cambiato) `F`, tali che `A = D - E - F`. Da questa scomposizione
si costruisce la "matrice di iterazione" del metodo, il cui raggio
spettrale (il più grande valore assoluto tra i suoi autovalori) dice se il
metodo converge (deve essere minore di 1) e quanto velocemente.

- `D = diag(diag(A))` → **doppio uso di `diag`**: la prima chiamata
  `diag(A)` (con un solo argomento su una matrice) estrae il **vettore**
  della diagonale principale di `A`; la seconda chiamata `diag(quel
  vettore)` lo trasforma di nuovo in una **matrice** diagonale (con zeri
  altrove). Il risultato netto: `D` è uguale ad `A` ma con tutti gli
  elementi fuori dalla diagonale principale azzerati.
- `E = -tril(A, -1)` → `tril(A, -1)` prende la parte di `A` strettamente
  sotto la diagonale (offset `-1` esclude la diagonale stessa); il segno
  meno davanti applica la convenzione `A = D - E - F` di cui sopra.
- `F = -triu(A, 1)` → stessa idea, ma per la parte sopra la diagonale
  (`triu` invece di `tril`).
- `Bj = D \ (E + F)` → la matrice di iterazione di Jacobi è per definizione
  `D⁻¹(E+F)`; invece di calcolare esplicitamente `inv(D)` (sconsigliato per
  motivi di stabilità numerica, come visto altrove), si usa `D \ (...)`, che
  risolve il sistema equivalente in modo più robusto — stesso principio del
  perché si preferisce sempre `\` a `inv(A)*b`.
- `eig(Bj)` → comando **predefinito** che calcola tutti gli autovalori della
  matrice.
- `max(abs(eig(Bj)))` → il raggio spettrale: il più grande valore assoluto
  tra tutti gli autovalori (che in generale possono essere numeri complessi,
  da cui il bisogno di `abs`).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la matrice `A` | dipende da come è definita altrove nello script |
| chiede il raggio spettrale di Gauss-Seidel invece di Jacobi | cambia solo come si costruisce la matrice di iterazione: per Gauss-Seidel è `Bgs = (D-E)\F` invece di `D\(E+F)` — la logica di `D`, `E`, `F` resta identica |
| chiede solo di dire se il metodo converge | basta controllare se `rho < 1` (converge) o `rho >= 1` (non converge), senza altri calcoli |

**Concetto chiave**: la costruzione di `D`, `E`, `F` a partire da `A` con
`diag(diag(...))`, `tril(...,-1)`, `triu(...,1)` è lo schema generale per
qualunque metodo iterativo per sistemi lineari — cambia solo come li
combini per ottenere la matrice di iterazione specifica del metodo
richiesto.
