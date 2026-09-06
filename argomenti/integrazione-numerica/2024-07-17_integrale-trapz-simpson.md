# [Tema 17/07/2024] Integrale esatto vs trapezi vs Cavalieri-Simpson

## Testo originale (per cercarlo)
> Calcolare l'integrale I usando l'apposita funzione di Matlab. Approssimare
> I applicando la formula dei trapezi composta con 3 nodi equispaziati. Sia
> IT il valore calcolato. Approssimare I applicando la formula di Cavalieri
> Simpson composta suddividendo [0,1] in 2 sottointervalli di uguale
> ampiezza. Sia ICS il valore calcolato. Calcolare gli errori assoluti tra
> IT ed I e tra ICS ed I.

*(Nota: `f`, `a`, `b` sono definiti nell'esercizio sul polinomio interpolante
— vedi
`argomenti/interpolazione-regressione/2024-07-17_polinomio-interpolante-10-nodi.md`.)*

**Parole chiave**: integrale, `integral`, trapezi composita con un numero
specifico di nodi, formula di Cavalieri-Simpson composita, `simpsc`, errore
assoluto su più metodi di quadratura.

## Soluzione

```matlab
I = integral(f, a, b)

Tnodes = linspace(a, b, 3);
IT = trapz(Tnodes, f(Tnodes))

ICS = simpsc(a, b, 2, f)

errT = abs(I - IT)
errCS = abs(I - ICS)
```

## Spiegazione riga per riga

- `I = integral(f, a, b)` → l'integrale "vero" calcolato dal comando
  predefinito di MATLAB, usato come riferimento per i confronti — schema già
  visto altrove.
- `Tnodes = linspace(a, b, 3)` → qui la differenza rispetto agli esercizi
  precedenti su `trapz`: prima si usavano i nodi già calcolati da un metodo
  numerico (Heun/Eulero); qui invece si generano da zero **solo 3 nodi
  equispaziati**, appositamente per la formula dei trapezi.
- `IT = trapz(Tnodes, f(Tnodes))` → si valuta `f` in quei 3 nodi e si passa
  tutto a `trapz`, esattamente come sempre (la funzione non sa né le
  importa se i dati vengono da un metodo di Cauchy o da nodi creati
  apposta).
- `ICS = simpsc(a, b, 2, f)` → **funzione custom** (non di MATLAB) dalla
  cartella `lib`, mai vista prima nei temi raccolti finora: implementa la
  formula di quadratura di Cavalieri-Simpson composita. Le si passano gli
  estremi `a,b`, il numero di sottointervalli richiesto (qui `2`, come dice
  il testo), e la funzione `f`; restituisce il valore approssimato
  dell'integrale.
- `errT`, `errCS` → semplice differenza assoluta rispetto al valore
  "esatto" `I`, ripetuta per entrambi i metodi.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| la funzione o l'intervallo | `f`, `a`, `b` |
| il numero di nodi per i trapezi | il terzo argomento di `linspace(a,b,...)` |
| il numero di sottointervalli per Simpson | il terzo argomento di `simpsc(a, b, ..., f)` |
| chiede solo uno dei due metodi | calcoli solo la riga corrispondente e il relativo errore |
| non è disponibile `simpsc` in `lib` | va scritta a mano prima dell'esame (implementa la formula di Cavalieri-Simpson composita vista a lezione) o recuperata dai laboratori |

**Promemoria importante**: `simpsc` non compariva nei temi precedenti — è
una funzione **nuova** da aggiungere in `lib/` insieme a `newton.m`,
`heun.m`, `bisezione.m`, `eulero.m`. Se non l'hai mai vista a lezione,
chiedi al professore o a un compagno il codice di riferimento, perché
inventarla sotto esame sarebbe rischioso.
