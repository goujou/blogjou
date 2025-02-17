---
title: "Land-use change emissions based on high-resolution activity data substantially lower than previously estimated"
date: 2024-05-02
doi: 10.1088/1748-9326/ac70d8
author:
    - R Ganzenmüller
    - S Bultan
    - K Winkler
    - R Fuchs
    - F Zabel
    - J Pongratz
---
## Abstract
- LULCCs contribute one third to cumulative anthropogenic CO$_2$ emissions from 1850 to 2019
- great important, high uncertainty
- integrate new high-resolution LULCC dataset (HILDA+) into BLUE
- lower $E_{LUC}$ compared to LUH2-based estimates
- decreasing global $E_{LUC}$ trends instead of increasing
- higher spatial resolution covers pristine-remaining areas better

## 1. Introduction
- net CO2 flux from land-use and land-cover change ($E_{LUC}$) is key component of global C cycle
- highly uncertain for many reasons
- HILDA+: Historic Land Dynamics Assessment, 1/100 x 1/100 degrees resolution
- allows BLUE to compare $E_{LUC}$ coming from different LULCC forcings, try to identify sources of uncertainty, candidates:
    - initialization time
    - spatial resolution to investigate role of successive transition
- BLUE compuationally efficient, hence high resolution of HILDA+ can be used
- 0.001 degrees would be even better for field-scale resolution of 1 ha
- satellite data cannot be used directly because of mix of anthropogenic and environmental effects
- **goal**: highlight spatial and temporal uncertainties in $E_{LUC}$ related to
    - LULCC reconstructions
    - resolution of LULCC forcing
    - initialization year

## 2. Methodology
- includes C transfer to pools of different lifetimes
- BLUE simulations with 3 different inputs (HILDA+ at 0.25 and 0.01 degrees, LUH2 at 0.25 degrees)
- with HILDA+ 0.25 four different initialization years: 1900, 1920, 1940, 1960
- more initialization dates with model HYDE3.2 based on LUH2
- HILDA+ does not provide information and wood harvest and does not distinguish between primary and secondary land, hence preprocessing required

## 3. Land-use change emission based on HILDA+ and LUH2
- divergent $E_{LUC}$ trends
- gross fluxes smaller with HILDA+
- lower resolution, higher component fluxes, lower resolution leads to much more in-cell transitions
- inititialization year leads to small changes if initialized at least 60 yr earlier

## 4. Discussion
- alignment of results depends on regions
- disagreement of LULCC datasets since 2000 needs to be solved
- implementation of shifting cultivation needs to be revised
- spatial resolution has significant influence
- effect of "successive transitions" probably also important for DGVMs and other BKMs
- initializiation of 60 years prior to analyzed period seems sufficient

## 5. Conclusions
...


