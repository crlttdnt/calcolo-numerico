# [Tema 17/07/2024] Problema di Cauchy con metodo di Eulero implicito

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy y' = (y+1)/t + 1, 1≤t≤2, y(1) = -1, la
> cui soluzione esatta è y(t) = t·log(t) - 1.
> Si approssimi il problema di Cauchy utilizzando il metodo di Eulero
> implicito con passo h = 0.01 (toll=1e-6, nitmax=100). Si riporti il valore
> YN al tempo finale. Si disegni il confronto tra soluzione esatta e
> approssimata. Si calcoli l'errore in norma infinito.

**Parole chiave**: problema di Cauchy, metodo di Eulero implicito, `eulimp`,
tolleranza, iterazioni massime, derivata parziale rispetto a y.

## Soluzione

```matlab
f = @(t, y) (y+1)./t + 1;
t0 = 1;
tmax = 2;
y0 = -1;
y = @(t) t.*log(t) - 1;

h = 0.01;
toll = 1e-6;
nitmax = 100;
dfy = @(t, y) 1./t;
T = t0:h:tmax;
[T, Y] = eulimp(f, T, y0, dfy, toll, nitmax);
YN = Y(end)

plot(T, y(T), T, Y);
legend('Exact', 'EulImp')

infnorm = norm(y(T) - Y, inf)
```

## Spiegazione riga per riga

- `f`, `t0`, `tmax`, `y0`, `y` (soluzione esatta) → stessa struttura di
  sempre per un problema di Cauchy (vedi altri file in questa cartella).
- `h`, `toll`, `nitmax` → dati dal testo. La cosa nuova è che **Eulero
  implicito ha bisogno anche di `toll` e `nitmax`**, a differenza di Eulero
  esplicito e Heun: questo perché "implicito" significa che a ogni passo va
  risolta un'equazione (spesso con un metodo iterativo tipo Newton *dentro*
  al metodo stesso), quindi serve anche lì un criterio di arresto.
- `dfy = @(t, y) 1./t` → è la **derivata parziale di f rispetto a y**
  (non rispetto a t!), calcolata a mano. Serve perché il passo implicito
  tipicamente risolve un'equazione con Newton al suo interno, e Newton ha
  bisogno di una derivata. **Attenzione**: è concettualmente lo stesso tipo
  di calcolo a mano già visto per `df` nel metodo di Newton "puro" (vedi
  `argomenti/radici-equazioni/2024-09-13_grafico-zero-newton.md`), ma qui si
  deriva rispetto a `y` tenendo `t` fisso, non rispetto a `x`.
- `eulimp(f, T, y0, dfy, toll, nitmax)` → funzione **custom** dalla cartella
  `lib`, mai vista nei temi raccolti finora: implementa il metodo di Eulero
  implicito. Ha una "firma" più ricca di `heun`/`eulero` (serve anche la
  derivata e i parametri di arresto), ma restituisce comunque `T` e `Y`.
- Il resto (`YN = Y(end)`, `plot`+`legend`, `norm(...,inf)`) è identico agli
  altri esercizi di Cauchy già visti.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'equazione differenziale | `f = @(t,y) ...` **e** ricalcoli a mano `dfy` (derivata rispetto a y) |
| passo, tolleranza, iterazioni massime | `h`, `toll`, `nitmax` |
| chiede Eulero esplicito o Heun invece che implicito | usi `eulero(f,T,y0)` o `heun(f,T,y0)` — non serve più `dfy`, `toll`, `nitmax` in quel caso |

**Promemoria**: `eulimp` è una funzione **nuova** da aggiungere in `lib/`,
insieme a `newton.m`, `heun.m`, `bisezione.m`, `eulero.m`, `simpsc.m`.
