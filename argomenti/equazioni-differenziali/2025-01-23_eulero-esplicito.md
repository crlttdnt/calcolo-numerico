# [Tema 23/01/2025] Problema di Cauchy con metodo di Eulero esplicito

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy y' = 2y(t−5), 0≤t≤1, y(0)=1, la cui
> soluzione esatta è y(t) = e^(t²−10t).
> Si approssimi il problema di Cauchy utilizzando il metodo di Eulero
> esplicito con passo h = 0.001. Si riporti il valore YN all'istante finale.
> Si calcoli l'errore in norma infinito tra la soluzione approssimata e
> quella esatta nei nodi di discretizzazione.

**Parole chiave**: problema di Cauchy, metodo di Eulero esplicito, passo h,
norma infinito, alternativa a Heun.

## Soluzione

```matlab
f = @(t, y) 2*y*(t - 5);
t0 = 0;
tmax = 1;
y0 = 1;
y = @(t) exp(t.^2 - 10*t);

h = 0.001;
T = t0:h:tmax;
[T, Y] = eulero(f, T, y0);
YN = Y(end)

norm(y(T) - Y, inf)
```

## Spiegazione riga per riga

Stessa identica struttura vista con Heun (vedi
`argomenti/equazioni-differenziali/2024-09-13_cauchy-heun.md`): `f = @(t,y)`
definisce l'equazione differenziale, `t0/tmax/y0` gli estremi e la
condizione iniziale, `y` (se il testo la dà) la soluzione esatta per i
confronti.

**L'unica differenza è il metodo usato**: qui si chiama `eulero(f, T, y0)`
invece di `heun(f, T, y0)` — un'altra funzione **custom** dalla cartella
`lib` che implementa il metodo di Eulero esplicito. La firma (cosa le passi,
cosa restituisce) è identica a `heun`: tempi e valore iniziale in ingresso,
`T` e `Y` in uscita.

`norm(y(T) - Y, inf)` è l'errore assoluto in norma infinito, stesso comando
già visto — qui il testo non chiede l'errore *relativo* (a differenza del
tema di giugno 2025 sull'ordine di convergenza), solo quello assoluto.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'equazione differenziale | solo `f = @(t,y) ...` |
| intervallo, passo, condizione iniziale | `t0`, `tmax`, `h`, `y0` |
| il metodo richiesto (Heun, Eulero implicito, RK...) | quale funzione della cartella `lib` chiami — la struttura del codice attorno resta identica |
| chiede errore relativo invece che assoluto | dividi per `norm(y(T), inf)`, come nel tema di giugno 2025 |

**Promemoria**: verifica di avere anche `eulero.m` in `lib/`, oltre a
`newton.m`, `heun.m`, `bisezione.m` — è normale che l'esame chieda un metodo
diverso ogni volta tra quelli visti a lezione (Eulero esplicito, Eulero
implicito, Heun, eventualmente Runge-Kutta), quindi conviene avere già tutte
le funzioni pronte in `lib` prima di entrare in aula.
