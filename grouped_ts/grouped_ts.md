Python 

https://twiecki.github.io/blog/2017/02/08/bayesian-hierchical-non-centered/

https://twiecki.github.io/blog/2014/03/17/bayesian-glms-3/

https://en.m.wikipedia.org/wiki/Bayesian_hierarchical_modeling

Evaluating your model with the data (performing hierarchical MCMC):
JAGS (http://mcmc-jags.sourceforge.net; can use stand-alone binary or interface with R)
STAN (http://mc-stan.org/documentation/; interfaces with R, Python, Julia, MATLAB)
Or write your own hierarchical MCMC code

Page 20

http://astrostatistics.psu.edu/RLectures/hierarchical.pdf


Page 29

Spatial Bayes; R package 

http://web2.uconn.edu/cyberinfra/module3/Downloads/Day%206%20-%20Hierarchical%20Bayes.pdf

hts: An R Package for Forecasting Hierarchical or Grouped Time Series

https://cran.r-project.org/web/packages/hts/vignettes/hts.pdf

Forecasting Time Series Groups in the tidyverse

https://cran.rstudio.com/web/packages/sweep/vignettes/SW01_Forecasting_Time_Series_Groups.html

The paper is organized as follows. In Section 2, we briefly review the bottom-up and optimal combination methods that are appropriate for a grouped time series. In Section 2.4, we present a parametric bootstrap method for constructing point-wise prediction intervals. Illustrated by the Australian infant mortality counts described in Section 3, we investigate the one-step-ahead to ten-step-ahead point forecast accuracy. We reveal the most accurate method in Section 4, and carry out a hypothesis testing procedure to examine if the differences in point forecast accuracy between methods are statistically significant. In Section 5, we investigate one-step-ahead to ten-step-ahead interval forecast accuracy. Also, we carried out a likelihood-ratio test to examine if the empirical coverage probability differs significantly from the nominal coverage probability at each horizon. Conclusions are given in Section 6, along with some thoughts on how the methods developed here might be further extended.

Implementation of the two grouped time-series methods are straightforward using the readily available R package hts (Hyndman et al. 2013). This package provides the point forecasts,
while the computational code for constructing point-wise prediction interval can be obtained upon request from the authors

http://www.cpc.ac.uk/docs/2013_WP40_Grouped_Time-Series_Forecasting_Shang_et_al.pdf

Grouped and hierarchical TS (matrices)

https://forecasters.org/wp-content/uploads/gravity_forms/7-2a51b93047891f1ec3608bdbd77ca58d/2014/07/Athanasopoulos_George_ISF2014.pdf

Lagging

https://stats.stackexchange.com/questions/25889/lagging-over-a-grouped-time-series/25892

Forecasting Method for Grouped Time Series with the Use of k-Means Algorithm

https://arxiv.org/pdf/1509.04705.pdf

Grouped functional time series forecasting: An application to age-specific mortality rates

https://arxiv.org/pdf/1609.04222.pdf

Fast computation of reconciled forecasts for hierarchical and grouped time series

https://robjhyndman.com/papers/hgts4.pdf

Grouped multivariate and functional time series forecasting: An application to annuity pricing

https://www.sciencedirect.com/science/article/pii/S016766871630484X

