# [Tema 18/06/2025] Spline lineare su dati generati da una funzione

## Testo originale (per cercarlo)
> Si consideri la funzione f(x) = cos(πx) / (x²(1+log(x))), sia x il vettore
> di 6 punti equispaziati nell'intervallo [2,4] e y = f(x).
> Si costruisca la spline lineare s1 che interpola i dati (xi, yi),
> i=1,...,6 e si calcoli il valore s1(2.5).

**Parole chiave**: spline lineare, `griddedInterpolant`, punti equispaziati,
valutare una funzione interpolante in un punto specifico.

## Soluzione

```matlab
f = @(x) (cos(pi*x)) ./ (x.^2 .* (1 + log(x)));
x = linspace(2, 4, 6);
y = f(x);

s1 = griddedInterpolant(x, y, 'linear');
res1 = s1(2.5)
```

## Spiegazione riga per riga

- `f = @(x) ...` → la funzione data dal testo, come funzione anonima.
  Nota i punti (`.^`, `./`, `.*`): servono perché più avanti valuterai `f` su
  un intero vettore di punti insieme, non su un solo numero.
- `x = linspace(2, 4, 6)` → genera i 6 punti equispaziati richiesti
  nell'intervallo dato.
- `y = f(x)` → calcola la funzione in quei 6 punti — questi sono i "dati"
  `(xi, yi)` di cui parla il testo.
- `griddedInterpolant(x, y, 'linear')` → costruisce la spline lineare: una
  curva che collega i punti dati con segmenti di retta, utilizzabile per
  stimare il valore in punti intermedi (qui non c'è nessun punto dato
  esattamente uguale a 2.5, quindi serve interpolare tra i due più vicini).
- `s1(2.5)` → valuta la spline nel punto richiesto.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione | solo `f = @(x) ...` |
| l'intervallo o il numero di punti | `linspace(a, b, n)` |
| il punto in cui valutare la spline | l'argomento di `s1(...)` |
| chiede una spline cubica invece che lineare | cambi la stringa `'linear'` in `'spline'` o `'cubic'`, il resto resta identico |
