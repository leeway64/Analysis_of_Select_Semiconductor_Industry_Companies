Analysis of Select Semiconductor Industry Companies
====================================================


.. image:: https://img.shields.io/badge/license-MIT-red.svg
    :target: LICENSE.txt
.. image:: https://img.shields.io/github/v/release/leeway64/Analysis_of_Select_Semiconductor_Industry_Companies
    :alt: GitHub release (latest by date)


Motivation
-----------

The semiconductor industry is perhaps the most important industry of the 21st century. It provides
the backbone to most of the advanced technology we almost always take for granted. Without
semiconductors, technology such as mobile phones, computers, and the internet would not be possible.

Big shout out to `The Economist <https://github.com/TheEconomist>`_. They always produce excellent
reporting and graphs/plots. For a particularly well-done project that they undertook, refer to their
`COVID-19 excess deaths model <https://github.com/TheEconomist/covid-19-the-economist-global-excess-deaths-model>`_


Abstract
----------

This project analyzes the relative strengths of some of the most important manufacturers in the 
semiconductor industry; the companies included in this study are Intel, TSMC (Taiwan Semiconductor
Manufacturing Company), Samsung Electronics, and SMIC (Semiconductor Manufacturing International
Corporation).

Read the full report/analysis `here <analysis/README.rst>`_.

.. image:: images/Stock_prices.png

.. image:: images/Plotted_statistics.png


Drawing the plots
-------------------

First, install this project onto your local machine and enter the R Console:

.. code-block:: bash

	git clone https://github.com/leeway64/Analysis_of_Select_Semiconductor_Industry_Companies.git
	R

Upon entering the R Console, you should see something to the effect of
``Project 'path/to/Analysis_of_Select_Semiconductor_Industry_Companies' loaded. [renv 0.16.0]``

Then, in the R Console, run the following commands:

.. code-block::

	source(here::here("scripts", "semiconductor_industry_companies_data_visualization.R"))
	

Alternatively, you can also run `semiconductor_industry_companies_data_visualization.R <scripts/semiconductor_industry_companies_data_visualization.R>`_ in RStudio.


References for Plots
-----------------------

This section serves as a list of the references used to create the plots. Refer to the
`report <./analysis/README.rst>`_ for a complete list of sources, including sources used to
create the report.

Intel
~~~~~~

**Revenue, R & D spending**: `Financial Results <https://www.intc.com/financial-info/financial-results>`_

**Stock price**: `Yahoo Finance <https://finance.yahoo.com/quote/INTC/history?period1=322099200&period2=1630713600&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true>`_

TSMC
~~~~~

**Revenue, profit, R & D spending**: `Annual Reports <https://investor.tsmc.com/english/annual-reports>`_

**Stock price**: `Yahoo Finance <https://finance.yahoo.com/quote/TSM/history?period1=876355200&period2=1630713600&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true>`_

Samsung
~~~~~~~~

**Profit**: `Financial Statements <https://www.samsung.com/global/ir/financial-information/audited-financial-statements/>`_

**Stock price**: `Yahoo Finance <https://finance.yahoo.com/quote/005930.KS/history?period1=946857600&period2=1630713600&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true>`_

SMIC
~~~~~

**Profit**: `Financials <https://www.smics.com/en/site/company_financialSummary>`_

**Stock price**: `Yahoo Finance <https://finance.yahoo.com/quote/0981.HK/history?period1=1079481600&period2=1630713600&interval=1wk&filter=history&frequency=1wk&includeAdjustedClose=true>`_



Third Party Software
----------------------
- `renv <https://rstudio.github.io/renv/>`_ (MIT License): Reproducible environment creation library;

- `here <https://here.r-lib.org/>`_ (MIT License): Library for making file referencing easier.

- `rio <https://cran.r-project.org/web/packages/rio/index.html>`_ (GPL-2): File input/output.

- `dplyr <https://dplyr.tidyverse.org/>`_ (MIT License): Data manipulation library.

- `ggplot2 <https://ggplot2.tidyverse.org/>`_ (MIT License): Plotting library.

- `gridExtra <https://cran.r-project.org/web/packages/gridExtra/index.html>`_ (GPL-2 | GPL-3): Grid graphics manipulation.

- `box <https://klmr.me/box/>`_ (MIT License): Package to increase modularity of R code.

The ``grid`` library comes included with R.


License
----------

My `analysis <analysis/README.rst>`_ is licensed under the `Creative Commons Attribution 4.0 
International license <https://creativecommons.org/licenses/by/4.0/>`_.

The source code used to create the plots is licensed under the `MIT License <LICENSE.txt>`_.
