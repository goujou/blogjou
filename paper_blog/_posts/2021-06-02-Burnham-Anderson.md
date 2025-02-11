---
title: "Model Selection and Multimodel Inference"
date: 2021-06-02
doi: 
author:
    - Kenneth P. Burnham
    - David R. Anderson
---
> We wrote this book to introduce graduate students and research workers in
various scientific disciplines to the use of information-theoretic approaches in the analysis of empirical data.
These methods allow the data-based selection of a “best” model and a ranking and weighting of the remaining models in a pre-defined set.
Traditional statistical inference can then be based on this
selected best model.
However, we now emphasize that information-theoretic approaches allow formal inference to be based on more than one model (multimodel inference).
Such procedures lead to more robust inferences in many cases, and we advocate these approaches throughout the book.

# Preface
> We recommend the information-theoretic approach for the analysis of data
from observational studies. In this broad class of studies, we find that all the various hypothesis-testing approaches have no theoretical justification and may often perform poorly.
For classic experiments (control–treatment, with randomization and replication) we generally support the traditional approaches (e.g., analysis of variance); there is a very large literature on this classic subject.
However, for complex experiments we suggest consideration of fitting explanatory models, hence on estimation of the size and precision of the treatment
effects and on parsimony, with far less emphasis on “tests” of null hypotheses, leading to the arbitrary classification “significant” versus “not significant.”
Instead, a strength of evidence approach is advocated.

# Introduction

## 1.1 Objectives of the Book
- model parameters can provide insights even if not linked to directly observable variables
- AIC used routinely in time series analysis
- marriage of information theory and mathematical statistics: Kullback’s (1959) book
- Akaike considered AIC an extension of R. A. Fisher’s likelihood theory
- estimates of model selection uncertainty: inference problems that arise from in using the same data for both model selection and parameter estimation and inference; if irgnored, precision overestimated
- multimodel inference (MMI): model averaging, confidence sets on models
- small sample size: AIC$_c$ instead of AIC (Mina)

## 1.2 Background Material

### 1.2.1 Inference from Data, Given a Model
- Fisher's likelihood theory assumes that the model structure is known and correct, only the parameters are to be estimated

### 1.2.2 Likelihood and Least Squares Theory
- LS and likelohood yield identical estimators if structural parameters of residuals are normal and independent
- LS:
    - $y_i = \beta_0 + \beta_i\,\cdot x_i + \epsilon_i$ with $\epsilon_i\sim\mathcal{N}(0,\sigma^2)$ independent
    - LS gives $\hat{\beta_0}$ and $\hat{\beta_i}$ such that the residual square sum $\operatorname{RSS} = \sum_i \epsilon_i^2$ is minimized
- in likelihood function, data are given and model is assumed; interest in estimating unknown parameters: likelihood is function of only the parameters
- $\mathcal{L}(\theta\,\|\,data,\,model) = \mathcal{L}(\theta,\|\,x,g)$ is the likelihood of the unknown parameter $\theta$, given data $x$ and model $g$
- likelihood is a *relative* value
- LS is a special case of ML
- $\sigma^2$ is to be considered as a parameter, $\hat{\sigma}^2$ differs by a multiplicative constant (depending on number of parameters and samplie size) for LS and ML
- in LS, $\operatorname{RSS}=n\hat{\sigma}^2$ is minimized, which is for all parameters other than $\sigma^2$ equivalent to maximizing $-1/2\cdot n\,\log \hat{\sigma}^2$

### 1.2.3 The Critical Issue: "What Is the Best Model to Use?"
> As Potscher (1991) noted, asymptotic properties are of little value unless they hold for realized sample sizes.

- model selection based on parsimony, information-theoretic criteria, selection uncertainty

### 1.2.4 Science Inputs: Formulation of the Set of Candidate Models
> Building the set of candiate models is partially a subjective art; [...] The most original, innovative part of scientific work is the phase leading to the proper question.

