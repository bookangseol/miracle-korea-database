"""
Project MIRACLE -- Python Quick Start
Prerequisites: pandas, geopandas, matplotlib

NOTE: Data files are not yet available. This script previews how the
data will work once released (pilot: late 2026).
"""

import pandas as pd
import geopandas as gpd
import matplotlib.pyplot as plt

# --- 1. Load core keys and demographics ---
keys = pd.read_csv("data/core_keys/miracle_core_keys.csv")
demo = pd.read_stata("data/pilot/miracle_demographics.dta")
df = keys.merge(demo, on="miracle_id")

# --- 2. Township population over time ---
namhae = df[df.muni == "남해군"]
for twp, grp in namhae.groupby("twp"):
    plt.plot(grp["year"], grp["pop"], label=twp)
plt.legend()
plt.title("Population by Township, Namhae-gun")
plt.show()

# --- 3. Join to shapefiles and map ---
twp = gpd.read_file("data/shapefiles/miracle_townships.geojson")
panel = twp.merge(demo, on="miracle_id")
panel.plot(column="pop", cmap="Blues", legend=True)
plt.title("Township Population")
plt.axis("off")
plt.show()
