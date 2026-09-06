# [Tema 11/02/2025] Retta di regressione su dati generati dalla soluzione esatta

## Testo originale (per cercarlo)
> Sia y(t) = 3t + e^(1-t) la soluzione del problema di Cauchy precedente. Si
> consideri il vettore x di 10 punti equispaziati nell'intervallo [1,2] e
> sia y il vettore di componenti yi = y(xi). Si calcoli la retta di
> regressione lineare r(t) = m·t + q che approssima i dati (xi,yi) e si
> calcoli il valore assunto dalla retta nel punto medio dell'intervallo.

*(Nota: la funzione `y(t)` è definita nell'esercizio su Heun — vedi
`argomenti/equazioni-differenziali/2025-02-11_heun-cauchy.md`.)*

**Parole chiave**: retta di regressione, coefficienti `m` e `q` di una
retta, `polyfit` grado 1, valutare in un punto specifico, attenzione a
sovrascrivere una funzione anonima con un vettore.

## Soluzione

```matlab
x = linspace(1, 2, 10);
y = y(x);
r = polyfit(x, y, 1)
pm = polyval(r, 1.5)
```

## Spiegazione riga per riga

- `x = linspace(1, 2, 10)` → i 10 punti equispaziati richiesti.
- `y = y(x)` → **attenzione a questa riga**: valuta la funzione `y` (la
  soluzione esatta, definita come funzione anonima nell'esercizio
  collegato) sui 10 punti di `x`, e poi **salva il risultato sovrascrivendo
  il nome `y` stesso** — da questo momento in poi nello script, `y` non è
  più la funzione, ma il vettore dei 10 valori calcolati. Questo è legale in
  MATLAB (puoi riusare un nome), ma è un errore comune se in seguito ti
  serve ancora chiamare `y(qualcosa)` come funzione: da qui in poi non
  funzionerebbe più.
- `r = polyfit(x, y, 1)` → la retta di regressione, stesso comando di
  sempre (grado 1 = retta).
- `pm = polyval(r, 1.5)` → valutata nel punto medio dell'intervallo [1,2]
  (che è 1.5, scritto qui come numero fisso invece di calcolarlo con
  `(a+b)/2` — equivalente, solo meno "generico").

## La parte che il codice non fa esplicitamente: `m` e `q`

Il testo chiede di riportare separatamente `m` (coefficiente angolare) e
`q` (intercetta) della retta `r(t) = m·t + q`. Il codice calcola solo il
vettore `r`, ma **`polyfit` restituisce sempre i coefficienti in ordine dal
grado più alto al più basso**: per un polinomio di grado 1, quindi:

```matlab
m = r(1)   % coefficiente angolare
q = r(2)   % intercetta
```

Se il testo chiede esplicitamente `m` e `q` separati (come in questo caso),
aggiungi queste due righe per completezza, anche se il calcolo numerico è
già stato fatto da `polyfit`.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| il numero di punti o l'intervallo | `linspace(...)` |
| il punto di valutazione | l'argomento di `polyval(r, ...)` |
| chiede una parabola (`r(t)=at²+bt+c`) invece di una retta | grado `2` in `polyfit`, e i coefficienti diventano `r(1)=a`, `r(2)=b`, `r(3)=c` |

**Promemoria pratico**: dai sempre un nome diverso al vettore dei dati
rispetto alla funzione da cui li generi (es. `yv = y(x)` invece di
`y = y(x)`), a meno che tu sia sicuro di non aver più bisogno della funzione
originale più avanti nello script.
