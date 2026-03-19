# ============================================================================
# Project MIRACLE -- R Quick Start
# ============================================================================
# Prerequisites: tidyverse, haven, sf
#
# NOTE: Data files are not yet available. This script previews how the
# data will work once released (pilot: late 2026).
# ============================================================================

library(tidyverse)
library(sf)

# --- 1. Load core keys and demographics ---
keys <- read_csv("data/core_keys/miracle_core_keys.csv")
demo <- haven::read_dta("data/pilot/miracle_demographics.dta")
df <- left_join(keys, demo, by = "miracle_id")

# --- 2. Township population over time ---
df |> filter(muni == "남해군") |>
  ggplot(aes(year, pop, color = twp)) + geom_line()

# --- 3. Join to shapefiles and map ---
twp <- st_read("data/shapefiles/miracle_townships.geojson")
panel <- left_join(twp, demo, by = "miracle_id")
plot(panel["pop"])
