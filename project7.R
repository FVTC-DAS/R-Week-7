# Project 7 – Data Types and Data Import
# Course: R Programming
# Student Name: ______________________
# GitHub Classroom: Fill in this file and push your commits.
#
# INSTRUCTIONS
# • Work in this script (project7.R). Do NOT rename the file.
# • Data files are provided in ./data-raw/: cat-lovers.csv, nobel.csv, sales.xlsx
# • If you create output files, write them to ./data/
# • Commit early and often; push when finished.
#
# PACKAGES -----------------------------------------------------------------
# If needed, uncomment install.packages() lines below.
# install.packages(c("readr","dplyr","tidyr","readxl"))
library(readr)
library(dplyr)
library(tidyr)
library(readxl)

# OPTIONAL: helpful printing
options(dplyr.width = Inf)

# PATHS --------------------------------------------------------------------
raw_dir  <- "data-raw"
out_dir  <- "data"
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

stopifnot(dir.exists(raw_dir))

# ==========================
# Q1. Importing & Cleaning
# ==========================
# Task:
# 1) Read data-raw/cat-lovers.csv
# 2) Fix any obvious data issues (types, trimming, NAs, etc.)
# 3) Compute average, minimum, and maximum number of cats per person

# TODO: read the csv
# Replace 'cat_count' and 'person' with the actual column names in your file.
cats <- read_csv(file.path(raw_dir, "cat-lovers.csv"), show_col_types = FALSE)

# TODO: quick peek
# glimpse(cats)

# TODO: clean data
# - Example ideas:
#   * rename columns
#   * convert counts to numeric
#   * handle missing or invalid values
#   * trim whitespace in character fields
# cats <- cats |>
#   rename(person = Person, cat_count = Cats) |>
#   mutate(cat_count = as.numeric(cat_count))

# TODO: compute summary stats (store in variables)
# avg_cats <- cats |>
#   summarize(avg = mean(cat_count, na.rm = TRUE)) |> pull(avg)
# min_cats <- cats |>
#   summarize(min = min(cat_count, na.rm = TRUE)) |> pull(min)
# max_cats <- cats |>
#   summarize(max = max(cat_count, na.rm = TRUE)) |> pull(max)

# TODO: print a brief report
# cat("\nQ1 Results:\n")
# cat("Average cats per person:", avg_cats, "\n")
# cat("Minimum cats per person:", min_cats, "\n")
# cat("Maximum cats per person:", max_cats, "\n")


# ==========================
# Q2. Data Conversion
# ==========================
# For each vector:
# 1) Write your guess of the type (comment)
# 2) Check with typeof() and class()
# 3) Brief comment if anything surprised you

v1 <- c(1, 1L, "C")
v2 <- c(1L / 0, "A")      # Note: 1L/0 yields Inf; mixing with character coerces
v3 <- c(1:3, 5)
v4 <- c(3, "3+")
v5 <- c(NA, TRUE)

# TODO: For each vector, record your guess, then print typeof() and class().
# Example:
# # v1 guess: ???
# typeof(v1); class(v1)
# # Notes: ???

# Repeat for v2–v5


# ==========================
# Q3. Import & Export Files
# ==========================
# Task:
# 1) Read data-raw/nobel.csv
# 2) Split into STEM (Physics, Medicine, Chemistry, Economics) and non-STEM
# 3) Write CSVs to ./data/: nobel_stem.csv and nobel_nonstem.csv

nobel <- read_csv(file.path(raw_dir, "nobel.csv"), show_col_types = FALSE)

# TODO: Identify the column that contains the prize category.
# Replace 'category' below with the correct column name (e.g., 'category' or 'prize').
category_col <- "category"   # <--- TODO: change if needed

STEM <- c("Physics", "Medicine", "Chemistry", "Economics")

# TODO: split the data
# If your column name differs, adjust across both pipelines.
nobel_stem <- nobel |>
  filter(.data[[category_col]] %in% STEM)

nobel_nonstem <- nobel |>
  filter(!.data[[category_col]] %in% STEM)

# TODO: write outputs
write_csv(nobel_stem, file.path(out_dir, "nobel_stem.csv"))
write_csv(nobel_nonstem, file.path(out_dir, "nobel_nonstem.csv"))


# ==========================
# Q4. Import & Clean Excel
# ==========================
# Task:
# 1) Read data-raw/sales.xlsx
# 2) Clean and reshape so it matches the target structure (per handout/screenshot)
#    * Common steps might include:
#      - rename columns
#      - convert types (dates, numeric)
#      - pivot_longer() or pivot_wider()
#      - separate() or unite() columns
#      - arrange() rows and select() final columns

# TODO: read excel (choose a sheet if necessary)
# sales_raw <- read_excel(file.path(raw_dir, "sales.xlsx"), sheet = 1)

# TODO: clean/transform
# sales_clean <- sales_raw |>
#   # Example transformations (adjust to your data):
#   # janitor::clean_names()  # optional; requires janitor package
#   # mutate(date = as.Date(date), amount = as.numeric(amount))
#   # pivot_longer(cols = starts_with("Q"), names_to = "quarter", values_to = "sales")
#   # arrange(year, quarter)
#   identity()

# TODO: (optional) write a cleaned version to ./data/
# write_csv(sales_clean, file.path(out_dir, "sales_clean.csv"))


# ==========================
# SUBMISSION CHECKLIST
# ==========================
# [ ] Q1: Summary stats computed and printed
# [ ] Q2: typeof()/class() results noted for each vector with brief comments
# [ ] Q3: nobel_stem.csv and nobel_nonstem.csv created in ./data/
# [ ] Q4: sales.xlsx read and transformed to target structure (and optionally saved)
# [ ] All changes committed and pushed to your GitHub repo

# END OF FILE
