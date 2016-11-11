Sales Forecasting on Product Demand
=============
Safety stock (also called buffer stock) is a term used by logisticians to describe a level of extra stock that is maintained to mitigate risk of stockout due to uncertainties in supply and demand. Adequate safety stock levels permit business operations to proceed according to their plans. Safety stock is held when there is uncertainty in demand, supply, or manufacturing yield; it serves as an insurance against stockout.

Challenge:
---
Before I join Galvanize, I worked in a auto parts company. The biggest challenge they encountered is get the right amount of product at the right time. Due to the business growth, they have more than twenty product category, and each category has hundreds product. Due to the complex situation, they end up with using moving average as their prediction model.  

The main goal of this project is find a alternative prediction model that can get more accuracy forecast result than the moving average models.

Data Analyst:
---
After reviewing their past five year sales history trend, I found that the overall trend does not change much, but the variance for the monthly order quantity is increasing as the time goes by. That explains how moving average model fail to catch the shock point.

Methodology:
---
After identifying the root cause, I decide to use random forecast instead of ARIMA or linear regression as my prediction model selection for the following reasons:
  1. Random forest can predict the forecast for multiple products at the same time, but ARIMA can only predict one product at one time.
  2. Due to the sales volume variance among products is very high, the random forest can handle this issue better than the linear regression.

The diagram explains how my models works. The basic idea is using the product related features and the sales related features as the prediction input to calculate the forecast.
Additionally, I added a buffer month in between to address real world situations:
  1. The lead time for their products is roughly a month.
  2. I cannot have the complete sales data until the end of the month.

Therefore, I exclude the last month sales data from my model.

Result:
---
The measurement tools I use to determine the performance between two prediction models is Mean Absolute Deviation(MAD). The value represent the the average distance between prediction value and the true value. I use both model and apply the backward forecasting to get their prediction result from Jan'16 to Sep'16, and accumulate the MAD value together to see the difference.  Based on the result I got, the random forest model can reduce the error value by 10%
