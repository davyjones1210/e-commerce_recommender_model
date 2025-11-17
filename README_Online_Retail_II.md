# Online Retail II Dataset - Reorganized Structure

This document describes the reorganization of the Online_Retail_II directory into a standardized project layout.

## New Directory Structure

The files from the `Online_Retail_II/` directory have been reorganized into the following structure:

```
├── data/
│   ├── raw/              # Original, immutable data files
│   │   ├── combined_unique.csv
│   │   ├── combined_unique.xlsx
│   │   └── online_retail_II.xlsx
│   ├── processed/        # Cleaned and processed data files
│   │   ├── unique_stockcodes_per_invoice.xlsx
│   │   └── Invoice_wise_item_count.csv
│   └── sql/             # SQL scripts and queries
│       └── Invoice_wise_items.sql
├── experiments/         # Jupyter notebooks for experiments and analysis
│   ├── 1_apriori_only.ipynb
│   ├── 2_collaborative_only.ipynb
│   ├── 3_content_only.ipynb
│   ├── 4_RFM_only.ipynb
│   ├── 5_ensemble_only.ipynb
│   ├── 6_final_model_compiled.ipynb
│   ├── final_model_compiled.ipynb
│   ├── ensemble_model_V1.ipynb
│   └── code_eda.ipynb
├── models/              # Trained models and model artifacts
├── reports/             # Documentation, notes, and analysis reports
│   ├── Daily_Notes.md
│   └── Website traffic funnel.xlsx
└── src/                 # Source code for the project
```

## File Mapping

The following files were moved from `Online_Retail_II/` to their new locations:

### Raw Data
- `combined_unique.csv` → `data/raw/combined_unique.csv`
- `combined_unique.xlsx` → `data/raw/combined_unique.xlsx`
- `online_retail_II.xlsx` → `data/raw/online_retail_II.xlsx`

### Processed Data
- `unique_stockcodes_per_invoice.xlsx` → `data/processed/unique_stockcodes_per_invoice.xlsx`
- `Invoice_wise_item_count.csv` → `data/processed/Invoice_wise_item_count.csv`

### SQL Files
- `Invoice_wise_items.sql` → `data/sql/Invoice_wise_items.sql`

### Experiments (Notebooks)
- `1_apriori_only.ipynb` → `experiments/1_apriori_only.ipynb`
- `2_collaborative_only.ipynb` → `experiments/2_collaborative_only.ipynb`
- `3_content_only.ipynb` → `experiments/3_content_only.ipynb`
- `4_RFM_only.ipynb` → `experiments/4_RFM_only.ipynb`
- `5_ensemble_only.ipynb` → `experiments/5_ensemble_only.ipynb`
- `6_final_model_compiled.ipynb` → `experiments/6_final_model_compiled.ipynb`
- `final_model_compiled.ipynb` → `experiments/final_model_compiled.ipynb`
- `ensemble_model_V1.ipynb` → `experiments/ensemble_model_V1.ipynb`
- `code_eda.ipynb` → `experiments/code_eda.ipynb`

### Reports
- `Daily_Notes.md` → `reports/Daily_Notes.md`
- `Website traffic funnel.xlsx` → `reports/Website traffic funnel.xlsx`

## Using the Reorganization Script

A bash script `restructure_online_retail_ii.sh` is provided to automate the reorganization process. To use it:

```bash
# Make the script executable (if not already)
chmod +x restructure_online_retail_ii.sh

# Run the script
./restructure_online_retail_ii.sh
```

The script will:
1. Create the new directory structure
2. Move files using `git mv` to preserve Git history
3. Remove the empty `Online_Retail_II/` directory
4. Stage and commit all changes

## Git LFS Configuration

The `.gitattributes` file has been configured to track large data files in `data/raw/` using Git LFS (Large File Storage). This includes:
- All CSV files in `data/raw/` (e.g., `combined_unique.csv` - 85MB)
- All XLSX files in `data/raw/` (e.g., `combined_unique.xlsx` - 47MB, `online_retail_II.xlsx` - 44MB)

### Setting Up Git LFS

**Important**: Before pulling large files, ensure Git LFS is installed and configured:

```bash
# Install Git LFS (if not already installed)
# On Ubuntu/Debian:
sudo apt-get install git-lfs

# On macOS:
brew install git-lfs

# On Windows:
# Download and install from https://git-lfs.github.com/

# Initialize Git LFS in your repository
git lfs install

# Track large files (already configured in .gitattributes)
git lfs track "data/raw/*.csv"
git lfs track "data/raw/*.xlsx"

# Pull the large files
git lfs pull
```

### Why Git LFS?

Git LFS is recommended for this repository because:
- Several data files exceed 50MB (GitHub's large file warning threshold)
- Storing large binary files directly in Git can slow down clone and fetch operations
- Git LFS stores large files on a separate server and replaces them with small pointer files in the repository

## Benefits of This Structure

1. **Clear Separation of Concerns**: Raw data, processed data, experiments, models, and reports are in separate directories
2. **Git History Preserved**: Using `git mv` maintains the file history
3. **Standard Layout**: Follows common data science project conventions
4. **Scalability**: Easy to add new experiments, models, or data files
5. **Better Organization**: Makes it easier to navigate and understand the project structure
