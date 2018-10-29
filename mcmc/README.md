# MCMC

In Bayesian statistics, the recent development of Markov chain Monte Carlo methods has been a key step in making it possible to compute large **hierarchical models** that require integrations over hundreds or even thousands of unknown parameters.[4]

In rare event sampling, they are also used for generating samples that gradually populate the rare failure region.




- [ ] [MCMC for hierarchical models  or “an entire MCMC course in 90 minutes”](http://www.math.chalmers.se/~bodavid/GMRF2015/Lectures/F6slides.pdf)


- [ ] [An Introduction to MCMC for Machine Learning](https://link.springer.com/content/pdf/10.1023%2FA%3A1020281327116.pdf)


- [ ] [Advanced Hierarchical Modeling with the MCMC Procedure](https://support.sas.com/resources/papers/proceedings17/SAS0478-2017.pdf) 
with SAS/STAT software

MCMC code:

- [JAGS](http://mcmc-jags.sourceforge.net)  can use stand-alone binary or interface with R
- [STAN](http://mc-stan.org/documentation/) interfaces with R, Python, Julia, MATLAB
- pymc3
- [Implementation in R, Python, Java and C](https://darrenjw.wordpress.com/2010/04/28/mcmc-programming-in-r-python-java-and-c/)

MCMC Syllabus:

1. Introduction: Bayesian statistics, Markov chains. 
2. Gibbs Sampler: data augmentation, burn-in, convergence. 
3. Metropolis-Hastings algorithm: independent sampler, random walk Metropolis, scaling, multi-modality. 
4. MCMC Issues: Monte Carlo Error, reparameterisation, hybrid algorithms, convergence diagnostics. 
5. Reversible jump MCMC: known number of parameters. 
6. Hamiltonian Monte Carlo. 
7. Approximate Bayesian Computation: simulation based inference. 
