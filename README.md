# MIRACLE

MIRACLE reconstructs the local economic histories of growth miracles, starting with South Korea. The first phase turns about two million pages of municipal statistical yearbooks, printed in mixed Hangul–Hanja, into the first consistent township-year economic panel for 1960–1985.

> **Work in progress.** No data has been released yet, and this repository holds no data files. The documentation describes plans and drafts, which may change before release.

[Project website](https://miracle.bookangseol.com) · [Coverage map](https://miracle.bookangseol.com/dashboard/) · [Request access](#access)

- **Period:** 1960–1985, annual
- **Unit:** township (읍·면), on time-consistent boundaries
- **Source:** municipal statistical yearbooks (통계연보), about two million pages
- **Pilot:** late 2026, about 400 townships along the Gyeongbu Expressway corridor
- **Funding:** LSE and STEG

## Current status

As of October 2026, 3,249 (75%) of the 4,356 yearbooks expected for 1960–1985 have been scanned. A copy of a further 709 has been located, and 398 have not been found. The [coverage map](https://miracle.bookangseol.com/dashboard/) shows the status of every yearbook by municipality and year.

| Step | Status |
|---|---|
| 1. Finding the yearbooks | Done |
| 2. Scanning on site | Largely complete |
| 3. Reading the tables | Current focus |
| 4. Checking the numbers | Current focus |
| 5. Variable harmonisation | Current focus |
| 6. Boundary concordances | Pilot complete |
| 7. Geocoding and GIS | Pilot complete |

## Release plan

| Release | Coverage | Modules | Planned |
|---|---|---|---|
| Pilot | About 400 townships along the Gyeongbu Expressway corridor | Core Keys, Demographics, Agriculture | Late 2026, for researchers on request |
| Later releases | Nationwide | Industry, Infrastructure, Public Finance, Education and Geospatial in 2028; Institutions in 2029 | 2028–29 |

Each module will be a flat township-year panel in CSV, Stata and Python formats, with a codebook and variable documentation. The full panel will be released as a public resource. These are plans rather than commitments.

## How the data is built

![How MIRACLE reads two million pages](docs/img/pipeline.png)

Three pretrained open document-AI models read every page, with no training on our pages. Where they disagree, the table's own printed totals decide, and a frontier model reviews any remaining conflict without supplying numbers of its own. Research assistants check flagged cells and a random audit sample, so each release will report a measured error rate. A single identifier, `miracle_id`, follows each township through boundary changes, including the major reorganisations of 1963 and 1973.

## Documentation (drafts)

- [Pipeline](docs/pipeline.md): the seven steps from archive to panel
- [Modules](docs/modules.md): the nine planned modules
- [Boundaries and `miracle_id`](docs/boundaries.md): how townships are followed through boundary changes
- [Data](data/README.md): the planned file layout

## Access

The pilot release will be available to researchers on request. For early access, collaboration or questions, email [b.seol@lse.ac.uk](mailto:b.seol@lse.ac.uk).

## Team

- **Project lead:** [BooKang Seol](https://bookangseol.com), Department of International Development, LSE
- **Advisors:** [Changkeun Lee](https://changkeunlee.super.site/), KDI School of Public Policy and Management; [Hyunjoo Yang](https://sites.google.com/view/hyang), Department of Economics, Sogang University
- **Research associates:** Hoyeon Byun, SNU; Inhwan Park, Sogang University; Yoorim Son, Sogang University
- **Collaborating institutions:** KDI School of Public Policy and Management, Sogang University
- **Funded by:** LSE, STEG

## Licence

Data, once released: [CC BY-NC-SA 4.0](LICENSE). Code: [MIT](LICENSE-CODE).
