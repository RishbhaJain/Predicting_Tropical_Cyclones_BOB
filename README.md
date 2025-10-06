# Tropical Cyclone Prediction Project

This repository contains research work on **Tropical Cyclone (TC) prediction** using machine learning techniques, specifically focusing on the Bay of Bengal (BOB) region. The project involves data analysis, feature engineering, and predictive modeling for tropical cyclone occurrence and intensity prediction.

## Project Overview

This project aims to predict tropical cyclone occurrence and intensity in the Bay of Bengal region using various meteorological parameters including:
- Geopotential height data
- Mean sea level pressure (MSL)
- Relative humidity
- Wind patterns (zonal and meridional)

## Project Structure

### 📊 Data Files
- **`cons_true.csv`** - Historical tropical cyclone data with coordinates, dates, and intensity grades
- **`master_cons.csv`** - Processed dataset combining geopotential and MSL data with cyclone occurrence labels
- **`monthlydates.csv`** - Monthly time series data for cyclone occurrence
- **`combined_*.csv`** - Combined datasets for different prediction scenarios (45, 60, 85)
- **`test_pred_*.csv`** - Test prediction results for different models
- **`*.nc`** - NetCDF files containing meteorological data (geopotential height, sea level pressure)

### 🔬 Analysis Scripts

#### MATLAB Scripts
- **`ddp_prediction.m`** - Main prediction script for data processing and model training
- **`matprog.m`** - Data preprocessing and feature extraction
- **`test.m`** - Simple test script for data manipulation
- **`trial_*.m`** - Experimental scripts for model testing

#### R Scripts
- **`logistic_reg (1).R`** - Logistic regression implementation for cyclone prediction
- **`LSTM_(Ihope).R`** - LSTM neural network implementation
- **`map.R`** - Geographic visualization and spatial analysis
- **`logreg_int_grade.R`** - Logistic regression for intensity grade prediction

#### Python Scripts
- **`ME16B162_Assignment.py`** - Thermal and fluid systems analysis (separate project)
- **`Untitled4.py`** - Basic Keras/TensorFlow setup

### 📈 Results and Visualizations
- **`*.png`** - Generated plots and visualizations
  - `areal distribution.png` - Spatial distribution of cyclones
  - `Geo_ACF.png`, `msl_acf.png` - Autocorrelation function plots
  - `high_grade.png` - High-intensity cyclone analysis
  - `Model prediction with time.png` - Time series predictions

### 📚 Documentation
- **`IITM_Thesis_format_draft1.pdf`** - Thesis draft
- **`Rishbha_Thesis_FinalReview.pdf`** - Final thesis review
- **`Presentation No.1 (3).ppt`** - Research presentation
- **`ME16B162_thermal.pdf`** - Thermal systems assignment

### 🔬 Research Papers
- **`1-s2.0-S0187623617300115-main.pdf`** - Research paper on tropical cyclone activity
- **`Bandyopadhyay, B. K._Mohapatra, M._Rathore, L. S - Tropical cyclone activity over the North Indian Ocean-Springer International Publishing (2017).pdf`** - Springer publication
- **`Impact_of_sea_surface_temperature_in_modulating_mo.pdf`** - SST impact analysis
- **`painless-conjugate-gradient (1).pdf`** - Mathematical optimization reference

## Key Features

### Data Processing
- **Temporal Analysis**: Monthly time series data from 1982-2019
- **Spatial Analysis**: Geographic distribution of cyclones in Bay of Bengal
- **Feature Engineering**: 12-month lag features for geopotential and MSL data
- **Data Validation**: Cross-validation and temporal splitting

### Machine Learning Models
1. **Logistic Regression**: Binary classification for cyclone occurrence
2. **LSTM Networks**: Time series prediction for cyclone intensity
3. **Ensemble Methods**: Combined predictions from multiple models

### Performance Metrics
- **Accuracy**: Model prediction accuracy
- **ROC Curves**: Receiver Operating Characteristic analysis
- **Confusion Matrices**: Classification performance evaluation
- **Temporal Validation**: Time-based cross-validation

## Data Sources

- **Cyclone Track Data**: IMD (India Meteorological Department) best track data
- **Meteorological Data**: ERA-Interim reanalysis data
- **Climate Data**: CMIP5 climate model outputs

## Usage

### Prerequisites
- MATLAB (for data processing)
- R (for statistical analysis and machine learning)
- Python (for advanced ML models)
- Required R packages: `caret`, `ROCR`, `R.matlab`, `dplyr`, `ggplot2`

### Running the Analysis
1. **Data Preprocessing**: Run `matprog.m` to process NetCDF files
2. **Feature Engineering**: Execute `ddp_prediction.m` for data preparation
3. **Model Training**: Use `logistic_reg (1).R` for logistic regression
4. **Visualization**: Run `map.R` for geographic analysis

## Results

The project demonstrates:
- **Spatial Patterns**: Cyclone distribution in Bay of Bengal
- **Temporal Trends**: Seasonal and inter-annual variability
- **Predictive Performance**: Model accuracy for cyclone occurrence
- **Intensity Classification**: Grade prediction for cyclone intensity

## File Organization

### Files to Include in GitHub
- All `.m`, `.R`, `.py` scripts
- `README.md` and documentation
- Sample data files (smaller datasets)
- Generated visualizations (`.png` files)

### Files to Exclude from GitHub
- Large NetCDF files (`.nc`)
- Large CSV files with raw data
- Temporary files (`~$*`)
- Binary files (`.mat`, `.xlsx`, `.docx`)
- PDF files (research papers)

## Contributing

This is a research project. For questions or collaboration, please contact the research team.

## License

This project is for academic research purposes.

---

**Note**: This project focuses on tropical cyclone prediction in the Bay of Bengal region using machine learning techniques. The work includes data preprocessing, feature engineering, and multiple predictive models for both occurrence and intensity prediction.
