# Boundary concordances and `miracle_id` (draft)

How `miracle_id` will handle South Korea's administrative boundary changes during 1960–1985.

> **Draft.** The identifier rules and the core keys layout below are a working design and may change before release. This document will be expanded as the concordance is finalised.

## Overview

South Korea's administrative geography changed substantially during the period covered by MIRACLE:

- **1963 reorganisation:** Major redrawing of metropolitan boundaries, creation of Busan as a directly governed city
- **1973 reorganisation:** Widespread township merges and splits across all provinces
- **Ongoing changes:** Smaller boundary adjustments, name changes, and promotions (township to town, county to city) throughout the period

## The `miracle_id` system

Each township is assigned a time-invariant `miracle_id` that tracks the unit through all boundary changes. The ID persists through:

- **Name changes**: the same geographic unit keeps the same ID
- **Merges**: the merged unit receives a new ID; the predecessor IDs are recorded
- **Splits**: each resulting unit receives a new ID; the parent ID is recorded

## Core keys file

The planned `data/core_keys/miracle_core_keys.csv` will contain the full concordance:

| Field | Description |
|-------|-------------|
| `miracle_id` | Time-invariant identifier |
| `province` | Province name (English) |
| `province_kr` | Province name (Korean) |
| `municipality` | Municipality name (English) |
| `municipality_kr` | Municipality name (Korean) |
| `township` | Township name (English) |
| `township_kr` | Township name (Korean) |
| `year_start` | First year this mapping is valid |
| `year_end` | Last year this mapping is valid |
| `predecessor_id` | Previous miracle_id (if boundary change) |
| `successor_id` | Next miracle_id (if boundary change) |
