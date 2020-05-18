![](h2o_fannie.png)

# Fanni Mae family loans

The [German Credit Data set](https://archive.ics.uci.edu/ml/datasets/statlog+(german+credit+data)) is a famous open credit risk data set. If you need a little bit more challenge then try the Single Family mortgages. 

* The is data set is much bigger than the 1000 records in the German Credit Data. Only for the years 2010/11/12 there are 6.1 mln. mortgages, and there are 20 years in total that you can download

* In contrary to the German credit data set, there is no target defined. There are performance data sets for the mortgages where you can / need to create your own target.

* The data is not in one table with 'X input columns' and 'a Y target column'. Some data cleaning and preparation still needs to be done. Moreover, the performance data sets allow you to create some additional variables your self.

This repo contains the analysis and modeling of Fannie Mae Single family loans with [h2o python](https://docs.h2o.ai/h2o/latest-stable/h2o-py/docs/intro.html).

See for further details, the [Fannie Mae website](https://www.fanniemae.com/portal/funding-the-market/data/loan-performance-data.html) and a [small slide deck](https://www.fanniemae.com/resources/file/fundmarket/pdf/webinar-101.pdf) on the data.

The main notebook is `h2o_modeling.ipynb` if you do not use all the data, only a few years then this analysis can be done on a descent laptop, otherwise a larger machine is needed. You can spin up a **h2o super machine** on [Google Cloud Platform](https://cloud.google.com/) if needed :-)
