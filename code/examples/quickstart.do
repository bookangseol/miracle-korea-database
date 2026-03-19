* ============================================================================
* Project MIRACLE -- Stata Quick Start
* ============================================================================
* Prerequisites: Stata 15+, spmap (ssc install spmap)
*
* NOTE: Data files are not yet available. This script previews how the
* data will work once released (pilot: late 2026).
* ============================================================================

* --- 1. Load core keys and demographics ---
import delimited "data/core_keys/miracle_core_keys.csv", clear
merge 1:m miracle_id using "data/pilot/miracle_demographics.dta"

* --- 2. Township population over time ---
xtset miracle_id year
xtline pop if muni == "남해군", overlay

* --- 3. Join to shapefiles and map ---
* shp2dta using "data/shapefiles/miracle_townships.shp", ///
*     database(miracle_db) coordinates(miracle_coord) replace
*
* use miracle_db, clear
* merge 1:1 miracle_id using demographics_1970, keep(match)
* spmap pop_total using miracle_coord, id(_ID) ///
*     fcolor(Blues) ocolor(white) osize(vthin) ///
*     title("Township Population, South Korea 1970") ///
*     note("Source: Project MIRACLE (miracle.bookangseol.com)")
