# Clusterization Methods

Clustering is a solution for classifying enormous data when there is not any early knowledge about classes.

Clustering methods can be broadly divided into three main categories: overlapping, partitional,
and hierarchical. A hierarchical clustering  method works by grouping data objects into a tree 
of clusters. There are generally two types of hierarchical clustering methods: 
agglomerative and divisive. 
A neural clustering method, the self-organizing map (SOM), is used for pattern discovery. 
Ghaseminezhad  presented a novel SOM-based algorithm that can automatically cluster 
discrete groups of data using an unsupervised method. 
Hidden Markov model (HMM) is a common model based algorithm adopted in time series clustering.

## Shortreads:


- [ ] [Voting in Clustering and Finding the Number of Clusters](http://epub.wu.ac.at/684/1/document.pdf)


- [ ] [WACA: A Hierarchical Weighted Clustering Algorithm optimized for Mobile Hybrid Networks](https://arxiv.org/pdf/0706.1080.pdf)



- [ ] [Clustering Sequence Data using Hidden Markov Model
Representation](https://pdfs.semanticscholar.org/8a0d/b6529eeae4408712bd5148dce1e6e2a662f3.pdf)



- [ ] [Modeling Time Series Similarity with Siamese Recurrent Networks](https://arxiv.org/pdf/1603.04713.pdf)



- [ ] Time Series Clustering of Free-To-Play Game Data:  [Distance measures](https://arxiv.org/pdf/1710.02268.pdf) 



- [ ] [An unsupervised conditional random fields approach for clustering gene expression time series](https://pdfs.semanticscholar.org/df3b/de558808516ce834189ba50004f85a86e815.pdf)


- [ ] [Clustering Time Series Data: An Evolutionary Approach ](https://pdfs.semanticscholar.org/2c61/7a569a96fb3f34f182e18202d383f22d060b.pdf)


- [x] [Classification Of Short Time Series](https://www.researchgate.net/publication/46447515_Classification_Of_Short_Time_Series)


### Examples:



- [ ] [Time Series Clustering/Classification](http://www.stat.unc.edu/faculty/pipiras/timeseries/Multivariate_6_-_Classification_Clustering_-_Menu.html#what_is_this_all_about)
similarity/distance measures, clustering algorithms, r tutorial


- [ ] [Time Series Classification and Clustering with Python](http://alexminnaar.com/time-series-classification-and-clustering-with-python.html)



- [ ] [Hierarchical Clustering in R](https://www.datacamp.com/community/tutorials/hierarchical-clustering-R)



- [ ] [R examples](http://www.rdatamining.com/examples/hierarchical-clustering)


- [ ] [Forecast Combination in R (geomcomb)](http://www.ceweiss.com/geomcomb-forecast-combination-in-r/)



- [ ] [Comparing Time-Series Clustering Algorithms in R Using the dtwclust](https://cran.r-project.org/web/packages/dtwclust/vignettes/dtwclust.pdf)


- [ ] [hts: An R Package for Forecasting Hierarchical or Grouped Time Series](https://cran.r-project.org/web/packages/hts/vignettes/hts.pdf)

### Slides:



- [ ] [Weighted clustering](http://www.cs.fsu.edu/~ackerman/CIS5930/notes/Weighted%20clustering.pdf)


### Weighted clustering

- [ ] [Time series forecasting based on weighted clustering](https://ieeexplore.ieee.org/document/8167252)



- [ ] [Cluster-weighted modelling for time-series analysis](https://www.nature.com/articles/16873)



## Longreads:


- [ ] CLUSTERING METHODOLOGY FOR TIME SERIES MINING


- [ ] [Time-series clustering – Decade overview](https://www.sciencedirect.com/science/article/abs/pii/S0306437915000733) 

- [x] [Forecasting Economic Aggregates Using Dynamic Component Grouping](https://mpra.ub.uni-muenchen.de/81585/1/MPRA_paper_81585.pdf)


- [ ] [A Scalable Method for Time Series Clustering ](https://robjhyndman.com/papers/wang.pdf)

- [ ] [Highly comparative, feature-based time-series classification](https://arxiv.org/pdf/1401.3531v1.pdf)


- [ ] [Optimal combination forecasts for hierarchical time series](https://robjhyndman.com/papers/Hierarchical6.pdf):  bottom-up and optimal combination methods


- [ ] [Forecasting Method for Grouped Time Series with the Use of k-Means Algorithm](https://arxiv.org/pdf/1509.04705.pdf)

- [ ] [Forecasting of Time Series’ Groups with Application of Fuzzy c-Mean Algorithm](http://www.m-hikari.com/ces/ces2015/ces33-36-2015/p/nikulchevCES33-36-2015.pdf)


- [ ] [Time series trend analysis based  on k-means and SVM](http://www.cai.sk/ojs/index.php/cai/article/view/1445/753)



- [ ] [Time series clustering](https://beta.vu.nl/nl/Images/stageverslag-roelofsen_tcm235-882304.pdf) - step by step research 



- [ ] [A Hybrid Algorithm for Clustering of Time Series Data Based on Affinity Search Technique](https://www.hindawi.com/journals/tswj/2014/562194/)

- [ ] [Recent Techniques of Clustering of Time Series Data: A Survey](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.258.9630&rep=rep1&type=pdf)


- [ ] [Consistent Algorithms for Clustering Time Series](http://www.jmlr.org/papers/volume17/khaleghi16a/khaleghi16a.pdf)

The assumption that a given time series is stationary ergodic is one of the most general 
assumptions used in statistics; in particular, it allows for arbitrary long-range serial 
dependence, and sub- sumes most of the nonparametric as well as modelling assumptions 
used in the literature on clustering time series, such as i.i.d., (hidden) Markov, or mixing time series.

This allows us to define the following clustering objective: group a pair of time series into
the same cluster if and only if the distribution that generates them is the same.

It is assumed that the data are generated by a mixture of κ different distributions 
that have a particular known form (such as Gaussian, Hidden Markov models, or graphical models). 
Thus, each of the N samples is independently generated according to one of these κ distributions 
(with some fixed probability). Since the model of the data is specified quite well, one can use 
likelihood-based distances (and then, for example, the k-means algorithm), or Bayesian inference,
to cluster the data. 

Another typical objective is to estimate the parameters of the distributions in the mixture 
(e.g., Gaussians), rather than actually clustering the data points. 
Clearly, the main difference between this setting and ours is in that we do not assume 
any known model for the data; we do not even require independence between the samples.


- [ ] [Probabilistic Curve-Aligned Clustering and Prediction with Regression Mixture Models](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.92.1806&rep=rep1&type=pdf)



 
- [ ] [Time Series Clustering in the
Field of Agronomy](https://team.inria.fr/zenith/files/2013/11/ia_ma_thesis_final.pdf)

