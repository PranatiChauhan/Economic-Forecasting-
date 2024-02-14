Economic Forecasting in the Pet Food Industry
Overview
This project aimed to predict price changes in the pet food industry using time series forecasting. We used SARIMA and neural network models to analyze the Producer Price Index for Pet Food in the U.S., with a focus on providing actionable insights for investors and businesses.

Dataset
The dataset, sourced from Fred, includes monthly observations of the Producer Price Index from September 1985 to October 2022. The data was preprocessed and checked for null values before analysis.

Methodology
We explored several models, including:

Naive and ETS methods for initial benchmarks.
SARIMA models after performing a Box-Cox Transformation to stabilize variance and make the series more normally distributed.
Neural Networks with a focus on a 4-2-1 architecture to accommodate the complexity of the data.
Results
The SARIMA(112)x(200) model and the neural network both showed promising results. The best model was selected based on the Akaike Information Criterion (AIC) and Bayesian Information Criterion (BIC) values.

Implications
The forecast provided by the models can help in strategic decision-making, such as:

Adjusting prices in response to predicted market trends.
Understanding the potential impact on consumers' purchasing power.
Assisting investors in making informed decisions about their investments in the industry.
