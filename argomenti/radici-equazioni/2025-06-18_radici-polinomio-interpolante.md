# [Tema 18/06/2025] Radici reali di un polinomio interpolante

## Testo originale (per cercarlo)
> Si costruisca il polinomio p che interpola i dati (xi, yi), i=1,...,6 e si
> calcolino le radici reali di p nell'intervallo [2,4].

*(Nota: `x`, `y` sono definiti nell'esercizio sulla spline — vedi
`argomenti/interpolazione-regressione/2025-06-18_spline-lineare.md`, sono
gli stessi 6 punti.)*

**Parole chiave**: polinomio interpolante, `polyfit`, radici di un
polinomio, `roots`, numeri complessi, filtrare per intervallo.

## Soluzione

```matlab
p = polyfit(x, y, length(x)-1);
allroots = roots(p);
realroots = allroots(imag(allroots) == 0);
res2 = realroots(realroots >= 2 & realroots <= 4)
```

## Spiegazione riga per riga

- `polyfit(x, y, length(x)-1)` → costruisce il polinomio che passa
  esattamente per tutti i punti dati. `length(x)-1` è il grado necessario:
  con 6 punti serve grado 5 (regola: per interpolare `N` punti serve grado
  `N-1` — qui scritto con `length(x)` invece di scrivere `6` a mano, così se
  cambia il numero di punti la formula si adatta da sola).
- `roots(p)` → comando **predefinito** di MATLAB: calcola tutte le radici
  del polinomio `p` (i punti in cui vale zero). Un polinomio di grado 5 ha
  fino a 5 radici, che possono essere numeri reali o complessi.
- `allroots(imag(allroots) == 0)` → filtra solo le radici **reali**: per
  ogni radice controlla se la parte immaginaria è zero (`imag(...) == 0`,
  vero/falso per ciascuna), e tiene solo quelle per cui è vero. Questo è un
  esempio di **indicizzazione logica**: `vettore(condizione)` restituisce
  solo gli elementi di `vettore` dove `condizione` è vera.
- `realroots(realroots >= 2 & realroots <= 4)` → stessa tecnica di
  indicizzazione logica, ma per tenere solo le radici che cadono
  nell'intervallo `[2,4]` richiesto dal testo. `&` è "e" logico: entrambe le
  condizioni devono essere vere.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| i dati/la funzione di partenza | niente in questo file: dipende dall'esercizio precedente che genera `x`, `y` |
| l'intervallo in cui cercare le radici | i due numeri nel confronto `realroots >= ... & realroots <= ...` |
| vuole anche le radici complesse | salti il filtro `imag(...)==0`, usi direttamente `allroots` |
| non chiede di filtrare per intervallo | ti fermi a `realroots`, senza l'ultima riga |

**Concetto chiave riutilizzabile**: `vettore(condizione_logica)` è il modo
generale di MATLAB per "tenere solo gli elementi che soddisfano una
condizione" — torna utile ogni volta che devi filtrare risultati (radici,
dati, indici) secondo un criterio, non solo qui.
