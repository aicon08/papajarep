---
title: Replication of Experiment 2 from Nairne, Pandeirada, and Thompson (2008) 'The
  Comparative Value of Survival Processing'
shorttitle: Adaptive Memory
author: Aira Contreras\textsuperscript{1}
affiliation:
- id: '1'
  institution: Brooklyn College of the City University of New York
authornote: |
  This project has been done for Professor Crumps' Spring 2019 Special Topics in Experimental Psychology Pscy. 7709G.
abstract: |-
  The experiments in the @nairne2008adaptive paper test human memory systems in survival and non-survival conditions in an effort to determine if one yields measurably better recollection from participants. Participants were asked to rate words in conditions that produce excellent retention including conditions that had words related to pleasantness, imagery, and self reference. Previous experiments have suggested that participants show superior memory when words  were related to survival conditions. The researchers suggest that this may be a result of fitness advantages accrued in the ancestral past. The goal of this exercise is to replicate one of the experiments presented in the paper and determine if the results were similar or even the same. The analysis will be done via the Rstudio software. I was able to [successfully/not successfully] replication the experiment.



  <!-- https://tinyurl.com/ybremelq -->

  !!!papaja-author-note(This project has been done for Professor Crumps' Spring 2019 Special Topics in Experimental Psychology Pscy. 7709G.


  Correspondence concerning this article should be addressed to Aira Contreras, Not Applicable. E-mail: aira.contreras@gmail.com)papaja-author-note!!!
keywords: Replication, Adaptive Memory, Survival, Graduate Class
wordcount: X
bibliography: r-references.bib
floatsintext: no
figurelist: no
tablelist: no
footnotelist: no
linenumbers: no
mask: no
draft: no
documentclass: apa6
classoption: man
output: papaja::apa6_pdf
header-includes: |
  ```{=latex}
  \shorttitle{Adaptive Memory}
  \affiliation{
  \vspace{0.5cm}
  \textsuperscript{1} Brooklyn College of the City University of New York}
  \keywords{Replication, Adaptive Memory, Survival, Graduate Class\newline\indent Word count: X}
  \usepackage{csquotes}
  \usepackage{upgreek}
  \captionsetup{font=singlespacing,justification=justified}

  \usepackage{longtable}
  \usepackage{lscape}
  \usepackage{multirow}
  \usepackage{tabularx}
  \usepackage[flushleft]{threeparttable}
  \usepackage{threeparttablex}

  \newenvironment{lltable}{\begin{landscape}\begin{center}\begin{ThreePartTable}}{\end{ThreePartTable}\end{center}\end{landscape}}

  \makeatletter
  \newcommand\LastLTentrywidth{1em}
  \newlength\longtablewidth
  \setlength{\longtablewidth}{1in}
  \newcommand{\getlongtablewidth}{\begingroup \ifcsname LT@\roman{LT@tables}\endcsname \global\longtablewidth=0pt \renewcommand{\LT@entry}[2]{\global\advance\longtablewidth by ##2\relax\gdef\LastLTentrywidth{##2}}\@nameuse{LT@\roman{LT@tables}} \fi \endgroup}


  \DeclareDelayedFloatFlavor{ThreePartTable}{table}
  \DeclareDelayedFloatFlavor{lltable}{table}
  \DeclareDelayedFloatFlavor*{longtable}{table}
  \makeatletter
  \renewcommand{\efloat@iwrite}[1]{\immediate\expandafter\protected@write\csname efloat@post#1\endcsname{}}
  \makeatother
  ```

---







# Methods
## Participants
Twenty-four participants were recruited into the experiment. It is unclear what the demographics of these participants are, though it could be surmised that they may have been of the average undergraduate population (late teens, early twenties) because some were rewarded with partial credit to an introductory psychology course.

## Apparatus
Two different experimental conditions were created: Survival and Vacation.These two conditions were further subdived into 4 experimental blocks. Participants were demonstrated each of the two conditions within the 4 blocks and tested individually in sessions that lasted approximatedly 30 minutes.

## Materials and Design
In the study a set of 38 unrelated words (32 experimental words and 6 practice words) were created using the updated Battig and Montigue norms [@van2004category].Four blocks, each containing 8 words in random order, were created. Particpants all experienced the same random order. Participants were asked to rate 16 words with the survival scenario (S) and 16 words using the vacation scenario (V; see above criteria excluding Survival). The rating scale was from 1 (totally irrelevant) to 5(extremely relevant). Presentation of the words in 2 conditions (SVSV or VSVS) was followed by a retention invertval (digit recall task), and then an unexpected free recall was done to test memory.

## Procedure

As described by the paper, participants were randomly assigned into one of the two experimental conditions upon arrival to the lab. Counterbalancing was taken into consideration. General instructions were provided instructing to rate words according to the particular scenarios. At the begining of each block, either the survival instructions appeared or the vacation instructions appeared; participants rated three practice words to ensure the two rating scenarios were understood. All blocks were presented, with the fourth block followed by a distractor task and then the surprise free-recall. For more detail on the instructions please read Experiment 1 procedure for Survival and Experiment 2 procedure for Vacation in @nairne2008adaptive. 


## Data analysis
A within-subjects analysis of variance (ANOVA) was conducted to analyze the data collected. Lecture from Dr. Erin M. Buchanan used as learning tool to perform a within subjects ANOVA [@R-One-WayVid]. Recommended R packages downloaded according to video instructions. 

Original citation from papaja was also retained: 'We used R [Version 3.5.2; @R-base] and the R-packages *devtools* [Version 2.0.1; @R-devtools], *dplyr* [Version 0.8.0.1; @R-dplyr], *ez* [Version 4.4.0; @R-ez], *ggplot2* [Version 3.1.0; @R-ggplot2], *lattice* [Version 0.20.38; @R-lattice], *One-WayVid* [@R-One-WayVid], *papaja* [Version 0.1.0.9842; @R-papaja], *plyr* [Version 1.8.4; @R-dplyr; @R-plyr], *pwr* [Version 1.2.2; @R-pwr], *readxl* [Version 1.3.1; @R-readxl], *reshape2* [Version 1.4.3; @R-reshape2], *Rmisc* [Version 1.5; @R-Rmisc], *schoRsch* [Version 1.5; @R-schoRsch], and *usethis* [Version 1.4.0; @R-usethis] for all our analyses.'


# Results




```
## Warning: Collapsing data to cell means. *IF* the requested effects are a
## subset of the full design, you must use the "within_full" argument, else
## results may be inaccurate.
```

```
## $`--- ANOVA RESULTS     ------------------------------------`
##        Effect        MSE df1 df2      F     p petasq getasq
## 1 (Intercept) 0.01497070   1  24 779.56 0.000   0.97   0.95
## 2   Condition 0.01261393   1  24   6.54 0.017   0.21   0.11
## 
## $`--- SPHERICITY TESTS  ------------------------------------`
## [1] "N/A"
## 
## $`--- FORMATTED RESULTS ------------------------------------`
##        Effect                                   Text
## 1 (Intercept) F(1, 24) = 779.56, p < .001, np2 = .97
## 2   Condition F(1, 24) =   6.54, p = .017, np2 = .21
## 
## $`NOTE:`
## [1] "Reporting unadjusted p-values."
```

![ ](Midterm_Project_files/figure-latex/unnamed-chunk-2-1.pdf) 




\newpage

# References


\begingroup
\setlength{\parindent}{-0.5in}
\setlength{\leftskip}{0.5in}

<div id = "refs"></div>
\endgroup
