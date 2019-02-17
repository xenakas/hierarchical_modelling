# Hierarchical modelling

## Slides:

- [ ] [MCMC in 60 minutes](http://www.math.chalmers.se/~bodavid/GMRF2015/Lectures/F6slides.pdf)

- [ ] [Introduction to recursive Bayesian filtering](https://people.csail.mit.edu/mrub/talks/filtering.pdf)

- [ ] [From Bayes to Extended Kalman Filter](http://people.ciirc.cvut.cz/~hlavac/TeachPresEn/55AutonomRobotics/2015-05-04ReinsteinBayes-ekf.pdf)



## Examples:


- [ ] [Time Series Clustering/Classification](http://www.stat.unc.edu/faculty/pipiras/timeseries/Multivariate_6_-_Classification_Clustering_-_Menu.html#what_is_this_all_about)
similarity/distance measures, clustering algorithms, r tutorial


- [ ] [R examples](http://www.rdatamining.com/examples/hierarchical-clustering)

- [ ] [Statistical Shrinkage](https://eranraviv.com/shrinkage-in-statistics/)


## Shortreads:

- [ ] [Resampling Methods for Time Series](http://www-stat.wharton.upenn.edu/~stine/stat910/lectures/13_bootstrap.pdf)

- [ ] [Discussion: Bootstrap methods for dependent data: A review](http://mapageweb.umontreal.ca/goncals/documents/Goncalves-Politis-2011.pdf)

- [ ] [Constructing a logic of plausible Inference: a guide to Cox's theorem](http://ksvanhorn.com/bayes/Papers/rcox.pdf)

## Longreads:

- [x] [Forecasting Economic Aggregates Using
Dynamic Component Grouping](https://mpra.ub.uni-muenchen.de/81585/1/MPRA_paper_81585.pdf)


- [ ] [Forecasting output growth rates and median output growth rates: a hierarchical Bayesian approach
](https://onlinelibrary.wiley.com/doi/pdf/10.1002/for.800)



- [ ] [Forecasting Short Time Series
with the Bayesian Autoregression
and the Soft Computing Prior Information](https://link.springer.com/chapter/10.1007/978-3-319-10765-3_10)










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




- [ ] [Bootstrap and Maximum Entropy Based Small-sample
Product Lifetime Probability Distribution](https://ac.els-cdn.com/S2405896315003237/1-s2.0-S2405896315003237-main.pdf?_tid=8d1881b9-60f4-4175-8ee8-45b9fde1c368&acdnat=1541141244_8e2bc14c566774b43b8cd097e653bc11)



- [ ] [Bayes or Bootstrap? A Simulation Study Comparing the Performance of Bayesian Markov Chain Monte Carlo Sampling and Bootstrapping](https://academic.oup.com/mbe/article/20/2/255/1003275)


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


- [boot](https://cran.r-project.org/web/packages/boot/boot.pdf): Calculate equi-tailed 
two-sided nonparametric approximate bootstrap confidence intervals for a parameter,
given a set of data and an estimator of the parameter, using numerical differentiation.

- [meboot](https://cran.r-project.org/web/packages/meboot/meboot.pdf): Maximum entropy density based dependent data bootstrap.
An algorithm is provided to create a population of time series (ensemble)
without assuming stationarity. The reference paper (Vinod, H.D., 2004) explains
how the algorithm satisfies the ergodic theorem and the central limit theorem.[Maximum Entropy Bootstrap for Time Series](https://cran.r-project.org/web/packages/meboot/vignettes/meboot.pdf)

- [entropy](https://cran.r-project.org/web/packages/entropy/entropy.pdf): This package implements various estimators of entropy, such
as the shrinkage estimator by Hausser and Strimmer, the maximum likelihood
and the Millow-Madow estimator, various Bayesian estimators, and the
Chao-Shen estimator. It also offers an R interface to the NSB estimator.
Furthermore, it provides functions for estimating Kullback-Leibler divergence,
chi-squared, mutual information, and chi-squared statistic of independence.
In addition there are functions for discretizing continuous random variables.

- [VLMC](https://cran.r-project.org/web/packages/VLMC/VLMC.pdf):  Functions, Classes & Methods for estimation, prediction, and
simulation (bootstrap) of Variable Length Markov Chain ('VLMC') Models. [Dendograms](https://rdrr.io/cran/VLMC/man/as.dendrogram.vlmc.html)


- [WeightedCluster](https://cran.r-project.org/web/packages/WeightedCluster/WeightedCluster.pdf): Clusters state sequences and weighted data. It provides an optimized weighted PAM algorithm
as well as functions for aggregating replicated cases, computing cluster quality measures
for a range of clustering solutions and plotting clusters of state sequences.


- [MLwiN](https://cran.r-project.org/web/packages/R2MLwiN/R2MLwiN.pdf): [Resources for using MLwiN](http://www.bristol.ac.uk/cmm/software/mlwin/mlwin-resources.html#mlmbkgrd), [r-bloggers tutorial](https://www.r-bloggers.com/working-with-r2mlwin-part-1/), [sample sizes for multilevel models](http://www.bristol.ac.uk/cmm/learning/multilevel-models/samples.html), [MCMC estimation](https://seis.bristol.ac.uk/~frwjb/esrc/mcmc.pdf)


- [bayesGDS](https://cran.r-project.org/web/packages/bayesGDS/bayesGDS.pdf): Functions for implementing the [Braun and Damien (2015) rejection
sampling algorithm](https://www.researchgate.net/publication/260003754_Scalable_Rejection_Sampling_for_Bayesian_Hierarchical_Models) for Bayesian hierarchical models. The algorithm generates
posterior samples in parallel, and is scalable when the individual units are
conditionally independent. [Estimating Bayesian Hierarchical Models using bayesGDS](https://cran.r-project.org/web/packages/bayesGDS/vignettes/bayesGDS.pdf)


#### Python Packages: 

- [pymc3](https://docs.pymc.io) PyMC3 is a Python package for Bayesian statistical modeling and Probabilistic Machine Learning focusing on advanced Markov chain Monte Carlo (MCMC) and variational inference (VI) algorithms. Its flexibility and extensibility make it applicable to a large suite of problems.





#### Offtop: 




- [ ] [A large Bayesian vector autoregression model for Russia ](http://www.cbr.ru/content/document/file/16690/wps_1_e.pdf)

- [ ] [NUMERICAL METHODS FOR ESTIMATION AND
INFERENCE IN BAYESIAN VAR-MODELS](https://onlinelibrary.wiley.com/doi/abs/10.1002/(SICI)1099-1255(199703)12:2<99::AID-JAE429>3.0.CO;2-A)







- [ ] [Asymmetric time aggregation and its potential benefits for forecasting annual data](https://link.springer.com/article/10.1007/s00181-014-0864-0)




- [ ] [Forecasting with group seasonality](https://pure.tue.nl/ws/files/1718873/200610743.pdf)


- [ ] [Dynamic Bayesian Predictive Synthesis in Time Series Forecasting](https://arxiv.org/pdf/1601.07463.pdf): Posterior Computations via MCMC,  US Macroeconomic Time Series



- [ ] [Forecasting with Medium and Large Bayesian VARs](http://ecares.ulb.ac.be/ecaresdocuments/seminars1011/koop.pdf)


- [ ] [A review of threshold time series models in
finance](http://intlpress.com/site/pub/files/_fulltext/journals/sii/2011/0004/0002/SII-2011-0004-0002-a012.pdf): TARMAX, RJMCMC




