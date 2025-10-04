# Project 7 – Data Types and Data Import

Welcome to Project 7! This repo is pre-scaffolded for GitHub Classroom. You will write all of your code in **`project7.R`** and commit/push your work.

## Repo Layout
```
.
├── project7.R          # Starter R script – do all your work here
├── data-raw/           # Input data (provided by instructor)
│   ├── cat-lovers.csv
│   ├── nobel.csv
│   └── sales.xlsx
├── data/               # Your outputs (you create these)
│   ├── nobel_stem.csv
│   └── nobel_nonstem.csv
├── README.md           # This file
├── rubric.md           # How this project will be graded
├── .gitignore          # Standard R ignores
└── Project7.Rproj      # Optional RStudio project file
```

> If any of the input files are missing, sync/pull from GitHub first. If they’re still missing, contact your instructor.

## Getting Started
1. **Clone** your GitHub Classroom repository (Open in RStudio if you use it).
2. Open **`project7.R`** and follow the TODOs.
3. Make sure the `data-raw/` folder contains:
   - `cat-lovers.csv`
   - `nobel.csv`
   - `sales.xlsx`
4. If you create any files, write them to the **`data/`** folder.

## What You’ll Do
### Q1 – Importing & Cleaning
- Read `data-raw/cat-lovers.csv`.
- Clean obvious issues (types, trimming, missing values).
- Compute average, min, and max cats per person.
- Print a short report.

### Q2 – Data Conversion
For each vector, guess the type, then verify with `typeof()` and `class()`. Note anything surprising.
```r
c(1, 1L, "C")
c(1L / 0, "A")
c(1:3, 5)
c(3, "3+")
c(NA, TRUE)
```

### Q3 – Import & Export
- Read `data-raw/nobel.csv`.
- Split into:
  - `nobel_stem` – Physics, Medicine, Chemistry, Economics
  - `nobel_nonstem` – everything else
- Write to `data/nobel_stem.csv` and `data/nobel_nonstem.csv`.

> Hint: Use `%in%` in `dplyr::filter()`.

### Q4 – Import & Clean Excel
- Read `data-raw/sales.xlsx`.
- Clean/reshape to match the target structure shown in class (column names, types, arrangement).
- (Optional) Save a cleaned CSV to `data/sales_clean.csv`.

## How to Run
- Source the whole script:
  - RStudio: **Run All** (Ctrl/Cmd + Shift + Enter)
  - Base R: `source("project7.R")`
- Or run sections line-by-line.

## Submission
1. **Commit** your changes with informative messages.
2. **Push** to GitHub.
3. Confirm your work appears on GitHub (check `project7.R` and any output CSVs).

## Troubleshooting
- **File not found**: check your working directory and folder names; run `getwd()`.
- **Package not found**: install with `install.packages("readr")` (etc.).
- **CSV writing fails**: create `data/` first (the script will do this automatically).

Good luck, and commit early/often!