- lots of exploratory work necessary
- large datasets are likely to support more complexity: one hase to correct for this
- Freedman's paradox: If number of variables $\sim$ number of observations, high $R^2$ and so on possible even if $y$ independent of data
- "An inference from a model to some aspect of the real world is justified only after the model has been shown to adequately fit relevant empirical data."
- careful thinking rather than brute force

### 1.2.5 Models Versus Full Reality
- fundamental assumption: none of the candidate models are the "true model" for the "true model" is infinite-dimensional

> Models, used cautiously, tell us “what effects are supported by the (finite) data available.”
Increased sample size (information) allows us to chase full reality, but never quite catch it.

> If we were given a nonlinear formula with 200 parameter values, we could make correct predictions, but it would be difficult to understand the main dynamics of the system without some further simplification or analysis.
Thus, one should tolerate some inexactness (an inflated error term) to facilitate a simpler and more useful understanding of the phenomenon.

> [...]  there are often several large, important effects, followed by
many smaller effects, and, finally, followed by a myriad of yet smaller effects.
[...] Rare events that have large effects may be very important but quite difficult to study.

> Conceptually, the role of a good model is to filter the data
so as to separate information from noise.

### 1.2.6 An Ideal Approximating Model
> It is important that the best model is selected from a set of models that were def<LeftMouse>ined prior to data analysis and based on the science of the issue at hand.

> There are many cases where two or more models are essentially tied for “best,” and this should be fully recognized in further analysis and inference, especially when they produce different predictions.
In other cases there might be 4–10 models that have at least some support, and these, too, deserve scrutiny in reaching conclusions from the data, based on inferences from more than a single model.

- good tool to assess model quanlity: small-sized confidence intervals with high confidende ($\geq 0.95$) for parameter values

## 1.3 Model Fundamentals and Notation
Introduction of model classes and notation.

### 1.3.1  Truth or Full Reality $f$
*Truth* is denoted by $f$ as an abstract concept because it is unknown.

### 1.3.2 Approximating models $g_i(x\,|\,\theta)$

> Ideally, the set of $R$ models will have been defined prior to data analysis.
These models specify only the form of the model, leaving the unknown parameters ($θ$) unspecified.

### 1.3.3  The Kullback–Leibler Best Model $g_i(x\,|\,\theta_0)$

- "K-L best" means relative to the unkown truth $f$

> The parameters that produce this conceptually best single model, in the class $g(x\,|\,\theta)$0, are denoted by $\theta_0$.
Of course, this model is generally unknown to us but can be estimated; such estimation involves computing the MLEs of the parameters in each model ($\theta$) and then estimating K-L information as a basis for model selection and inference.
**The MLEs converge asymptotically to $\theta_0$ and the concept of bias is with respect to $\theta_0$, rather than our conceptual “true parameters” associated with full reality $f$.**

### 1.3.4  Estimated Models $g_i(x\,|\,\hat{\theta})$
> In a sense, when we have only the model form $g(x\,|\,\theta)$ we have an infinite number of models, where all such models have the same form but different values of $\theta$.
Yet, in all of these models there is a unique K-L best model.
**Conceptually, we know how to find this model, given $f$.**

### 1.3.5 Generating Models
> One should not confuse a generating model or results based on Monte Carlo data with full reality $f$.

### 1.3.6 Global Model
> Ideally, the global model has in it all the factors or variables thought to be
important.
Other models are often special cases of this global model.
There is not always a global model.
If sample size is small, it may be impossible to fit the global model.
Goodness-of-fit tests and estimates of an overdispersion parameter for count data should be based (only) on the global model.
The concept of overdispersion is relatively model-independent; however, some model must be used to compute or model any overdispersion thought to exist in count data.

- In compartmental systems, a global model with $n$ pools is then the models where all pools are connected, and all pools have external inputs and outputs
- other models or special cases are models with missing connections.
- **In terms of AIC and finding the right dimension ($n$, number of pools), should one first compare several "global" models with one another? If so, how (pure likelihood, AIC)?**

