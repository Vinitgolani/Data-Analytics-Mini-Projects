-- DATA CLEANING
SELECT * FROM layoffS;

-- 1. REMOVE DUPLICATES
-- 2. STANDARDIZE THE DATA
-- 3. LOOK FOR NULL OR BLANK VALUES
-- 4. REMOVE COLS WHICH ARE NOT NECESSARY OR NEEDED

## Always create a copy of data and work on so that if you make a mistake you always have raw data 
## to undo that mistake.

-- Creating copy of raw data

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location,industry, total_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location,industry, total_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, 
total_laid_off, `date`, stage, country, 
funds_raised_millions) AS row_num
FROM layoffs_staging;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

-- Standardizing Data
## I noticed that company names have white space before them so lets trim it
## basically removing white spaces before company name

UPDATE layoffs_staging2
SET company = TRIM(company);

## SIMILARLY check every col's distinct value and try to find data to fix
## CHECKING for industry column

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

## found null, whitespace (no industry added), and three names for one industry i.e crypto, crypto currency and cryptocurrency
SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

## Similarly for stage
SELECT DISTINCT stage
FROM layoffs_staging
ORDER BY 1;

## stage only null as an error which we are going to deal with later

## Similarly for country
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

## TWo different entries for USA i.e 'United States' and 'United States.'
## updating it as USA

UPDATE layoffs_staging2
SET country = 'USA'
WHERE country LIKE 'United States%';

## Now the date is in wrong dtpye and wrong format
## changing the date format yyyy-mm-dd
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');
SELECT * 
FROM layoffs_staging2;

## Changing the dtype of date
ALTER TABLE layoffs_staging2
MODIFY `date` DATE;


