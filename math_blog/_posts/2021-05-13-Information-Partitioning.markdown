---
layout: post
title: Information partititioning into synergistic, unique, and redundant components
author: goujou
date:   2021-05-13
---
I would like to explain how the partitioning of mutual information into synergistic, unique, and redundant components works.
This is a short summary of Section 2 in[Temporal information partitioning: Characterizing synergy, uniqueness, and redundancy in interacting environmental variables](http://doi.org/10.1002/2016WR020216).

Assume we have two variables $X_{s1}$ and $X_{s2}$ as sources and one target variable $X_{tar}$.
The source variables carry information about the target variable.
This information is described by the mutual information
\begin{equation}
    \nonumber
    I(X_{s1},X_{s2};X_{tar}) = \sum p(x_{s1},x_{s2},x_{tar})\,\log\frac{p(x_{s1},x_{s2},x_{tar})}{p(x_{s1},x_{s2})\,p(x_{tar})}.
\end{equation}

We are now interested in how much each source variable contributes to the target variable only in combination with the other source variable, alone, and redundantly because of the presence of the other source variable.
This leads to an information partitioning

\begin{equation}
    \nonumber
    \begin{aligned}
        I(X_{s1},X_{s2};X_{tar}) &=\quad U_{X_{s1}}(X_{s1}, X_{s2}; X_{tar}) \newline
        &\quad + U_{X_{s2}}(X_{s1}, X_{s2}; X_{tar}) \newline
        &\quad + S(X_{s1},X_{s2};X_{tar}) \newline
        &\quad + R(X_{s1},X_{s2};X_{tar}),
    \end{aligned}
\end{equation}

where $U$, $S$, and $R$ are required to be nonnegative.
This partitioning is not unique per se.
Key is to devise a reasonable concept for the redundancy.

## Redundancy
The interaction information, also called co-information, is given by

\begin{equation}
    \nonumber
    \mathrm{II} = I(X_{s1},X_{s1};X_{tar}) - I(X_{s1};X_{tar}) - I(X_{s2};X_{tar})
\end{equation}

and describes the two sources' mutual mutual information with the target minus the two separated mutual information of the sources and the target.
Another way to interpret the interaction information is

\begin{equation}
    \nonumber
    \mathrm{II} = S(X_{s1},X_{s2};X_{tar}) - R(X_{s1},X_{s2};X_{tar}),
\end{equation}

and can serve as a starting point to define the redundancy $R$.
If $\mathrm{II}<0$, then necessarily $R>-\mathrm{II}$, giving us

\begin{equation}
    \nonumber
    R_{\text{min}} = \max \\{0, -\mathrm{II}\\}
\end{equation}

as a lower bound for the redundancy.
An upper bound is given by the smaller value of the two mutual information of the sources with the target:

\begin{equation}
    \nonumber
    R_{\text{max}} = \min \\{I(X_{s1};X_{tar}), I(X_{s2};X_{tar})\\},
\end{equation}

because a variable cannot contribute more information to redundancy than what it actually carries with itself.
So we are leaft to deal with intemediate values.
Here we can make use of the source dependency

\begin{equation}
    \nonumber
    I_S = \frac{I(X_{s1},X_{s2})}{\min \\{H(X_{s1}),H(X_{s2})\\}},
\end{equation}

where 

\begin{equation}
    \nonumber
    H(X) = - \sum p(x)\,\log p(x)
\end{equation}

denotes the Shannon information entropy of a random variable $X$.
If $X_{s1}$ and $X_{s2}$ are independent, then $I_S=0$, and if $X_{s1}$ and $X_{s2}$ are completely dependent, then $I_S=1$.
Hence, the authors define the *rescaled redundancy* as

\begin{equation}
    \nonumber
    R_S = R_{\text{min}} + I_S\,(R_{\text{max}}-R_{\text{min}}).
\end{equation}

## Synergistic and unique components
We immediately obtain

\begin{equation}
    \nonumber
    S(X_{s1},X_{s2};X_{tar}) = \mathrm{II} + R_S
\end{equation}

and from

\begin{equation}
    \nonumber
    I(X_{si};X_{tar}) = U_{X_{si}}(X_{s1},X_{s2};X_{tar}) + R_S,\quad i=1,2,
\end{equation}

we can easily infer the unique components.

## Conclusions

If we are given a dataset consisting of two source variables and one target variable that is rich enough to enable us to compute the joint probability distribution $p(x_{s_1},x_{s2},x_{tar})$, then we can identify how much each source variable explains the target variable just by itself, only in conjuction with the other source variable, and redundantly together with the other source variable.

