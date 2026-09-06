# [Tema 21/06/2024] Fattorizzazione LU, norma di L, soluzione per sostituzioni

## Testo originale (per cercarlo)
> Si calcoli, usando l'apposito comando di Matlab, la fattorizzazione LU di
> A e si determini il valore di ||L||∞. Utilizzando la fattorizzazione
> calcolata si determini la soluzione x del sistema Ax=b. Sia y il termine
> noto del sistema triangolare superiore da risolvere per sostituzione
> all'indietro, si calcolino ||y||∞ e ||x||∞.

*(Nota: `A`, `b` sono definiti nell'esercizio sulla costruzione della
matrice — vedi
`argomenti/sistemi-lineari/2024-06-21_matrice-decrescente-autovalore-minimo.md`.)*

**Parole chiave**: fattorizzazione LU, `lu(A)`, norma infinito di una
matrice, sostituzione in avanti, sostituzione all'indietro, risolvere un
sistema sfruttando una fattorizzazione già calcolata.

## Soluzione

```matlab
[L, U, P] = lu(A);
Lnorm = norm(L, inf)

% PA = LU
% LUx = Pb; Ly = Pb; Ux = y
y = L \ (P*b);
x = U \ y;
ynorm = norm(y, inf)
xnorm = norm(x, inf)
```

## Spiegazione riga per riga

- `[L, U, P] = lu(A)` → comando **predefinito** di MATLAB che calcola la
  fattorizzazione LU con pivoting: `L` triangolare inferiore, `U`
  triangolare superiore, `P` matrice di permutazione, tali che `P*A = L*U`.
- `norm(L, inf)` → la norma infinito richiesta dal testo, calcolata
  direttamente sulla matrice `L` appena ottenuta — nessun calcolo aggiuntivo
  necessario.
- **Risolvere `Ax=b` sfruttando la fattorizzazione**: dato che `P*A = L*U`,
  il sistema `Ax=b` è equivalente a `L*U*x = P*b`. Si risolve in due passi:
  prima si pone `y = U*x` e si risolve il sistema triangolare inferiore
  `L*y = P*b` (questa è la **sostituzione in avanti** — il motivo per cui il
  testo chiama `y` "il termine noto del sistema triangolare superiore da
  risolvere all'indietro": una volta trovato `y`, diventa il termine noto
  del secondo sistema); poi si risolve `U*x = y` (la **sostituzione
  all'indietro**) per ottenere la soluzione finale `x`.
- `y = L \ (P*b)` → MATLAB risolve da sola il sistema triangolare inferiore
  con l'operatore `\` (che, riconoscendo che `L` è triangolare, usa
  automaticamente la sostituzione in avanti internamente, in modo efficiente).
- `x = U \ y` → stesso principio per il sistema triangolare superiore
  (sostituzione all'indietro).
- `norm(y, inf)`, `norm(x, inf)` → norme richieste dal testo, su entrambi i
  vettori intermedio e finale.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la matrice `A` o il termine noto `b` | dipende da dove sono definiti |
| chiede la norma 1 invece di infinito | `norm(L, 1)` |
| chiede anche `||U||∞` | aggiungi `norm(U, inf)`, stesso schema |
| chiede di verificare che `P` non sia l'identità (pivoting effettuato) | `isequal(P, eye(size(A,1)))` — se falso, il pivoting è stato fatto |

**Concetto chiave riutilizzabile**: questo schema (`y = L\(P*b); x = U\y;`)
è **sempre lo stesso**, identico a quello già visto nel tema del 13/09/2024
per la fattorizzazione LU (vedi i laboratori) — cambia solo la matrice `A`
di partenza, mai la struttura del codice.
