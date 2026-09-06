# [Tema 23/01/2025] Polinomio interpolante, valutazione in un punto e grafico di confronto

## Testo originale (per cercarlo)
> Si consideri ancora il vettore z di 6 punti equispaziati nell'intervallo
> [0,2] e si determini il polinomio p che interpola f in tali punti. Si
> calcoli il valore assunto da tale polinomio nella radice α di f. Sia
> x=linspace(0,2) un vettore ausiliario di 100 punti equispaziati, si misuri
> l'errore di approssimazione commesso.

*(Nota: `f`, `a`, `b`, `alpha`, `z`, `r` sono definiti negli esercizi
collegati — vedi `argomenti/radici-equazioni/2025-01-23_fzero.md` e
`argomenti/interpolazione-regressione/2025-01-23_regressione-scarto-quadratico.md`.)*

**Parole chiave**: polinomio interpolante, `polyfit`, `polyval`, errore
massimo, grafico di confronto tra funzione/regressione/interpolazione,
`legend`.

## Soluzione

```matlab
p = polyfit(z, f(z), 5);
palpha = polyval(p, alpha)
x = linspace(a, b, 100);
err = max(abs(f(x) - polyval(p, x)))

plot(x, f(x), x, polyval(r, x), x, polyval(p, x))
legend('exact', 'regression line', 'polyfit')
```

## Spiegazione riga per riga

- `p = polyfit(z, f(z), 5)` → il polinomio che passa esattamente per i 6
  punti di `z`. Il grado è `5` perché con 6 punti serve grado `6-1=5` (stessa
  regola vista altrove — qui scritto come numero fisso perché il testo dice
  esplicitamente "6 punti", ma potresti scrivere `length(z)-1` per renderlo
  automatico se il numero di punti cambia).
- `palpha = polyval(p, alpha)` → il polinomio valutato nella radice `alpha`,
  esattamente come fatto con la retta di regressione nell'esercizio
  collegato — nota il parallelo tra i due esercizi.
- `x = linspace(a, b, 100)` → i 100 punti ausiliari richiesti dal testo per
  misurare l'errore (nota: qui uso `a,b` già definiti prima, il testo scrive
  `linspace(0,2)` esplicitamente ma è la stessa cosa).
- `err = max(abs(f(x) - polyval(p, x)))` → l'errore massimo tra funzione
  vera e polinomio, sui 100 punti — stesso schema visto nel tema di
  settembre.
- `plot(x, f(x), x, polyval(r,x), x, polyval(p,x))` → disegna **tre** curve
  sullo stesso grafico in un'unica chiamata a `plot`: bastano coppie
  `(x_valori, y_valori)` una di seguito all'altra. Qui: funzione esatta,
  retta di regressione, polinomio interpolante, tutte valutate sulla stessa
  griglia `x` di 100 punti.
- `legend(...)` → assegna un'etichetta a ciascuna delle tre curve, nello
  stesso ordine in cui sono state passate a `plot`.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| il numero di punti di interpolazione | il grado in `polyfit` (sempre `numero_punti - 1`) |
| il punto di valutazione | l'argomento di `polyval(p, ...)` |
| non chiede il grafico di confronto | salti le ultime due righe |
| chiede di confrontare solo due curve, non tre | togli la coppia corrispondente da `plot` e l'etichetta corrispondente da `legend` |

**Concetto chiave**: `plot` accetta tutte le coppie `(x,y)` che vuoi in
un'unica chiamata, sovrapponendo automaticamente le curve — non serve
`hold on` se le passi tutte insieme così (serve invece se le disegni con
chiamate separate a `plot` in righe diverse).
