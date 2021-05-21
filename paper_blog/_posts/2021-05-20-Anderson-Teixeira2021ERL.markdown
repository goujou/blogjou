---
layout: paper_blog_post
title: "Carbon cycle in mature and regrowth forests globally"
date: 2021-05-20
doi: 10.1088/1748-9326/abed01
author:
        - Kristina J. Anderson-Teixeira
        - Valentine Herrmann
        - Rebecca Banbury Morgan
        - Ben Bond-Lamberty
        - Susan C. Cook-Patton
        - Abigail E. Ferson
        - Helene C. Muller-Landau
        - Maria M. H. Wang
---
The authors compile the [Global Forest Database (ForC)](http://doi.org/10.5281/zenodo.4571538) to provide a macropscopic overview of the C cycle in the world's forests.
They compute the mean and standard deviation of 24 flux and stock variables (no soil variables) for mature and regrown (age < 100 years) forests.
C cycling rates decrease from tropical to temperate to boreal forests.
The majority of flux variables, together with most live biomass pools, increased significantly with the logarithm of stand age.

## 1. Introduction
- forests photosynthesize 69 GtC/year, leading to being a C sink accounting for 29% of fossil fuel emissions (problem: deforestation)
- regrowth (= secondary) forests become increasingly important
- biomes: categories for different climate and vegetation
- NEP = GPP - $R_{\text{eco}}$: net ecosystem production = gross primary production - total ecosystem respiration
- biomass accumulation increases rapidly in young forests, followed by a slow decline to near zero in old forests

## 2. Methods and design
- synthesis of many existing databases with the goal of understanding how C cycle varies depending on location and stand age
- R scripts and manual edits
- **unit dry organic matter converted to C by C=0.47 OM (IPCC, 2018)**
- 4 biome types (tropical broadleaf, temperate broadleaf, temperate needleleaf, boreal needleleaf) and 2 age classes (young, mature)
- C budget assumed closed if mean of components summed to within one standard deviation of the aggregate variable
- effect of stand age tested by using mixed effects models
- logarithmic fit also due to lack of sufficient data to use more parameters

## 3. Review results and synthesis
- mature forests:
    - fluxes: tropical > temperate > boreal
    - NEP: no significant trend
    - mean stocks: tropical > temperate > boreal
    - max. stocks in temperate biomes
- young forests:
    - fluxes and stocks increase with $log_{10}$ of age
    - fluxes: tropical > temperate > boreal
    - NEP: temperate > boreal
    
## 4. Discussion
- variation in NPP in mature forests less controlled by climate, more by moderate disturbance and $R_{\text{soil}}$ vs C inputs
- organic layer (OL) highest in boreal forests due to slow decomposition
- NEP increases for first 100 years
- future forest C cycling will shape climate (Song et al. 2019, Schimel et al. 2015)
- ForC contains ground data for variables that cannot be measured (at least directly) remotely, such as respiration fluxes

## 5. Conclusions
- loss of biomass from mature forests cannot be recovered on time scales relevant for mitigating climate change
- conservation of mature forests most important

## Ideas
> By definition, future projections extend our existing observations and understanding to conditions that do not currently exist on Earth (Bonan and Doney 2018, Gustafson et al 2018, McDowell et al 2018).
> To ensure that models are giving the right answers for the right reasons (Sulman et al 2018), it is important to benchmark against multiple components of the C cycle that are internally consistent with each other (Collier et al 2018, Wang et al 2018).

**What about applying information partitioning to ForC?**