> The advantage of this approach is that if the global model fits the data adequately, then a selected model that is more parsimonious will also fit the data (**this is an empirical result, not a theorem**).

### 1.3.7 Overview of Stochastic Models in the Biological Sciences

- linear and nonlinear regression (based on LS and ML)
- log-linear and logistic models (mostly for count data)
- compartmental models as state transitions (more advanced: **"random effects"**, Kreft and deLeeuw 1998)
- differential equations in general
- open and closed capture-recapture, band recovery, distance sampling
- spatial models (Kriging can be viewed as LS technique), Gibbs sampler
- spatiotemporal (MCMC methods)

> There are general information-theoretic approaches for models well outside the likelihood framework (Qin and Lawless 1994, Ishiguo et al. 1997, Hurvich and Simonoff 1998, and Pan 2001a and b).
There are now model selection methods for nonparametric regression, splines, kernel methods, martingales, and generalized estimation equations.
Thus, methods exist for nearly all classes of models we might expect to see in the theoretical or applied biological sciences.

## 1.4 Inference and the Principle of Parsimony

### 1.4.1 Avoid Overfitting to Achieve a Good Model Fit
“How many parameters does it take to fit an elephant?”

> [Wel] concluded that the 30-term model “may not satisfy the third-grade art teacher, but would carry most chemical engineers intopreliminary design.”

> Wel’s finding is both insightful and humorous, but it deserves further interpretation for our purposes here. 
His “standard” is itself only a crude drawing—it even lacks ears, a prominent elephantine feature; hardly truth.
A better target would have been a large, digitized, high-resolution photograph; however, this, too, would have been only a model (and not truth).
**Perhaps a real elephant should have been used as truth, but this begs the question, “Which elephant should we use?”**

### 1.4.2 The Principle of Parsimony

> Statisticians view the principle of parsimony as a bias versus variance tradeoff.
In general, bias decreases and variance increases as the dimension of the model increases.

> If we believe that truth is essentially infinite-dimensional, then overfitting is not even
defined in terms of the number of parameters in the fitted model.

> Instead, we reserve the terms underfitted and overfitted for use in relation
to a “best approximating model”.

> Here, an underfitted model would ignore some important replicable (i.e., conceptually replicable in most other samples) structure in the data and thus fail to identify effects that were
actually supported by the data.
In this case, bias in the parameter estimators is often substantial, and the sampling variance is underestimated, both factors resulting in poor confidence interval coverage.
Underfitted models tend to miss important treatment effects in experimental settings.

> Overfitted models, as judged against a best approximating model, are often free of bias in the
parameter estimators, but have estimated (and actual) sampling variances that
are needlessly large (the precision of the estimators is poor, relative to what
could have been accomplished with a more parsimonious model).
Spurious treatment effects tend to be identified, and spurious variables are included
with overfitted models. 

> The goal of data collection and analysis is to make inferences from the sample that properly apply to the population. 
The inferences relate to the information about structure of the system under study as inferred from the models considered and the parameters estimated in each model. 
A paramount consideration is the repeatability, with good precision, of any inference reached.
When we imagine many replicate samples, there will be some recognizable features common to almost all of the samples. 
Such features are the sort of inference about which we seek to make strong inferences (from our single sample). Other features might appear in, say, 60% of the samples yet still reflect something real about the population or process under study, and we would hope to make weaker inferences concerning these. 
**Yet additional features appear in only a few samples, and these might be best included in the error term $(\sigma^2)$ in modeling.**

> The data are not being approximated; rather we approximate the structural information in the data that is replicble over such samples (see Chatfield 1996, Collopy et al. 1994). 
Quantifying that structure with a model form and parameter estimates is subject to some
“sampling variation” that must also be estimated (inferred) from the data.

