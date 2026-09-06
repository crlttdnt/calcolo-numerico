# [Tema 11/02/2025] Problema di Cauchy con Heun (variante)

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy y' = 3(t+1) - y, 1≤t≤2, y(1)=4, la cui
> soluzione esatta è y(t) = 3t + e^(1-t). Si approssimi il problema con il
> metodo di Heun, passo h=0.01. Si determini il valore della soluzione
> approssimata al tempo finale. Si calcoli l'errore in norma infinito tra
> soluzione approssimata ed esatta.

**Parole chiave**: problema di Cauchy, metodo di Heun, norma infinito.

## Soluzione

```matlab
f = @(t, y) 3*(t+1) - y;
t0 = 1;
tmax = 2;
y0 = 4;
y = @(t) 3*t + exp(1-t);

h = 0.01;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
Y(end)

norm(y(T) - Y, inf)
```

## Spiegazione

Nessuna novità rispetto allo schema standard di Heun già visto in
`argomenti/equazioni-differenziali/2024-09-13_cauchy-heun.md`: si definisce
`f`, gli estremi e la condizione iniziale, si genera `T` con il passo dato,
si chiama `heun(f, T, y0)`, si legge l'ultimo valore con `Y(end)` e si
calcola l'errore con `norm(y(T)-Y, inf)`.

**Attenzione pratica** (vedi anche l'esercizio 3 collegato, in
`argomenti/interpolazione-regressione/`): in questo tema, più avanti nello
stesso script, la variabile `y` (che qui è la funzione anonima soluzione
esatta) viene **sovrascritta** con un vettore di numeri quando si calcola la
regressione lineare. Se ti serve ancora la funzione `y` più avanti nello
script dopo quel punto, usa un nome diverso per il vettore.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'equazione differenziale, intervallo, condizione iniziale | `f`, `t0`, `tmax`, `y0` |
| il passo | `h` |
| il metodo richiesto | quale funzione della cartella `lib` chiami (`heun`, `eulero`, `eulimp`...) |
