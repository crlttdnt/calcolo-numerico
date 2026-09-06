# [Tema 18/06/2025] Heun con più passi, tabella errori e stima dell'ordine di convergenza

## Testo originale (per cercarlo)
> Si consideri il problema di Cauchy y'(t) = -3y(t) + t, 0≤t≤10, y(0)=0, la
> cui soluzione esatta è y(t) = 1/9(exp(-3t)-1) + 1/3 t.
> Approssimare il problema di Cauchy con il metodo di Heun. Calcolare
> l'errore relativo in norma infinito tra la soluzione esatta e quella
> approssimata. Eseguire prove per h = 0.1, 0.01, 0.001, 0.0001 e compilare
> la tabella. Dedurre dalla tabella l'ordine del metodo di Heun, motivando
> la risposta.

**Parole chiave**: problema di Cauchy, metodo di Heun, errore relativo,
norma infinito, più valori di h, ordine di convergenza di un metodo
numerico, retta di regressione in scala logaritmica.

## Soluzione

```matlab
f = @(t, y) -3*y + t;
t0 = 0;
tmax = 10;
y0 = 0;
y = @(t) 1/9 .* (exp(-3*t) - 1) + 1/3.*t;

H = [0.1 0.01 0.001 0.0001];
errs = zeros(1, length(H));
for i=1:length(H)
    h = H(i);
    T = t0:h:tmax;
    [T, Y] = heun(f, T, y0);
    errs(i) = norm(y(T) - Y, inf) / norm(y(T), inf);
end
[H' errs']

poly = polyfit(log(H), log(errs), 1);
order = poly(1)
```

## Spiegazione riga per riga

- `f`, `t0`, `tmax`, `y0`, `y` (soluzione esatta) → come nell'esercizio
  standard di Cauchy (vedi
  `argomenti/equazioni-differenziali/2024-09-13_cauchy-heun.md`), niente di
  nuovo qui.
- `H = [0.1 0.01 0.001 0.0001]` → il vettore con i 4 valori di passo
  richiesti dal testo — è la "colonna h" della tabella da compilare.
- `errs = zeros(1, length(H))` → prepara un vettore vuoto (di zeri) dove
  salvare l'errore corrispondente a ciascun `h`. Si usa spesso `zeros(...)`
  per "riservare spazio" prima di riempirlo in un ciclo.
- il ciclo `for i=1:length(H)` → per ogni valore di passo `h` nella lista:
  ricalcola i tempi `T`, risolve di nuovo il problema con Heun, e salva
  nell'`i`-esima posizione di `errs` l'**errore relativo** in norma
  infinito: `norm(errore_assoluto, inf) / norm(soluzione_esatta, inf)`.
  L'errore *relativo* (a differenza di quello assoluto visto nel tema di
  settembre) si ottiene semplicemente dividendo per la norma della
  soluzione esatta — utile quando i valori in gioco sono molto grandi o
  molto piccoli e l'errore "in assoluto" da solo dice poco.
- `[H' errs']` → il modo più veloce per costruire la tabella richiesta dal
  testo: trasponendo (`'`) i due vettori riga in colonne e accostandoli, si
  ottiene una tabella con `h` nella prima colonna ed errore nella seconda.
- `polyfit(log(H), log(errs), 1)` → è la parte concettualmente nuova. Si sa
  che l'errore di un metodo numerico di ordine `p` si comporta come
  `errore ≈ C · h^p` per una qualche costante `C`. Prendendo il logaritmo di
  entrambi i lati si ottiene `log(errore) = log(C) + p·log(h)`: questa è
  l'equazione di **una retta** in cui `p` è il coefficiente angolare. Per
  questo si fa un `polyfit` di grado 1 (una retta) tra `log(H)` e
  `log(errs)`: il primo coefficiente del risultato (`poly(1)`) è proprio la
  stima dell'ordine di convergenza `p`.
- `order = poly(1)` → il coefficiente angolare della retta, cioè l'ordine
  stimato del metodo (per Heun ci si aspetta un valore vicino a 2).

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'equazione differenziale o l'intervallo | `f`, `t0`, `tmax`, `y0`, `y` (soluzione esatta) |
| i valori di h da testare | il vettore `H` |
| chiede l'errore assoluto invece che relativo | togli la divisione per `norm(y(T), inf)` |
| chiede di stimare l'ordine di un altro metodo (Eulero, RK4...) | cambi solo quale funzione della cartella `lib` chiami dentro il ciclo, la logica di stima dell'ordine resta identica |
| chiede di disegnare l'errore invece di stimarne l'ordine | usi `loglog(H, errs)` invece di (o oltre a) `polyfit` sui logaritmi |

**Concetto chiave riutilizzabile**: `polyfit(log(x), log(y), 1)` è lo
schema generale per stimare l'esponente `p` di una relazione di potenza
`y ≈ C·x^p` a partire da dati sperimentali — non è specifico di Heun, torna
utile ogni volta che ti viene chiesto di "dedurre l'ordine" di un metodo
numerico qualsiasi.
