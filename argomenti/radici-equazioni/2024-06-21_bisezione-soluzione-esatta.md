# [Tema 21/06/2024] Radice della soluzione esatta con il metodo di bisezione

## Testo originale (per cercarlo)
> Si determini la radice α della soluzione esatta y(t) del problema di
> Cauchy precedente nell'intervallo [0,1] utilizzando il metodo di
> bisezione con tolleranza 1e-5.

*(Nota: `sol` (soluzione esatta) è definita nell'esercizio su Heun — vedi
`argomenti/equazioni-differenziali/2024-06-21_heun-valore-istante-specifico.md`.)*

**Parole chiave**: metodo di bisezione, radice della soluzione esatta di
un problema di Cauchy (non di una funzione data esplicitamente).

## Soluzione

```matlab
toll = 1e-5;
alpha = bisezione(sol, 0, 1, toll)
```

## Spiegazione

Stessa funzione custom `bisezione` già vista nel tema di giugno 2025 (vedi
`argomenti/radici-equazioni/2025-06-18_bisezione.md`), applicata qui a
`sol` (la soluzione esatta del problema di Cauchy, già definita come
funzione anonima nell'esercizio collegato) invece che a una funzione `f`
generica — stesso concetto già incontrato con Newton nel tema di luglio
2024 (vedi
`argomenti/radici-equazioni/2024-07-17_radice-soluzione-esatta-cauchy.md`):
una volta che una soluzione esatta è definita come funzione anonima,
MATLAB la tratta come una funzione qualsiasi, utilizzabile con `bisezione`,
`newton`, `fzero`, ecc.

## Cosa cambiare se il testo è diverso

| Cambia nel testo... | Tu modifichi... |
|---|---|
| l'intervallo di ricerca | i due estremi passati a `bisezione(sol, ..., ...)` |
| la tolleranza | `toll` |
| chiede Newton o `fzero` invece della bisezione | stesso principio, cambia solo quale funzione chiami (per Newton serve anche calcolare a mano la derivata di `sol`) |
