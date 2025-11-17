#!/usr/bin/env bash
set -euo pipefail

mkdir -p data/raw data/processed data/sql experiments models reports src

git mv -v Online_Retail_II/combined_unique.csv data/raw/ || mv -v Online_Retail_II/combined_unique.csv data/raw/
git mv -v Online_Retail_II/combined_unique.xlsx data/raw/ || mv -v Online_Retail_II/combined_unique.xlsx data/raw/
git mv -v Online_Retail_II/online_retail_II.xlsx data/raw/ || mv -v Online_Retail_II/online_retail_II.xlsx data/raw/

git mv -v Online_Retail_II/unique_stockcodes_per_invoice.xlsx data/processed/ || mv -v Online_Retail_II/unique_stockcodes_per_invoice.xlsx data/processed/
git mv -v Online_Retail_II/Invoice_wise_item_count.csv data/processed/ || mv -v Online_Retail_II/Invoice_wise_item_count.csv data/processed/

git mv -v Online_Retail_II/Invoice_wise_items.sql data/sql/ || mv -v Online_Retail_II/Invoice_wise_items.sql data/sql/

git mv -v Online_Retail_II/*.ipynb experiments/ || true

git mv -v Online_Retail_II/Daily_Notes.md reports/ || mv -v Online_Retail_II/Daily_Notes.md reports/
git mv -v "Online_Retail_II/Website traffic funnel.xlsx" reports/ || mv -v "Online_Retail_II/Website traffic funnel.xlsx" reports/

rmdir Online_Retail_II 2>/dev/null || true

git add -A
git commit -m "chore: reorganize Online_Retail_II into data/, experiments/, reports/, src/, models/"
