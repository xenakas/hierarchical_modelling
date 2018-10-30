# hierarchical_modelling



- [ ] [MCMC in 60 minutes](http://www.math.chalmers.se/~bodavid/GMRF2015/Lectures/F6slides.pdf)




- [ ] [R examples](http://www.rdatamining.com/examples/hierarchical-clustering)





- [ ] [Time Series Clustering/Classification](http://www.stat.unc.edu/faculty/pipiras/timeseries/Multivariate_6_-_Classification_Clustering_-_Menu.html#what_is_this_all_about)
similarity/distance measures, clustering algorithms, r tutorial



- [ ] [Forecasting analogous time series](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.519.6011&rep=rep1&type=pdf): Bayesian Pooling, Bayesian shrinkage, BVAR  


- [ ] [Forecasting international growth rates using Bayesian shrinkage and other procedures](https://www.sciencedirect.com/science/article/pii/0304407689900365): autoregressive-leading indicator (ARLI) 


- [ ] [Bayesian Forecasting for Seemingly Unrelated Time Series: Application to Local Government Revenue Forecasting](https://www.jstor.org/stable/2632644?seq=1#page_scan_tab_contents):
Kalman Filter,  Conditionally Independent Hierarchical method,  BVAR.  Time series forecasting of demand for goods or services
 often involves cases subject to structural change caused
 by external influences like business cycles or competi-
 tors' actions. Methods designed for such cases, like ex-
 ponential smoothing (Brown 1962) and the Multi-State
 Kalman Filter (MSKF) method (Harrison and Stevens
 1971), revise model parameter estimates over time.




- [ ] [Optimal combination forecasts for hierarchical time series](https://robjhyndman.com/papers/Hierarchical6.pdf):  bottom-up and optimal combination methods




- [ ] [Time-series clustering – Decade overview](https://www.sciencedirect.com/science/article/abs/pii/S0306437915000733) 


- [ ] [Forecasting Method for Grouped Time Series with the Use of k-Means Algorithm](https://arxiv.org/pdf/1509.04705.pdf)


- [ ] [Resampling Methods for Time Series](http://www-stat.wharton.upenn.edu/~stine/stat910/lectures/13_bootstrap.pdf)



- [ ] [Discussion: Bootstrap methods for dependent data: A review](http://mapageweb.umontreal.ca/goncals/documents/Goncalves-Politis-2011.pdf)


#### R Packages: 

- [hts](https://cran.r-project.org/web/packages/hts/vignettes/hts.pdf): An R Package for Forecasting Hierarchical or Grouped Time Series


- [stochvol](https://cran.r-project.org/web/packages/stochvol/stochvol.pdf): Efficient algorithms for fully Bayesian estimation of stochastic volatility (SV) models
via Markov chain Monte Carlo (MCMC) methods.

- [rjags](https://cran.r-project.org/web/packages/rjags/rjags.pdf): The rjags package provides an interface from R to the JAGS library for Bayesian data analysis.  JAGS is Just Another Gibbs Sampler. It is a program for analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC). 
JAGS uses Markov Chain Monte Carlo (MCMC) to generate a sequence of dependent samples
from the posterior distribution of the parameters.
JAGS is a clone of BUGS (Bayesian analysis Using Gibbs Sampling). 

- [rstanarm](https://cran.r-project.org/web/packages/rstanarm/rstanarm.pdf):  Estimates previously compiled regression models using the 'rstan'
package, which provides the R interface to the Stan C++ library for Bayesian
estimation. Users specify models via the customary R syntax with a formula and
data.frame plus some additional arguments for priors


- [bsts](https://cran.r-project.org/web/packages/bsts/bsts.pdf): Time series regression 
using dynamic linear models fit using MCMC. See Scott and Varian (2014) <DOI:10.1504/IJMMNO.2014.059942>.
e.g.: ``aggregate.time.series`` - [aggregate a fine time series to a coarse summary](https://www.rdocumentation.org/packages/bsts/versions/0.8.0/topics/aggregate.time.series),
similar to functions from the ``xts`` package, but it can handle aggregation from weeks to months.

- [dtwclust](https://cran.r-project.org/web/packages/dtwclust/dtwclust.pdf): time series clustering along with optimizations for the dynamic time warping distance.
Time series clustering along with optimized techniques related
to the Dynamic Time Warping distance and its corresponding lower bounds.
Implementations of partitional, hierarchical, fuzzy, k-Shape and TADPole
clustering are available. 

- [GeomComb](https://cran.r-project.org/web/packages/GeomComb/GeomComb.pdf):
Provides eigenvector-based (geometric) forecast
combination methods; also includes simple approaches (simple average,
median, trimmed and winsorized mean, inverse rank method) and regression-based
combination. Tools for data pre-processing are available in order to deal with
common problems in forecast combination (missingness, collinearity).


- [shrink](https://cran.r-project.org/web/packages/shrink/shrink.pdf): Baysian shrinkage, The predictive value of a statistical model can often be improved
by applying shrinkage methods. This can be achieved, e.g., by regularized
regression or empirical Bayes approaches. Various types of shrinkage factors can
also be estimated after a maximum likelihood. While global shrinkage modifies
all regression coefficients by the same factor, parameterwise shrinkage factors
differ between regression coefficients. 

- [entropy](https://cran.r-project.org/web/packages/entropy/entropy.pdf): This package implements various estimators of entropy, such
as the shrinkage estimator by Hausser and Strimmer, the maximum likelihood
and the Millow-Madow estimator, various Bayesian estimators, and the
Chao-Shen estimator. It also offers an R interface to the NSB estimator.
Furthermore, it provides functions for estimating Kullback-Leibler divergence,
chi-squared, mutual information, and chi-squared statistic of independence.
In addition there are functions for discretizing continuous random variables.

- [boot](https://cran.r-project.org/web/packages/boot/boot.pdf): Calculate equi-tailed 
two-sided nonparametric approximate bootstrap confidence intervals for a parameter,
given a set of data and an estimator of the parameter, using numerical differentiation.

- [VLMC](https://cran.r-project.org/web/packages/VLMC/VLMC.pdf):  Functions, Classes & Methods for estimation, prediction, and
simulation (bootstrap) of Variable Length Markov Chain ('VLMC') Models. [Dendograms](https://rdrr.io/cran/VLMC/man/as.dendrogram.vlmc.html)


#### Python Packages: 

- [pymc3](https://docs.pymc.io) PyMC3 is a Python package for Bayesian statistical modeling and Probabilistic Machine Learning focusing on advanced Markov chain Monte Carlo (MCMC) and variational inference (VI) algorithms. Its flexibility and extensibility make it applicable to a large suite of problems.



#### Data:

- [Eurostat](https://ec.europa.eu/eurostat/web/environmental-data-centre-on-natural-resources/data/main-tables)

- BEA US: [GDP by state](https://www.bea.gov/data/gdp/gdp-state), [GDP by industry](https://www.bea.gov/industry/gdpbyind-data) 

- [FRED US](https://fred.stlouisfed.org/series/TXNQGSP)

- Witchita Liberty: [Real Gross Domestic Product by state and industry](https://wichitaliberty.org/economics/gdp-by-state-and-industry/), [GDP by state and industry](https://wichitaliberty.org/economics/gdp-state-industry-2/), [Quarterly gross domestic product by state](https://wichitaliberty.org/economics/quarterly-gross-domestic-product-by-state/), 

- Tableau US: [5 year change](https://public.tableau.com/profile/bobweeks#!/vizhome/GDPbyStateandComponents/5YearChangebyState), [quaterly](https://public.tableau.com/profile/bobweeks#!/vizhome/GDPbyStateRealQuarterly2014-08-21/Composition), [private vs government](https://public.tableau.com/profile/bobweeks#!/vizhome/QuarterlyGDPbystateandindustrynewprototypestatistics2015-09/States)


- Росстат:  [ИБО](http://www.gks.ru/bgd/free/b01_19/IssWWW.exe/Stg/d000/i000520r.htm), [ВРП](http://www.gks.ru/free_doc/new_site/vvp/tab-vrp2.htm)

- [sophist.hse](http://sophist.hse.ru/hse/nindex.shtml)  (BBR_EA_Q_I)

- [DataMarket](https://datamarket.com/data/set/15qd/net-migration#!ds=15qd!hr0&display=line)

- [World Bank](https://data.worldbank.org/indicator/NV.AGR.TOTL.ZS?name_desc=false&view=chart)

- [United Nations library](http://libraryresources.unog.ch)

#### DataCamp:

- [ ] Manipulating DataFrames with pandas (pivoting)

- [ ] Hierarchical and Mixed Effects Models

- [ ] Cluster Analysis in R

- [ ] [Beginning Bayes in R](https://campus.datacamp.com/courses/beginning-bayes-in-r/introduction-to-bayesian-thinking?ex=1)

- [ ] Bayesian Modeling with **RJAGS** 

- [ ] Inference for Numerical Data (**Bootstraping**, anova)

- [ ] Statistical Thinking in Python (Part 2): [bootstrap intervals](https://campus.datacamp.com/courses/statistical-thinking-in-python-part-2/bootstrap-confidence-intervals?ex=4)

- [ ] Bayesian Regression Modeling with rstanarm

- [ ] Statistical Modeling in R (Part 2): effect size, sampling, bootstrap

- [ ] Foundations of Inference

- [ ] Introduction to Machine Learning

- [ ] Mixture Models in R

- [ ] Unsupervised Learning in R or Unsupervised Learning in Python

#### Offtop: 

- [ ] [Introduction to recursive Bayesian filtering](https://people.csail.mit.edu/mrub/talks/filtering.pdf)


- [ ] [From Bayes to Extended Kalman Filter](http://people.ciirc.cvut.cz/~hlavac/TeachPresEn/55AutonomRobotics/2015-05-04ReinsteinBayes-ekf.pdf)



- [Asymmetric time aggregation and its potential benefits for forecasting annual data](https://link.springer.com/article/10.1007/s00181-014-0864-0)




- [Forecasting with group seasonality](https://pure.tue.nl/ws/files/1718873/200610743.pdf)


- [Dynamic Bayesian Predictive Synthesis in Time Series Forecasting](https://arxiv.org/pdf/1601.07463.pdf): Posterior Computations via MCMC,  US Macroeconomic Time Series








