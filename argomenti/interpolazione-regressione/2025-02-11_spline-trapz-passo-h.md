# [Tema 11/02/2025] Spline lineare e trapezi su nodi con passo h fissato

## Testo originale (per cercarlo)
> Si calcoli I = ∫₀² f(x)dx con la funzione predefinita di Matlab. Si
> consideri il vettore z di punti equispaziati a distanza h=0.1
> nell'intervallo [0,2]. Si determini la spline lineare s(x) che interpola f
> nei punti di z, il valore assunto dalla spline nel punto di massimo di f
> (s(xmax)), l'errore |f(xmax)-s(xmax)|, l'approssimazione dei trapezi
> composita sui nodi z e l'errore rispetto a I.

*(Nota: `f`, `a`, `b`, `xmax`, `fxmax` sono definiti nell'esercizio sul
massimo — vedi
`argomenti/radici-equazioni/2025-02-11_massimo-newton-derivata-seconda.md`.)*

**Parole chiave**: integrale con funzione predefinita, spline lineare su
nodi a passo fisso (non `linspace`), valutazione spline in un punto
specifico, trapezi composita, più errori nella stessa tabella.

## Soluzione

```matlab
I = integral(f, 0, 2)

h = 0.1;
z = 0:h:2;
s = griddedInterpolant(z, f(z), 'linear');
sxmax = s(xmax)
err = abs(fxmax - sxmax)
It = trapz(z, f(z))
err2 = abs(I - It)
```

## Spiegazione riga per riga

- `I = integral(f, 0, 2)` → l'integrale "vero", schema standard già visto.
- `z = 0:h:2` → **novità rispetto agli altri esercizi**: qui i nodi non
  vengono generati con `linspace(a,b,n)` (dove scegli *quanti* punti vuoi),
  ma con la sintassi `inizio:passo:fine` (dove scegli *la distanza* `h` tra
  un punto e l'altro, e MATLAB calcola da sola quanti punti servono). Il
  testo dice esplicitamente "punti equispaziati a distanza h=0.1" — è questo
  il segnale per usare `:` invece di `linspace`.
- `s = griddedInterpolant(z, f(z), 'linear')` → spline lineare sui nodi
  `z`, stesso comando di sempre.
- `sxmax = s(xmax)` → valuta la spline nel punto di massimo trovato
  nell'esercizio precedente (non un punto medio generico: nota come il
  valore da usare dipende da un risultato calcolato altrove nello script).
- `err = abs(fxmax - sxmax)` → riusa `fxmax` già calcolato prima, invece di
  ricalcolare `f(xmax)` di nuovo — piccola ottimizzazione, non
  obbligatoria ma pulita.
- `It = trapz(z, f(z))` → i trapezi composita sugli stessi nodi `z` della
  spline (il testo lo richiede esplicitamente "sui nodi z").
- `err2 = abs(I - It)` → errore rispetto all'integrale vero.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| il passo h richiesto | solo `h` |
| chiede un numero di punti invece di un passo | usa `linspace(a,b,n)` invece di `a:h:b` |
| il punto in cui valutare la spline | cambia l'argomento di `s(...)` |
| non chiede il confronto con l'integrale vero | salti `I` e `err2`, tieni solo `It` |

**Concetto chiave**: `linspace(a,b,n)` e `a:h:b` sono due modi diversi di
generare la stessa cosa (un vettore di punti equispaziati) — la scelta tra i
due dipende da cosa ti dà il testo: un **numero di punti** → `linspace`; una
**distanza/passo** → `:`.
