# Economic Forecasting in the Pet Food Industry

## Overview
This repository contains the work on time series forecasting to predict price trends within the pet food market using SARIMA and neural network models. The analysis is based on historical data from the U.S. Producer Price Index for Pet Food.

## Dataset
Monthly data from September 1985 to October 2022 was utilized, which was sourced from [Fred](https://fred.stlouisfed.org/series/xxxx). Data preprocessing included null value checks and normalization.

## Methodology
The approach encompassed:
- Baseline modeling with Naive and ETS methods.
- SARIMA after a Box-Cox Transformation for variance stabilization.
- Neural Networks, specifically a 4-2-1 architecture, to capture the complex patterns in the data.

## Results
Both the SARIMA(112)x(200) and neural network models provided accurate forecasts, with model selection guided by AIC and BIC metrics.

## Implications
The project's insights are aimed at guiding business strategy and investment decisions by forecasting market demand and pricing trends.

## Installation
Instructions on setting up the project environment and running the code can be found here.

## Usage
Examples of how to use the scripts and models are provided, including how to input new data and interpret the results.

## Contributing
Guidelines for contributing to this project are outlined, encouraging collaboration.

## License
Details about the licensing of this project can be found in the LICENSE file.
