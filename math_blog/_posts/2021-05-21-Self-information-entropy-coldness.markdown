---
layout: post
title: From self-information to thermodynamic entropy
author: goujou
date:   2021-05-21
regenerate: true
---
The goal of this post is to introduce Shannon entropy as an information theory concept with its origin in self-information of events, and then linking it to the thermodynamic concept of entropy through maximization.

### Self-information and Shannon entropy
Following [this nice derivation](https://en.wikipedia.org/wiki/Information_content#Derivation) with some minor changes not only to notation, we can introduce the self-information of an event $x_i$ that occurs with probability $p_i$.

> By definition, information is transferred from an originating entity possessing the information to a receiving entity only when the receiver had not known the information a priori.
If the receiving entity had previously known the content of a message with certainty before receiving the message, the amount of information of the message received is zero.
Only when the advance knowledge of the content of the message by the receiver is less than 100% certain does the message actually convey information.

[...]

> Accordingly, the amount of self-information contained in a message conveying content informing an occurrence of event, $x_i$, depends only on the probability of that event.

\begin{equation}
    \nonumber
    \operatorname {I} (x_i)=f(\mathbb{P}(x_i))
\end{equation}

> for some function $f(\cdot)$ to be determined below.
If $\mathbb{P}(x_i)=1$, then $\operatorname{I}(x_i)=0$.
If $\mathbb{P}(x_i)<1$, then $\operatorname{I}(x_i)>0$.

> Further, by definition, the measure of self-information is nonnegative and additive.
If a message informing of event $C$ is the intersection of two independent events $A$ and $B$, then the information of event $C$ occurring is that of the compound message of both independent events $A$ and $B$ occurring.
The quantity of information of compound message $C$ would be expected to equal the sum of the amounts of information of the individual component messages $A$ and $B$ respectively:

\begin{equation}
    \nonumber
    \operatorname{I}(C)=\operatorname{I}(A\cap B)=\operatorname{I}(A)+\operatorname{I}(B).
\end{equation}

> Because of the independence of events $A$ and $B$, the probability of event $C$ is

\begin{equation}
    \nonumber
    \mathbb{P}(C)=\mathbb{P}(A\cap B)=\mathbb{P}(A)\cdot\mathbb{P}(B).
\end{equation}

> However, applying function $f(\cdot)$ results in

\begin{equation}
    \nonumber
    \begin{aligned}
        \operatorname{I}(C) &= \operatorname{I}(A) + \operatorname{I}(B)\newline
        f(\mathbb{P}(C)) &= f(\mathbb{P}(A)) + f(\mathbb{P}(B)) \newline
                         &= f\left(\mathbb{P}(A) \cdot \mathbb{P}(B)\right)
    \end{aligned}
\end{equation}

> The class of function[s] $f(\cdot)$ having the property [...]

\begin{equation}
    \nonumber
    f(x\cdot y) = f(x) + f(y)
\end{equation}

> is the logarithm function[s] of any base.
The only operational difference between logarithms of different bases is that of different scaling constants.
[Hence we find]

\begin{equation}
    \nonumber
    f(x) = K'\,\log(x).
\end{equation}

> Since the probabilities of events are always between 0 and 1 and the information associated with these events must be nonnegative, that requires that $K'<0$.

So we define $K:=-K'$ and obtain

\begin{equation}
    \nonumber
    \operatorname{I}(x_i) = -K\,\log \mathbb{P}(x_i) = K\, \log \left({\frac {1}{\mathbb{P}(x_i)}}\right)
\end{equation}

as the *self-information* of an event $x_i$ that occurs with probability $p_i$.

The *information entropy* of a probability distribution is then defined as the mean or expected self-information of its possible events and is given by

\begin{equation}
    \nonumber
    \mathbb{H}_K = -K\,\sum_i p_i\,\log p_i,
\end{equation}

where $K=1$ defines the *Shannon entropy*.

### Maximum Shannon entropy distributions
Assume we are given a set of $n$ possible events $\\{x_i\\}$ with mean $m$ and we want to find the associated probabilities $p_i$ that maximize the Shannon entropy $\mathbb{H}$.
Well, first of all we might ask, why maximize the entropy in the first place?
[Jaynes](https://journals.aps.org/pr/pdf/10.1103/PhysRev.106.620?casa_token=2gKJdUxOSPUAAAAA%3A6Ks88-YrdK28E_jxn3l0wA9q4Eo5SYkctGzDjrqrL7JPNAb3CtJGZ0UhRGyK2moRCXpACiEYY3fvLjc) gives us an insightful interpretation.
> The principle of maximum entropy may be regarded as an extension of the principle of insufficient reason (to which it reduces in case no information is given except enumeration of the possibilities $x_i$),with the following essential difference.
> The maximum-entropy distribution may be asserted for the positive reason that it is uniquely determined as the one which is maximally noncommittal with regard to missing information,instead of the negative one that there was no reason to think otherwise.
> Thus the concept of entropy supplies the missing criterion of choice which Laplace needed to remove the apparent arbitrariness of the principle of insufficient reason, and in addition it shows precisely how this principle is to be modified in case there are reasons for "thinking otherwise."

We can identify the maximum entropy distribution using the technique of Lagrange multipliers.
The sought distribution has to fulfill the properties $\sum_i p_i=1$ and $\sum_i x_i\,p_i=m$.
Consequently, we introduce two Langrange multipliers, $\gamma$ and $\beta$, and try to maximize the Lagrangian

\begin{equation}
    \nonumber
    L(p_1,\ldots,p_n,\gamma,\beta) = -\,\sum_i p_i\,\log p_i - \gamma\,\left(\sum_i p_i-1\right) - \beta\,\left(\sum_i x_i\,p_i-m\right).
\end{equation}

We compute the partial derivatives w.r.t. $p_i$ and equate them to $0$:

\begin{equation}
    \nonumber
    \frac{\partial\,L}{\partial\,p_i} = -(1+\log p_i) - \gamma - \beta\,x_i = 0.
\end{equation}

For simplicity of notation we introcue $\lambda=1+\gamma$, solve for $p_i$, and obtain

\begin{equation}
    \nonumber
    p_i = e^{-\lambda-\beta\,x_i}.
\end{equation}

To ensure that the all probabilities $p_i$ sum to $1$, we solve

\begin{equation}
    \nonumber
    \sum_i p_i = \sum_i e^{-\lambda-\beta\,x_i} = 1
\end{equation}

for $\lambda$ and obtain

\begin{equation}
    \nonumber
    \lambda = \log \sum_i e^{-\beta\,x_i}.
\end{equation}

With $Z:=\sum_i e^{-\beta\,x_i}$, we obtain $\lambda=\log Z$ and see

\begin{equation}
    \nonumber
    p_i = \frac{1}{Z}\,e^{-\beta\,x_i},
\end{equation}

where $Z$ is just a normalizing constant and is called the [partition function](https://en.wikipedia.org/wiki/Partition_function_(statistical_mechanics)).

### Maximum Shannon entropy and thermodynamics
We look at an ideal gas in a fixed volume $V$ with a total number of $N$ molecules that can constitute a microstate with one of $n$ fixed energy levels $x_i=E_i$.
Furthermore, we are given the total macrostate energy, given as the mean of the microstate energy levels $E=\sum_i E_i/N$, which means $m=E$ in this case.
We want to find the probabilites $p_i$ that the molecules form the microstates associated to energy levels $E_i$.
Following the maximum entropy approach from above, we obtain

\begin{equation}
    \nonumber
    p_i = \frac{1}{Z}\,e^{-\beta\,E_i},
\end{equation}

with $Z=\sum_i e^{-\beta\,x_i}$ and $\beta$ which can (theoretically) be identified by

\begin{equation}
    \nonumber
    m = E = \sum_i p_i\,E_i = \frac{1}{Z}\,\sum_i E_i\,e^{-\beta\,E_i}
\end{equation}

Unfortunately, not in all cases is the identification of $\beta$ an easy task.
As it turns out, $\beta$ is actually the [Thermodynamic beta](https://en.wikipedia.org/wiki/Thermodynamic_beta), also called *coldness*.

> Thermodynamic beta is essentially the connection between the information theory and statistical mechanics interpretation of a physical system through its entropy and the thermodynamics associated with its energy.
It expresses the response of entropy to an increase in energy.
If a system is challenged with a small amount of energy, then β describes the amount the system will randomize.

I will sketch two ways to identify $\beta$.
Essential is always the idea that the thermodynamic entropy $S$ is some kind of information entropy.
Remember that we are still free to choose a constant $K>0$, so let's assume 

\begin{equation}
    \nonumber
    S = \mathbb{H}_K = -K\,\sum_i p_i\,\log p_i = K\,\mathbb{H}
\end{equation}

for some unknown constant $K>0$.

### 1 - Beta as Lagrange multiplier

Note that after maximizing the Lagrangian, this means solving for $\lambda$ and $\beta$, we have $\mathbb{H} = L$ and hence

\begin{equation}
    \nonumber
    \frac{\dd{S}}{\dd{E}} = \frac{\partial (K\,\mathbb{H})}{\partial\,m}  = K\,\frac{\partial L}{\partial\,m} = K\beta.
\end{equation}

From the [Fundamental thermodynamic relation](https://en.wikipedia.org/wiki/Fundamental_thermodynamic_relation)

\begin{equation}
    \nonumber
    \dd{E} = T\,\dd{S} - P\dd{V}
\end{equation}

we get (assuming no change in volume $V$),

\begin{equation}
    \nonumber
    \frac{1}{T} = \frac{\dd{S}}{\dd{E}} = K\beta
\end{equation}

and hence $\beta=\frac{1}{K\,T}$.

Choosing $K=k_B$, the Boltzmann constant, makes our Lagrange multiplier $\beta$ the Thermodynamic beta.

### 2 - Beta through the second law of thermodynamics

We follow the sketch in the box on the right hand side of [this article](https://en.wikipedia.org/wiki/Entropy_(statistical_thermodynamics)#Gibbs_entropy_formula) and compute the total derivative of the thermodynamical entropy $S$ by

\begin{equation}
    \nonumber
    \dd{S} = \sum_i \frac{\partial S}{\partial\,p_i}\,\dd{p_i} = \sum_i -K\,(1+\log p_i)\,\dd{p_i} = -K\,\sum_i \dd{p_i} - K\,\sum_i(\log p_i)\,\dd{p_i},
\end{equation}

where $\sum_i \dd{p_i} = \dd{\left(\sum_i p_i\right)} = 0$, because the total probability remains equal to $1$ and does not change.
We plug in

\begin{equation}
    \nonumber
    p_i = \frac{1}{Z}\,\sum_i e^{-\beta\,E_i}
\end{equation}

and obtain

\begin{equation}
    \nonumber
    \dd{S} = -K \sum_i \log \left(\frac{1}{Z}\,e^{-\beta\,E_i}\right)\,\dd{p_i} = (K\,\log Z)\,\sum_i \dd{p_i} + K\beta\,\sum_i E_i\,\dd{p_i},
\end{equation}

where again $\sum_i \dd{p_i}=0$.
Now we apply the product rule $\dd{(E_i\,p_i)} = E_i\,\dd{p_i} + p_i\,\dd{E_i}$ and get

\begin{equation}
    \nonumber
    \dd{S} = K\beta\,\left[\sum_i \dd(E_i\,p_i) - \sum_i p_i\,\dd{E_i}\right],
\end{equation}

where $\sum_i \dd{(E_i\,p_i)} = \dd\left(\sum_i p_i\,E_i\right) = \dd{E}$ and $\sum_i p_i\,\dd{E_i}$ is the expectation value of the work done through the reversible process of changing $S$ only a tiny bit.
Consequently,

\begin{equation}
    \nonumber
    \dd{S} = K\beta\,(\dd{E} - \dd{W})
\end{equation}

and by the first law of thermodynamics, $\dd{E} = \dd{Q} + \dd{W}$ (see [Sign conventions](https://en.wikipedia.org/wiki/First_law_of_thermodynamics#Sign_conventions)), we obtain

\begin{equation}
    \nonumber
    \dd{S} = K\beta\,\dd{Q}.
\end{equation}

If we choose $K=k_B$, the Boltzmann constant, and $\beta=\frac{1}{k_B\,T}$, we end up with the [second law of thermodynamics](https://en.wikipedia.org/wiki/Second_law_of_thermodynamics#Introduction), namely $\dd{S} = \frac{1}{T}\,\dd{Q}$.

### Thermodynamic equilibrium
If our ideal gas is in thermodynamic equilibrium, then all microstates are equally likely, $p=p_i$.
This leads to

\begin{equation}
    S = -k_B\,\sum_i p\,\log p = -k_B\,\Omega\,\frac{1}{\Omega}\,\log \frac{1}{\Omega} = k_B\,\log\Omega,
\end{equation}

where $\Omega$ is the total number of microstates that represent the macrostate of thermodynamical equilibrium.
This relation is called [the fundamental assumption of statistical thermodynamics or the fundamental postulate in statistical mechanics](https://en.wikipedia.org/wiki/Entropy#Statistical_mechanics).


