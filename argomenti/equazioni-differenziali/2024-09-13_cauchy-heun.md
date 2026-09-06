# [Tema 13/09/2024] Problema di Cauchy con metodo di Heun + spline lineare

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy: y' = y·sin(t) + sin(2t), 0 ≤ t ≤ 1,
> y(0) = -2, la cui soluzione esatta è y(t) = 2 − 2cos(t) − 2·e^(1−cos(t)).
>
> Si approssimi il problema di Cauchy nell'intervallo [0,1] utilizzando il
> metodo di Heun con passo h = 0.05. Si riporti il valore della soluzione
> approssimata al tempo finale.
>
> Si disegnino a confronto i grafici della soluzione esatta e di quella
> approssimata.
>
> Si calcoli l'errore in norma infinito tra la soluzione approssimata e
> quella esatta nei nodi di discretizzazione fissati.
>
> Si determini la spline lineare s1 che interpola i dati (T,Y) ottenuti come
> approssimazione della soluzione del problema di Cauchy. Si calcoli il
> valore assunto dalla spline in un punto dato.

**Parole chiave**: problema di Cauchy, equazione differenziale, metodo di
Heun, passo h, soluzione approssimata vs soluzione esatta, norma infinito,
spline lineare, `griddedInterpolant`.

## Soluzione

```matlab
f = @(t, y) y.*sin(t) + sin(2*t);
t0 = 0;
tmax = 1;
y0 = -2;
sol = @(t) 2 - 2*cos(t) - 2*exp(1 - cos(t));

h = 0.05;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
YN = Y(end)

plot(T, sol(T), T, Y)
legend('Exact','Heun');

errinf = norm(sol(T)-Y, inf)

s1 = griddedInterpolant(T, Y, 'linear');
s1t = s1(1/3)
```

## Spiegazione riga per riga

- `f = @(t,y) ...` → la formula `y' = ...`, scritta come funzione di **due**
  variabili: tempo `t` e valore attuale `y`. È così che si scrivono sempre i
  problemi di Cauchy in MATLAB: la "velocità di cambiamento" di y dipende sia
  dal tempo che dal valore corrente di y.
- `t0`, `tmax`, `y0` → dati direttamente dal testo (intervallo di tempo e
  condizione iniziale).
- `sol = @(t) ...` → la soluzione esatta, quando il testo la fornisce (serve
  solo per fare confronti dopo — MATLAB non la "scopre" da sola).
- `h = 0.05` → il passo: ogni quanto tempo si calcola un nuovo punto.
- `T = t0:h:tmax` → il vettore di tutti gli istanti di tempo in cui si
  calcolerà la soluzione approssimata.
- `[T, Y] = heun(f, T, y0)` → funzione **custom** dalla cartella `lib`
  (come `newton`): implementa il metodo di Heun. Le dai funzione, tempi,
  valore iniziale; restituisce i tempi (`T`) e i valori approssimati (`Y`).
- `Y(end)` → l'ultimo elemento di `Y`, cioè il valore della soluzione
  approssimata all'istante finale.
- `plot(T, sol(T), T, Y)` + `legend` → disegna sullo stesso grafico
  soluzione esatta e approssimata, con etichette per distinguerle.
- `norm(sol(T)-Y, inf)` → calcola la differenza tra le due soluzioni in ogni
  istante di `T`, poi prende la più grande in valore assoluto (norma
  infinito = "errore nel punto peggiore").
- `griddedInterpolant(T, Y, 'linear')` → costruisce una curva che collega i
  punti `(T,Y)` con segmenti di retta, utilizzabile per stimare il valore
  della soluzione anche in istanti che non erano tra quelli calcolati da
  Heun (qui: `t=1/3`, che probabilmente cade tra due istanti calcolati).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'equazione differenziale | solo `f = @(t,y) ...` |
| intervallo di tempo o valore iniziale | `t0`, `tmax`, `y0` |
| il passo | `h` |
| il metodo richiesto (Eulero invece di Heun) | quale funzione della cartella `lib` chiami, il resto della logica resta identico |
| non è data la soluzione esatta | salti tutti i passaggi che usano `sol` (confronto grafico e norma infinito) |
| spline cubica invece che lineare | cambi solo la stringa `'linear'` in `griddedInterpolant` |
| valutare la spline in un altro punto | cambi solo l'argomento di `s1(...)` |
