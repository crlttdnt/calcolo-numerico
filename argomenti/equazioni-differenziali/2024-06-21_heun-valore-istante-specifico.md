# [Tema 21/06/2024] Heun: valore approssimato in un istante specifico (non finale)

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy y' = -y + e^(-t)(21t²+5), 0≤t≤1,
> y(0)=-1, soluzione esatta y(t)=e^(-t)(7t³+5t-1). Si approssimi con Heun,
> passo h=0.05. Si riporti il valore della soluzione approssimata
> all'istante t=0.05: Y2.

**Parole chiave**: problema di Cauchy, metodo di Heun, valore in un
istante intermedio specifico (non l'ultimo), corrispondenza tra indice del
vettore e istante di tempo.

## Soluzione

```matlab
f = @(t, y) -y + exp(-t) .* (21*t.^2+5);
t0 = 0;
tmax = 1;
y0 = -1;
sol = @(t) exp(-t) .* (7*t.^3 + 5*t - 1);

h = 0.05;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
Y2 = Y(2)
```

## Spiegazione riga per riga

Stessa struttura standard di Heun già vista più volte. La parte da capire
bene è l'ultima riga:

- `Y2 = Y(2)` → il testo chiede il valore all'istante `t=0.05`, **non**
  l'istante finale. Il vettore `T` generato da `t0:h:tmax` con `t0=0` e
  `h=0.05` vale `T = [0, 0.05, 0.10, 0.15, ...]`. Quindi:
  - `T(1) = 0` (l'istante iniziale, corrispondente a `Y(1) = y0`)
  - `T(2) = 0.05` (il secondo istante) ← è questo che serve
  - `T(3) = 0.10`, e così via.

  Per questo il testo chiama la variabile richiesta proprio `Y2`: è
  **l'elemento in posizione 2** del vettore `Y`, che corrisponde al secondo
  istante di tempo generato, cioè `t=0.05` = `t0 + 1*h`.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'istante richiesto è diverso da `t0+h` | calcola l'indice corrispondente: in generale, l'istante `t0 + k*h` si trova in posizione `Y(k+1)` (perché `Y(1)` corrisponde a `t0`, non a `t0+h`) |
| non è chiaro l'indice giusto "a occhio" | puoi sempre verificare con `T(indice)` che corrisponda davvero all'istante richiesto, prima di leggere `Y(indice)` |
| chiede il valore finale | `Y(end)` |
| chiede il valore massimo | `max(Y)` |

**Concetto chiave**: quando il testo chiede un valore in un istante che
**non** è l'ultimo, calcola sempre a mente (o verifica con `T(indice)`)
quale posizione del vettore corrisponde a quell'istante — l'offset di 1
(l'istante iniziale occupa la posizione 1, non 0) è la fonte di errore più
comune.
