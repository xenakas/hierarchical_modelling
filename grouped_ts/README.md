# Hierarchical or Grouped Time Series

- [ ] [Statistics for Applications](https://ocw.mit.edu/courses/mathematics/18-650-statistics-for-applications-fall-2016/lecture-slides/)

## Shortreads:

- [ ] [Wiki Multilevel model](https://en.wikipedia.org/wiki/Multilevel_model)

### Examples:

- [ ]  [Forecasting Time Series Groups in the tidyverse](https://cran.rstudio.com/web/packages/sweep/vignettes/SW01_Forecasting_Time_Series_Groups.html)

- [ ] [hts](https://cran.r-project.org/web/packages/hts/vignettes/hts.pdf): An R Package for Forecasting Hierarchical or Grouped Time Series. 


### Slides:

- [x]  Grouped and hierarchical TS ([in matrix form](https://forecasters.org/wp-content/uploads/gravity_forms/7-2a51b93047891f1ec3608bdbd77ca58d/2014/07/Athanasopoulos_George_ISF2014.pdf) )

- [ ] [Optimal combination forecasts for hierarchical time series](https://robjhyndman.com/talks/Hierarchical%20ISF2006.pdf) + [article](http://webdoc.sub.gwdg.de/ebook/serien/e/monash_univ/wp9-07.pdf)


- [ ] [Three‐Level Models (Part 2): Models for Clustered Longitudinal Data](https://jonathantemplin.com/files/mlm/mlm13icpsr/mlm13icpsr_lecture10.pdf)

- [ ] [The 3-Level HLM Model](http://www.statpower.net/Content/MLRM/Lecture%20Slides/HLM3.pdf)



### RE and FE models for TS

- [ ] [nlme](https://cran.r-project.org/web/packages/nlme/nlme.pdf): For mixed-effects modells of time series - the nlme package, because it offers facilities to model auto-correlation structures, [???](https://stats.stackexchange.com/questions/71087/analysis-of-a-time-series-with-a-fixed-and-random-factor-in-r)

- [ ] [Number of Subjects and Time Points Needed for Multilevel Time-Series Analysis: A Simulation Study of Dynamic Structural Equation Modeling](https://www.tandfonline.com/doi/abs/10.1080/10705511.2017.1392862?journalCode=hsem20)

- [ ] [Slides: MIXED EFFECTS MODELS FOR TIME SERIES](https://www.cimat.mx/~jortega/Ombao/Ombao_MixedEffects.pdf)


- [ ] [Michael J. Crawley: The R Book](https://onlinelibrary.wiley.com/doi/10.1002/9780470515075.ch19): Time Series Analysis in Mixed-Effects Models (page 645)

ARIMA models can be implemented as State Space models (R's arima does this, under the hood), also known as Dynamic Linear models (DLMs). DLMs are also extensions from regression (in a different way than Mixed Effects), so I'd guess that there is a deep-down relationship between ARIMA and Mixed-effect models.

- [ ] [How Many Countries for Multilevel Modeling? A Comparison of Frequentist and Bayesian Approaches](https://onlinelibrary.wiley.com/doi/abs/10.1111/ajps.12001)



- [ ] [Explaining Fixed Effects: Random Effects Modeling of Time-Series Cross-Sectional and Panel Data](https://www.researchgate.net/publication/233756428_Explaining_Fixed_Effects_Random_Effects_Modeling_of_Time-Series_Cross-Sectional_and_Panel_Data)


Multilevel modelling is a name for models that have both fixed and random effects 


If you mean RE, yes you are right, and yes the Mundlak formulation will help if there are unobserved country-level factors linked to GDP that you want to control for. But this also uses up degrees of freedom. Without Mundlak, RE uses less degrees of freedom (because the random effects are assumed part of a distribution, only the variance of that distribution needs to be estimated, and you don't need a parameter for each RE).


- [ ] [A Multilevel Multiset Time-Series Model for Describing Complex Developmental Processes](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5978585/)

- [ ] [Mixed Models Approach to Estimate Time Series: Modeling the Environmental Effect on the Honeybee Egg Laying Activity](http://www.unavarra.es/metma3/Papers/PDFS_ORAL/Cabral.pdf)

- [ ] [Fitting Linear Mixed-Effects Models Using lme4](https://cran.r-project.org/web/packages/lme4//vignettes/lmer.pdf): [???](https://stackoverflow.com/questions/35628204/incorporating-time-series-into-a-mixed-effects-model-in-r-using-lme4)


### DLM

Dynamic Bayesian models are developed for application in
nonlinear, non-normal time series and regression problems,
providing dynamic extensions of standard generalized linear
models



- [ ] [SLIDE 19](https://www.math.unm.edu/~ghuerta/tseries/dlmch2.pdf)

- [ ] [Slides: Time series and dynamic linear models](http://halweb.uc3m.es/esp/Personal/personas/mwiper/docencia/English/PhD_Bayesian_Statistics/ch11_2009.pdf)


- [ ] [Introduction](http://www2.uaem.mx/r-mirror/web/packages/dlmodeler/dlmodeler.pdf)

- [ ] [pyDLM](https://github.com/wwrechard/pydlm)

- [ ] [r dlm](https://cran.r-project.org/web/packages/dlm/dlm.pdf): [pdf](https://cran.r-project.org/web/packages/dlm/vignettes/dlm.pdf), [guide](https://stats.stackexchange.com/questions/8055/how-to-use-dlm-with-kalman-filtering-for-forecasting)

- [ ] [Dynamic Generalized Linear Models and Bayesian Forecasting](http://www2.stat.duke.edu/~mw/MWextrapubs/West1985a.pdf)

- [ ] [DLM with R book](http://people.bordeaux.inria.fr/pierre.delmoral/dynamics-linear-models.petris_et_al.pdf)




- [ ] [ A Bayesian Multivariate Functional Dynamic Linear Model ](https://arxiv.org/pdf/1411.0764.pdf)

- [ ] [Kalman Filtering for Forecasting](http://www-stat.wharton.upenn.edu/~steele/Resources/FTSResources/StateSpaceModels/KFExposition/MorrisonPike77.pdf)

- [ ] [	Kalman Filtering in R](https://www.jstatsoft.org/article/view/v039i02)

## Longreads: 



- [ ] [MULTILEVEL TIME SERIES MODELS
WITH APPLICATIONS TO REPEATED MEASURES DATA](http://www.bristol.ac.uk/media-library/sites/cmm/migrated/documents/multilevel-time-series.pdf)

- [ ] [Fast computation of reconciled forecasts for hierarchical and grouped time series](https://robjhyndman.com/papers/hgts4.pdf)

- [ ] [Hierarchical forecasts for
Australian domestic tourism](http://webdoc.sub.gwdg.de/ebook/serien/e/monash_univ/wp12-07.pdf)

- [ ]  [Grouped time-series forecasting with an application to regional infant mortality counts](http://www.cpc.ac.uk/docs/2013_WP40_Grouped_Time-Series_Forecasting_Shang_et_al.pdf): bottom-up and optimal combination methods, a parametric bootstrap method for constructing point-wise prediction intervals,  one-step-ahead to ten-step-ahead point and interval forecast accuracy.



- [ ] [Essays in Hierarchical Time Series Forecasting and Forecast Combination](https://core.ac.uk/download/pdf/154428359.pdf)



- [ ] [Offline Design Tuning for Hierarchies of Forecast Models](http://cs.emis.de/LNI/Proceedings/Proceedings180/167.pdf)


- [ ] [Uncertainty and variability in demography and population growth: a hierarchical approach](http://zero.sci-hub.tw/3978/f6fab7692f0e7bfaf6c1c9662cde415e/clark2003.pdf)



- [ ] [Grouped functional time series forecasting: An application to age-specific mortality rates](https://arxiv.org/pdf/1609.04222.pdf)


- [ ] [Grouped multivariate and functional time series forecasting: An application to annuity pricing](https://www.sciencedirect.com/science/article/pii/S016766871630484X)


- [ ] [Accommodating Small Sample Sizes in Three-Level Models When the Third Level is Incidental](https://www.tandfonline.com/doi/abs/10.1080/00273171.2016.1262236?src=recsys&journalCode=hmbr20)



