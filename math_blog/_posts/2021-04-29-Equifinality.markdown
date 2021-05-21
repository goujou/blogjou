---
layout: post
title: Equifinality or why $x\neq 5$
author: goujou
date:   2021-04-29
---
** THIS ARTICLE IS A STUB **

The idea of symmetry leads naturally to the concept of entropy and together they can help mitigate or even solve the problem of equifinality in very general situations.

Suppose we aim at finding a definite value for $X>0$ such that

\begin{equation}
    \nonumber
    \frac{X}{X}=1.
\end{equation}

[According to the Max Planck Institute for Mathematics](https://www.der-postillon.com/2012/08/mathemuffel-erleichtert-wert-von-x-ein.html) the one and only choice is $x=5$.
In the following I will instead make the case for $X=1$ and show how the latter can help solve the problem of equifinality in the realm of shades associated to the problem of model selection.

Let's first consider a slightly more general question:
How to choose $X>0$ and $Y>0$ if 

\begin{equation}
    \label{eqn:XYk}
    X\cdot Y=k
\end{equation}

for some given $k>0\,$?
Again, any pair of positive real numbers would solve the equation, nevertheless the most natural choice to me is

\begin{equation}
    \nonumber
    X=Y=\sqrt{k}.
\end{equation}

The feeling that this is the natural choice comes from a love for symmetry.
No other pair $(X, Y)$ offers the same perfect level of symmetry in $X$ and $Y$.
While in this example the perfect symmetry solution is obvious, it is less obvious how we can find the most symmetric pair $(X, Y)$ such that

\begin{equation}
    \label{eqn:XYsquaredk}
    X\cdot Y^2=k.
\end{equation}

In order to solve this problem, we need a measure for symmetry to justify why

\begin{equation}
    \nonumber
    (X, Y) = (\sqrt{k}, \sqrt{k})
\end{equation}

is more symmetric than, for instance,

\begin{equation}
    \nonumber
    (X, Y) = \left(2\,\sqrt{k}, \frac{1}{2}\,\sqrt{k}\right),
\end{equation}
which would also solve Eq. \eqref{eqn:XYk}.

### Symmetry = Entropy

Imagine, we have a total amount of $M>0$ available to be distributed randomly to $X$ and $Y$.
We can write this as

\begin{equation}
    \nonumber
    X = p \cdot M\quad\text{and}\quad Y=q \cdot M
\end{equation}

for some $p,q \geq 0$ such that $q=1-p$.
Now we define our measure of symmetry of $(X, Y$) as

\begin{equation}
    \nonumber
    \mathbb{S}(X, Y) := \mathbb{H}(p) := -\,(p \log p + q \log q) = -p\log p -(1-p)\log(1-p).
\end{equation}

We immediately recognize this symmetry function as the entropy of a binomial random variable.
Consequently, maximum symmetry corresponds to maximum entropy and we can interpret the most symmetric pair $(X, Y)$ also as the most honest choice given our state of knowledge about $X$ and $Y$.
In order to find the pair $(X, Y$) that solves Eq. \eqref{eqn:XYk} with highest symmetry/entropy, we need find $p$ and $M$ to maximize

\begin{equation} 
    \nonumber
    \mathcal{L}(p, M, \lambda) := \mathbb{H}(p) + \lambda\,g(p, M).
\end{equation}

Here $\lambda$ is a Lagrange multiplier and

\begin{equation}
    \label{eqn:g1}
    g(p, M) := p\,M \cdot (1-p)\, M - k
\end{equation}

makes sure that

\begin{equation}
    \nonumber
    X \cdot Y = p\,M \cdot (1-p)\,M = k
\end{equation}

and thus

\begin{equation}
    \nonumber
    (X, Y) = (p\,M, (1-p)\,M)
\end{equation}

is the most symmetric and in turn most uninformed pair of positive real numbers that solve Eq. \eqref{eqn:XYk}.
In the present situation, we do not need to solve the equation system too formally.
Naturally, we hope to have $p=1/2$ as a possible solution, because it would lead to the highest entropy even in an unrestricted situation.
We are lucky here, the first naive choice of $p=1/2$ solves Eq. \eqref{eqn:g1} with $M=2\,\sqrt{k}$ and we are done.
The most symmetric and most uninformed information to Eq. \eqref{eqn:XYk} is associated to $p=1/2$ and is

\begin{equation}
    \nonumber
    (X, Y) = (p\,M, (1-p)\,M) = (\sqrt{k}, \sqrt{k}).
\end{equation}

The already mentioned alternative solution of Eq. \eqref{eqn:XYk}, given by

\begin{equation}
    \nonumber
    (X, Y) = \left(2\,\sqrt{k}, \frac{1}{2}\,\sqrt{k}\right),
\end{equation}

corresponds to $p=\frac{4}{5}$ and 

\begin{equation}
    \nonumber
    \mathbb{S}\left(2\,\sqrt{k}, \frac{1}{2}\,\sqrt{k}\right)
    = \mathbb{H}\left(\frac{4}{5}\right) 
    < \mathbb{H}\left(\frac{1}{2}\right)
    = \mathbb{S}(\sqrt{k}, \sqrt{k}).
\end{equation}

This means that this alternative solution, and this holds for all solutions to Eq. \eqref{eqn:XYk} except for the one corresponding to $p=1/2$, is not maximally symmetric and does not have maximum entropy.
Consequently, all alternative solutions have some information encoded that we, purely from the given task of solving Eq. \eqref{eqn:XYk} for $X$ and $Y$, are actually not provided with.
They contain some unintended guesswork from our side.
The one solution that contains only the avaiable information and hence is the most honest and fairest choice, is $X=Y=\sqrt{k}$ and corresponds to $p=1/2$.

What about \eqref{eqn:XYsquaredk} now? Well, let us be naive again and try $p=1/2$.
We have to solve

\begin{equation}
    \nonumber
    \frac{1}{2}\,M\,\frac{1}{4}\,M^{2} = k,
\end{equation}

which leads us to $M^{3} = 8\,k$, problem solved with $p=(1-p)=1/2$, so still no symmetry break between $X$ and $Y$.

A classical collinearity problem could lead to dependencies such as

\begin{equation}
    \nonumber
    Y = a\,X+b,
\end{equation}

or equaivalently

\begin{equation}
    g(X, Y) =  a\,X + b - Y.
\end{equation}

Let us test our prefered maximal symmetry solution $X=Y=1/2\,M$ against $g(X, Y)=0$.
We see

\begin{equation}
    \nonumber
    0 = \frac{1}{2}\,a\,M + b - \frac{1}{2}\,M = \frac{1}{2}\,M\,(a-1) + b
\end{equation}

or

\begin{equation}
    \nonumber
    M = \frac{2\,b}{1-a}.
\end{equation}


<!--
### Symmetry = Entropy

Imagine, we have a total amount of $M>0$ available to be distributed randomly to $X$ and $Y$.
We can write this as

\begin{equation}
    \nonumber
    X = p_1 \cdot M\quad\text{and}\quad Y=p_2 \cdot M
\end{equation}

for some $p_i \geq 0$ such that $\sum_i p_i=1$.
Now we define our measure of symmetry of $(X, Y$) as

\begin{equation}
    \nonumber
    \mathbb{S}(X, Y) := \mathbb{H}(\vec{p}) := -\sum_i p_i \cdot \log p_i,\quad \vec{p} = (p_i)_{i}.
\end{equation}

We immediately recognize this symmetry function as the entropy of a binomial random variable.
Consequently, maximum symmetry corresponds to maximum entropy and we can interpret the most symmetric pair $(X, Y)$ also as the most honest choice given our state of knowledge about $X$ and $Y$.
In order to find the pair $(X, Y$) that solves Eq. \eqref{eqn:XYk} with highest symmetry/entropy, we need find $\vec{p}$ such that

\begin{equation} 
    \nonumber
    \mathcal{L}(\vec{p}, M, \lambda) := \mathbb{H}(\vec{p}) + \lambda\,g(\vec{p}, M),
\end{equation}

becomes maximum.
Here $\lambda$ is a Lagrange multiplier and

\begin{equation}
    \nonumber
    g(\vec{p}, M) := p_1\,M \cdot p_2\, M - k
\end{equation}

makes sure that

\begin{equation}
    \nonumber
    X \cdot Y = p_1\,M \cdot p_2\,M = k
\end{equation}

and thus

\begin{equation}
    \nonumber
    (X, Y) = (p_1\,M, p_2\,M)
\end{equation}

is the most symmetric and in turn most uninformed pair of positive real numbers that solve Eq. \eqref{eqn:XYk}.
-->