> Some model selection methods are “parsimonious” (e.g., **BIC**, Schwarz 1978) but tend, in
realistic situations, to **select models that are too simple (i.e., underfitted)**.
One has only a highly precise, quite biased result.

- precision: model results look similar for different datasets from the same source
- overfittied models replicate the very dataset at hand and are thus imprecise, meaning that model parameters are uncertain

>  This example illustrates that valid statistical inference is only partially dependent on the analysis process; the science of the situation must play an important role through modeling.

- mass balance is such a scientific fact

### 1.4.3 Model Selection Methods

>  Generally, hypothesis testing is a very poor basis for model selection (Akaike 1974 and
Sclove 1994b).

- stepwise backwards (removing variables step by step): one misses parameter combinations and hence possible synergistic effects
- cross-validation: 
    - data are divided into two partitions, first partition is used for model fitting and the second is used for model validation
    - then a new partition is selected, and this whole process is repeated hundreds or thousands of times
    - some criterion is as basis for model selection, e.g. minimum squared prediction error
    - computationally expensive

## 1.5 Data Dredging, Overanalysis of Data, and Spurious Effect

- data dredging: analzing data and searching for patterns without questions or goals
- resulting models overfitted and without predivtive power

### 1.5.1 Overanalysis of Data

- two versions of data dredging: iteratively adding variables and trying "all" models
- with increasing computer power become more poular
- better: think before doing data dredging

>  **Journal editors and referees rarely seem to show concern for the validity of results and conclusions where substantial data dredging has occurred.
Thus, the entire methodology based on data dredging has been allowed to be perpetuated in an unthinking manner.**

> We believe that objective science is best served using a priori considerations with very limited peeking at plots of the data, parameter estimates from particular models, correlation matrices, or test statistics as the analysis proceeds.

### 1.5.2 Some Trends

- more use of likelihood (compuationally more expensive, more flexible) then least squares
- less hypothesis thesting, more estimation of effects and confidence intervals
- no formal test theory for model selection exists, how to interpret diferent $P$-values from tests with different powers
- likelihoods require nested models

### 1.6 Model Selection Bias

- data are used to both select a parsimonious model and estimate the model parameters and their precision (i.e., the conditional sampling covariance matrix, given the selected model).
-  large biases in regression coefficients are often caused by data-based model selection
- if a variable would be selected (model selection) into a model by only few of a large numble of samples, this variable's importance will be vastly overestimated if one looks only at one of the datasets which would suggest to include the variable
- you actually don't know that because you only have this particular dataset available
- even $t$-tests will tell you to include this variable

## 1.7 Model Selection Uncertainty

> Denote the sampling variance of an estimator $\theta$, given a model, by $\operatorname{var}(\theta\,|\,\text{model})$.
More generally, the sampling variance of $\hat{\theta}$ should have two components: (1) $\operatorname{var}(\theta\,|,\text{model})$ and (2) a variance component due to not knowing the best approximating model to use (and, therefore, having to estimate this).
Thus, **if one uses a method such as AIC to select a parsimonious model,
given the data, and estimates a conditional sampling variance, given the selected model.
Then estimated precision will be too small because the variance
component for model selection uncertainty is missing.**

- problems for inference, probably not for mere data description
- proper model selection is accompanied by a substantial amount of uncertainty
- bootstrap techniques can allow insights into model uncertainty
- choosing a model completely independent of the data has hidden costs in lack of reliability

## 1.8 Summary

- model selection includes scientific understanding: which models to include in the candidate sets and which not
- data dreding weakens inferences
- information-theoretic can be used to select a model
- multimodel inference: models are ranked and scaled to understand model uncertainty

> Data analysis is taken to mean the entire integrated process of a pri-
ori model specification, model selection, and estimation of parameters and
their precision.
Scientific inference is based on this process.

- databased selection of a parsimonious model is challenging
- rewards: valid inferences
- dangers: underfitting or overfitting, model selection bias and model selection uncertainty

