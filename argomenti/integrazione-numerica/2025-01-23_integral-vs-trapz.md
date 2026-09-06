# [Tema 23/01/2025] Integrale: funzione predefinita vs trapezi composita

## Testo originale (per cercarlo)
> Si calcoli l'integrale ∫₀¹ y(t)dt, dove y(t) è la soluzione esatta,
> utilizzando la funzione apposita di Matlab, sia I il valore calcolato. Si
> approssimi lo stesso integrale mediante la formula dei trapezi composita,
> utilizzando le coppie di valori T,Y calcolati al punto precedente, sia IT
> il valore calcolato. Si calcoli infine l'errore di approssimazione
> |IT − I|.

*(Nota: `y` (soluzione esatta), `T`, `Y` sono definiti nell'esercizio su
Eulero esplicito — vedi
`argomenti/equazioni-differenziali/2025-01-23_eulero-esplicito.md`.)*

**Parole chiave**: integrale, `integral`, `trapz`, formula dei trapezi
composita, errore di approssimazione.

## Soluzione

```matlab
I = integral(y, 0, 1)
IT = trapz(T, Y)
err = abs(IT - I)
```

## Spiegazione

Identico allo schema visto nel tema del 13/09/2024 (vedi
`argomenti/integrazione-numerica/2024-09-13_trapz-integral.md`):
`integral(y, 0, 1)` calcola l'integrale della funzione **esatta** (comando
predefinito, preciso), `trapz(T, Y)` lo approssima usando solo i dati
discreti già calcolati con il metodo numerico (qui Eulero, nel tema di
settembre era Heun — non cambia nulla nell'uso di `trapz`), e la differenza
`abs(IT - I)` è l'errore commesso.

**Unica differenza rispetto a settembre**: qui il testo chiede prima `I`
(l'integrale "vero") e poi `IT` (l'approssimazione), invertendo l'ordine
rispetto a come erano nominate le variabili nell'altro tema — presta
attenzione a quale nome il testo assegna a quale valore, per evitare di
scambiarli nella risposta finale.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| gli estremi di integrazione | gli argomenti di `integral(y, ..., ...)`, e l'intervallo di `T,Y` deve corrispondere |
| non è nota la soluzione esatta | salti `I` e l'errore, calcoli solo `IT` con `trapz` |
| il metodo numerico usato per generare T,Y | non cambia nulla in questo pezzo: `trapz` lavora con qualsiasi `T,Y` |
