# Calcolo Numerico — Esercizi MATLAB per argomento

Ogni esercizio è archiviato sotto la cartella del suo argomento. Ogni file
contiene: il **testo originale** del punto (per cercarlo con le parole
dell'esame che hai davanti), il **codice della soluzione**, e la
**spiegazione riga per riga** con cosa modificare se il testo cambia.

## Come cercare durante l'esame

1. Leggi il testo del tuo esercizio, individua le parole chiave (es. "metodo
   di Newton", "spline", "problema di Cauchy"...).
2. Guarda la tabella sotto per capire in quale cartella cercare.
3. Apri i file `.md` di quella cartella (i nomi hanno la data del tema
   d'esame di origine, ma il contenuto conta più del nome).

## Mappa parola chiave → cartella

| Parola chiave nel testo | Cartella |
|---|---|
| grafico di una funzione, zero/radice, `fzero`, metodo di Newton, derivata | `argomenti/radici-equazioni/` |
| polinomio interpolante, nodi equispaziati, `polyfit`, `polyval`, retta/parabola di regressione | `argomenti/interpolazione-regressione/` |
| problema di Cauchy, equazione differenziale, metodo di Heun/Eulero, spline, `griddedInterpolant` | `argomenti/equazioni-differenziali/` |
| integrale, quadratura, trapezi, `trapz`, `integral` | `argomenti/integrazione-numerica/` |
| sistema lineare, `\`, LU, Cholesky | `argomenti/sistemi-lineari/` *(da popolare)* |
| vettori, matrici, indicizzazione, operazioni base | `argomenti/basi-vettori-matrici/` *(da popolare)* |

## Cartella `lib/`

Contiene le funzioni MATLAB non predefinite usate nelle soluzioni (es.
`newton.m`, `heun.m`). Vanno recuperate dai laboratori del corso e tenute
aggiornate qui. Ogni script di soluzione usa `addpath(...)` per puntare a
questa cartella — verifica sempre che il percorso sia corretto rispetto a
dove ti trovi.

## Prossimi passi
- Aggiungere altri temi d'esame, spezzettandoli per argomento come fatto per
  il 13/09/2024
- Popolare `sistemi-lineari/` e `basi-vettori-matrici/` con esercizi presi
  dai laboratori
