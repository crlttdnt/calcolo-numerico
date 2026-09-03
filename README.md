# Calcolo Numerico — Repo d'esame

Repo con esercizi MATLAB svolti (laboratori + temi d'esame) organizzati per
argomento, da usare come riferimento durante l'esame.

**Come usarla in esame**: non cercare di ricordare il codice a memoria — cerca
qui l'esercizio più simile a quello richiesto e adattalo. Ogni cartella ha un
`note.md` con la mappa "cosa devo fare → dove guardare" e i pattern principali
da riadattare.

## Struttura

| Cartella | Argomenti |
|---|---|
| [`01-basi-vettori-matrici/`](./01-basi-vettori-matrici) | scalari, numeri complessi, vettori (creazione/slicing/operazioni), matrici (creazione/sottoblocchi/concatenazione), norme, det, rank |
| [`02-floating-point-e-script/`](./02-floating-point-e-script) | aritmetica finita, format, script-file, if/for, `diag`/`tril`/`triu`, prima introduzione a `\` |
| [`03-sistemi-lineari-diretti/`](./03-sistemi-lineari-diretti) | risoluzione sistemi con `\`, fattorizzazione LU, fill-in, fattorizzazione di Cholesky |
| [`temi-esame/`](./temi-esame) | testi e soluzioni dei temi d'esame passati |

## Mappa rapida per parola chiave

| Parola chiave nel testo dell'esercizio | Vai a |
|---|---|
| vettore, indicizzazione, slicing, `linspace`, `:` | `01-basi-vettori-matrici` |
| operazioni componente per componente, `.*` `./` `.^` | `01-basi-vettori-matrici` |
| matrice, sottomatrice, concatenazione, righe/colonne | `01-basi-vettori-matrici` |
| norma, determinante, rango | `01-basi-vettori-matrici` (norme/det/rank base) o `03-sistemi-lineari-diretti` (norme di inverse) |
| numeri macchina, precisione, cancellazione numerica, `format` | `02-floating-point-e-script` |
| script-file, `input`, `if`, `for`, ciclo | `02-floating-point-e-script` |
| matrice diagonale/tridiagonale/a banda, `diag`, `tril`, `triu` | `02-floating-point-e-script` |
| risolvere sistema lineare, `\`, sistema singolare | `03-sistemi-lineari-diretti` |
| fattorizzazione LU, pivoting, `lu(A)` | `03-sistemi-lineari-diretti` |
| fill-in, `spy`, matrice sparsa | `03-sistemi-lineari-diretti` |
| Cholesky, `chol`, matrice simmetrica definita positiva | `03-sistemi-lineari-diretti` |
| calcolo dell'inversa via sistemi lineari | `03-sistemi-lineari-diretti` |

## Da fare
- [ ] Aggiungere laboratori su interpolazione, integrazione numerica, equazioni
      differenziali quando disponibili
- [ ] Aggiungere temi d'esame e relative soluzioni in `temi-esame/`
