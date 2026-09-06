# [Tema 18/06/2025] Integrale con formula dei trapezi su dati Heun molto fitti

## Testo originale (per cercarlo)
> Si approssimi l'integrale I = ∫₀¹⁰ y(t)dt con la formula dei trapezi
> composita usando i valori approssimati di y forniti dal metodo di Heun per
> h = 0.0001. Si riporti il valore calcolato in format long.

*(Nota: `f`, `t0`, `tmax`, `y0` sono definiti nell'esercizio sul metodo di
Heun — vedi
`argomenti/equazioni-differenziali/2025-06-18_heun-tabella-errori-ordine.md`.)*

**Parole chiave**: integrale, quadratura, trapezi composita, `trapz`, dati
generati da un metodo numerico (non da una funzione esatta), `format long`.

## Soluzione

```matlab
format long;
h = 0.0001;
T = t0:h:tmax;
[T, Y] = heun(f, T, y0);
IT = trapz(T, Y)
```

## Spiegazione riga per riga

- `format long` → il testo chiede il risultato in questo formato (15 cifre
  decimali) — diverso da `format short e` visto in altri esercizi, va sempre
  guardato con attenzione perché richiesto punto per punto nel testo.
- `h = 0.0001` → il passo specifico richiesto per questo integrale (il più
  fitto tra quelli usati nell'esercizio precedente sulla tabella errori).
- `T = t0:h:tmax; [T, Y] = heun(f, T, y0);` → ricalcola la soluzione
  approssimata con Heun a questo passo specifico (stessa logica già vista
  altrove, ripetuta qui perché il testo chiede esplicitamente `h=0.0001`).
- `trapz(T, Y)` → calcola l'integrale usando i dati discreti appena
  calcolati, con la formula dei trapezi composita — stesso comando già visto
  nel tema di settembre.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| il valore di h richiesto per l'integrale | solo `h` |
| chiede anche il confronto con l'integrale esatto (se nota la soluzione) | aggiungi `integral(sol, t0, tmax)` e il calcolo dell'errore, come nel tema del 13/09/2024 (vedi `argomenti/integrazione-numerica/2024-09-13_trapz-integral.md`) |
| il formato di visualizzazione richiesto | cambi `format long` con quello richiesto |

**Nota**: qui non c'è confronto con un integrale "vero" calcolato da
`integral` — il testo chiede solo il valore approssimato via trapezi. Se in
un'altra variante fosse richiesto anche il confronto, basta aggiungere le
righe già viste nell'altro esercizio collegato sopra.
