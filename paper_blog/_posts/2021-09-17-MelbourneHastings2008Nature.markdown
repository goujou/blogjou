---
title: "Extinction risk depends strongly on factors contributing to stochasticity"
date: 2021-09-14
doi: 10.1038/nature06922
author:
    - Brett A. Melbourne
    - Alan Hastings
---
Extinction depends on four kinds of stochasticity.
Models that do not incorporate all four kinds might greatly undererstimate extinction risks.

## General situation
Four categories of stochasticity:
- **demographic stochasticity**: birth and death at the level of individuals (stochasticity underlying equal production rates)
- **environmental stochasticity**: variation in population-level birth and death rates among times or locations
- the sex of individuals
- **demographic heterogeneity**: variation in vital rates among individuals within a population (e.g. individuals of different size might have different mating chances/reproduction rates)

- often demographic stochasticity dominates environmental stochasticity (see Southern fulmar example in George's paper)
- the first stochastic models showed that populations could become extinct even if deterministic models concluded they would persist indefinitely
- long term growth rate of stochastic population differs from deterministic population
- in small populations demographic stochasticity becomes more important because of potential dramatic effects in individual level that would cancel out in larger populations
- in large populations environmental stochasticity might be dominant because the whole population is affected at once
- strictly speaking: stochastic isex determination $\subset$ demographic heterogeneity $\subset$ demographic stochasticity
- most current (as of 2008) models of extinction risk include only females
    - but: stochastic sex ratio can increase variation in population growth above the demographic effects of femals alone
    - males contribute to density regulation; lack of males reduces female mating success
- **demographic variance** $\supset$ demographic stochasticity $+$ sex ratio stochasticity $+$ demographic heterogeneity
- demographic heterogeneity can affect demogrpahic variance in either direction and thus increase or decrease the extinction risk

## Modeling
- usually deterministic skeleton (often Ricker model) plus noise
- here: stochastic Ricker model, all four stochastic categories directly involved (no determinstic plus noise, but immediately stochastic)
    - compare: exponential lifetime distribution nearly impossible to model by determinstic mean plus a stochastic noise
- variance of individuals in next generation increases with additional stochasticity sources
- classical Poisson-Ricker model (pure demographic stochasticity) has lowest variance: great potential for underestimation of extinction risk
- if total variance is held constant:
    - environmental stochasticity: maximum variance in number of individuals in next generation as in the deterministic case (equilibrium), variance parameter is density independent
    - demographic stochasticity: maximum variance further left, at lower population size; higher risk of extiction; variance parameter density dependent
- not only increases the variance of number of individuals in the next generation with increasing stochasticity, the point of maximum variance moves further left and sets smaller populations at even higher risk of extinction
- higher reproduction rate $R$ also increases contribution of nonlinear dynamics to variance in population fluctuations which has a negative effect on survival (if $R$ greater than Ricker bifurcation point, even drastically)

## Incubation experiment
- model with all four sources of stochasticity fitted best
- classical model with only demographic stochasticity fitted worst
- demographic heterogeneity dominated environmental stochasticity
    - models without demographic heterogeneity absorb it in the variance parameter of environmental stochasticity and attribute the effect wrongly

## Results
- species currently regarded at risk from environmental stochasticity might be at much higher (undetected) risk from demographic stochasticity
- specifically important for small populations
