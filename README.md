# hierarchical_modelling



- [ ] [MCMC in 60 minutes](http://www.math.chalmers.se/~bodavid/GMRF2015/Lectures/F6slides.pdf)




- [ ] [R examples](http://www.rdatamining.com/examples/hierarchical-clustering)



- [ ] [Time Series Clustering/Classification](http://www.stat.unc.edu/faculty/pipiras/timeseries/Multivariate_6_-_Classification_Clustering_-_Menu.html#what_is_this_all_about)
similarity/distance measures, clustering algorithms, r tutorial


- [ ] [Time-series clustering – Decade overview](https://www.sciencedirect.com/science/article/abs/pii/S0306437915000733) 


- [ ] [Forecasting Method for Grouped Time Series with the Use of k-Means Algorithm](https://arxiv.org/pdf/1509.04705.pdf)





R Packages: 

- [hts](https://cran.r-project.org/web/packages/hts/vignettes/hts.pdf): An R Package for Forecasting Hierarchical or Grouped Time Series

- [bsts](https://cran.r-project.org/web/packages/bsts/bsts.pdf): Time series regression 
using dynamic linear models fit using MCMC. See Scott and Varian (2014) <DOI:10.1504/IJMMNO.2014.059942>.
e.g.: ``aggregate.time.series`` - [aggregate a fine time series to a coarse summary](https://www.rdocumentation.org/packages/bsts/versions/0.8.0/topics/aggregate.time.series),
similar to functions from the ``xts`` package, but it can handle aggregation from weeks to months.

- [dtwclust](https://cran.r-project.org/web/packages/dtwclust/dtwclust.pdf): time series clustering along with optimizations for the dynamic time warping distance.
Time series clustering along with optimized techniques related
to the Dynamic Time Warping distance and its corresponding lower bounds.
Implementations of partitional, hierarchical, fuzzy, k-Shape and TADPole
clustering are available. 


Python Packages: 

- [pymc3](https://docs.pymc.io) PyMC3 is a Python package for Bayesian statistical modeling and Probabilistic Machine Learning focusing on advanced Markov chain Monte Carlo (MCMC) and variational inference (VI) algorithms. Its flexibility and extensibility make it applicable to a large suite of problems.



Data:

- [Eurostat](https://ec.europa.eu/eurostat/web/environmental-data-centre-on-natural-resources/data/main-tables)

- BEA US: [GDP by state](https://www.bea.gov/data/gdp/gdp-state), [GDP by industry](https://www.bea.gov/industry/gdpbyind-data) 

- [FRED US](https://fred.stlouisfed.org/series/TXNQGSP)

- Witchita Liberty: [Real Gross Domestic Product by state and industry](https://wichitaliberty.org/economics/gdp-by-state-and-industry/), [GDP by state and industry](https://wichitaliberty.org/economics/gdp-state-industry-2/), [Quarterly gross domestic product by state](https://wichitaliberty.org/economics/quarterly-gross-domestic-product-by-state/), 

- Tableau US: [5 year change](https://public.tableau.com/profile/bobweeks#!/vizhome/GDPbyStateandComponents/5YearChangebyState), [quaterly](https://public.tableau.com/profile/bobweeks#!/vizhome/GDPbyStateRealQuarterly2014-08-21/Composition), [private vs government](https://public.tableau.com/profile/bobweeks#!/vizhome/QuarterlyGDPbystateandindustrynewprototypestatistics2015-09/States)




- [DataMarket](https://datamarket.com/data/set/15qd/net-migration#!ds=15qd!hr0&display=line)

- [World Bank](https://data.worldbank.org/indicator/NV.AGR.TOTL.ZS?name_desc=false&view=chart)

- [United Nations library](http://libraryresources.unog.ch)


Offtop: 

- [Asymmetric time aggregation and its potential benefits for forecasting annual data](https://link.springer.com/article/10.1007/s00181-014-0864-0)

- [Forecasting with group seasonality](https://pure.tue.nl/ws/files/1718873/200610743.pdf)
