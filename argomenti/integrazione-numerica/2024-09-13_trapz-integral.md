# [Tema 13/09/2024] Integrale con formula dei trapezi vs funzione esatta

## Testo originale (per cercarlo)
> Si approssimi l'integrale I = ∫₀¹ y(t) dt, dove y(t) è la soluzione esatta
> del problema di Cauchy assegnato, mediante la formula di quadratura dei
> trapezi composita, utilizzando le coppie di valori T,Y calcolati in
> precedenza. Si calcoli lo stesso integrale utilizzando la funzione
> predefinita di Matlab applicata alla funzione esatta nota. Si determini
> infine l'errore di approssimazione commesso.

**Parole chiave**: integrale, quadratura, formula dei trapezi composita,
`trapz`, `integral`, dati discreti vs funzione esatta, errore di
approssimazione.

*(Nota: `T`, `Y`, `sol` sono definiti nell'esercizio sull'equazione
differenziale — vedi
`argomenti/equazioni-differenziali/2024-09-13_cauchy-heun.md`.)*

## Soluzione

```matlab
It = trapz(T, Y)
I = integral(sol, 0, 1)
err = abs(I-It)
```

## Spiegazione riga per riga

- `trapz(T, Y)` → calcola l'integrale usando **solo i dati discreti** `T,Y`
  che hai già (formula dei trapezi composita, come richiesto dal testo). Non
  serve conoscere la formula esatta della funzione per usarlo — funziona con
  una tabella di punti qualsiasi.
- `integral(sol, 0, 1)` → comando **predefinito** di MATLAB, molto più
  preciso, che calcola l'integrale di una funzione **esplicita** (`sol`) tra
  due estremi. Si può usare qui perché il testo dà la soluzione esatta —
  normalmente questo confronto non sarebbe possibile.
- `err = abs(I - It)` → differenza tra i due risultati.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| gli estremi di integrazione | gli argomenti `0, 1` in `integral(sol, ...)`, e i dati `T,Y` devono coprire lo stesso intervallo |
| non è nota la funzione esatta | usi solo `trapz`, non puoi calcolare `I` con `integral` né l'errore |
| chiede la formula di Simpson invece dei trapezi | comando diverso (verifica se in `lib` c'è una funzione tipo `simpson`, altrimenti MATLAB non ha un equivalente diretto a `trapz` per Simpson) |
| i dati `T,Y` vengono da un metodo diverso da Heun | non cambia nulla in questo pezzo: `trapz` lavora su qualsiasi coppia di vettori `T,Y` |

**Concetto chiave**: `trapz` si usa quando hai solo punti discreti
(tabulari); `integral` si usa quando hai la formula esplicita di una
funzione. La scelta dipende da cosa hai a disposizione, non dalla difficoltà
del calcolo.
