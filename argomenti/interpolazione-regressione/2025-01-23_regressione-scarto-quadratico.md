# [Tema 23/01/2025] Retta di regressione, valutazione in un punto e scarto quadratico

## Testo originale (per cercarlo)
> Si consideri il vettore z di 6 punti equispaziati nell'intervallo [0,2] e
> si determini la retta di regressione lineare r che approssima i dati
> (zi, f(zi)). Si calcoli il valore assunto dalla retta nella radice α di f.
> Si calcoli infine lo scarto quadratico S = Σ(f(zi) − r(zi))².

*(Nota: `f`, `a`, `b`, `alpha` sono definiti nell'esercizio su `fzero` — vedi
`argomenti/radici-equazioni/2025-01-23_fzero.md`.)*

**Parole chiave**: retta di regressione, `polyfit` grado 1, valutare in un
punto, scarto quadratico, somma dei residui al quadrato.

## Soluzione

```matlab
z = linspace(a, b, 6);
r = polyfit(z, f(z), 1);
ralpha = polyval(r, alpha)
S = sum((f(z) - polyval(r, z)).^2)
```

## Spiegazione riga per riga

- `z = linspace(a, b, 6)` → i 6 punti equispaziati richiesti dal testo.
- `r = polyfit(z, f(z), 1)` → la retta di regressione: stesso comando visto
  nel tema di settembre (`polyfit` di grado 1 = retta che approssima al
  meglio, senza passare esattamente per i punti).
- `ralpha = polyval(r, alpha)` → valuta la retta trovata **non** in un punto
  qualsiasi, ma proprio nella radice `alpha` calcolata nell'esercizio
  precedente — nota come i pezzi dei vari punti dell'esercizio si incastrano
  fra loro.
- `S = sum((f(z) - polyval(r, z)).^2)` → è la parte nuova rispetto ai temi
  precedenti: lo **scarto quadratico** (somma dei quadrati degli scarti tra
  valore vero e valore stimato dalla retta, su ognuno dei 6 punti usati per
  costruirla). Si calcola in tre passi dentro un'unica riga: `f(z) -
  polyval(r,z)` è il vettore delle differenze punto per punto; `.^2` eleva
  al quadrato ogni differenza (elemento per elemento, da cui il punto);
  `sum(...)` somma tutti i quadrati.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| il numero di punti | il terzo argomento di `linspace` |
| il punto in cui valutare la retta | l'argomento di `polyval(r, ...)` (non deve per forza essere una radice) |
| chiede l'errore massimo invece dello scarto quadratico | usa `max(abs(f(z)-polyval(r,z)))` invece di `sum((...).^2)` |
| chiede una parabola di regressione | cambia `1` in `2` nel grado di `polyfit` |

**Concetto chiave**: lo scarto quadratico `S` è semplicemente "quanto la
retta si allontana dai dati, sommando i quadrati degli scarti" — un altro
modo di misurare la bontà di un'approssimazione, alternativo all'errore
massimo (`max(abs(...))`) già visto in altri esercizi.
