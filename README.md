# Project MIRACLE

**The first comprehensive subnational economic panel for South Korea's
growth miracle (1960--1989).**

Township-level data on demographics, agriculture, industry, infrastructure,
public finance, and education -- digitised from municipal statistical yearbooks
held in Korean provincial archives.

[Website](https://miracle.bookangseol.com) ·
[Cite this project](#citation)

---

## Status

This repository will host the MIRACLE database upon release.
**No data files are available yet.**

| Release | Coverage | Modules | Target |
|---------|----------|---------|--------|
| **Pilot** | Gyeongbu corridor (~400 townships) | Demographics, Agriculture | Late 2026 |
| **Full** | National (~3,500 townships × 30 years) | All 9 modules | 2027--28 |

For early access or collaboration, contact [b.seol@lse.ac.uk](mailto:b.seol@lse.ac.uk).

[Module overview](docs/modules.md) · [Boundary concordances](docs/boundaries.md)

---

## Quick start (preview)

The examples below show how the data will work once released.
Data files are not yet included in this repository.

### Stata

```stata
* Load core keys and demographics
import delimited "data/core_keys/miracle_core_keys.csv", clear
merge 1:m miracle_id using "data/pilot/miracle_demographics.dta"

* Township population over time
xtset miracle_id year
xtline pop if muni == "남해군", overlay
```

### R

```r
library(tidyverse)
keys <- read_csv("data/core_keys/miracle_core_keys.csv")
demo <- haven::read_dta("data/pilot/miracle_demographics.dta")
df <- left_join(keys, demo, by = "miracle_id")

df |> filter(muni == "남해군") |>
  ggplot(aes(year, pop, color = twp)) + geom_line()
```

### Python

```python
import pandas as pd
keys = pd.read_csv("data/core_keys/miracle_core_keys.csv")
demo = pd.read_stata("data/pilot/miracle_demographics.dta")
df = keys.merge(demo, on="miracle_id")
```

Full examples: [`code/examples/`](code/examples/)

---

## Citation

```bibtex
@techreport{seol2026miracle,
  author      = {Seol, BooKang and Lee, Changkeun and Yang, Hyunjoo},
  title       = {Project {MIRACLE}: Subnational Economic Data for
                 South Korea's Developmental Period, 1960--1989},
  institution = {London School of Economics},
  year        = {2026}
}
```

---

## Team

**BooKang Seol** · LSE Dept. of International Development · [bookangseol.com](https://bookangseol.com)

**Changkeun Lee** · Korea Development Institute (KDI)

**Hyunjoo Yang** · Sogang University, Dept. of Economics

## Partners and Funders

KDI · LSE · Sogang University · STEG

## License

Data: [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
Code: MIT
