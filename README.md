# Multiple-Linear-Regression-Analysis
A repo on how to perform multiple linear regression analysis. I have used a sample of  20 newyork's river data that analyses the relationship between• Mean nitrogen concentration (mg/liter) • Agriculture: percentage of land area • Forest: percentage of forest land • Residential: percentage of land area  .

### A. Loading the Dataset to R studio by importing to text (base)
- Variables in Study of Water Pollution in New York Rivers.Variable Defination
- Y                           Mean nitrogen concentration (mg/liter) based on samples taken at regular intervals during the spring, summer, and fall months
- X1                           Agriculture: percentage of land area currently in agricultural use
- X2                           Forest: percentage of forest land 
- X3                           Residential: percentage of land area in residential use 

 ### Missing data visualization
```
sapply(river_data, function(x) sum(is.na(x)))
```
### if we have missing values in data the we have to remove these missing value
```
 data <- na.omit(river_data)
```
- Get the summary of the river.data dataset to check that it has been read correctly.
```
summary(head.data)
```

### B. Ensuring that our data meets the main assumptions
1.To find the extreme values, we will represent them graphically using the boxplot function, which also returns them to us
```
par(mfrow = c(3, 2))
Y_outliers <- boxplot(data$y , main = 'Mean nitrogen concentration (mg/liter)' )
x1_outliers <- boxplot(data$x1 , main = 'Agriculture: percentage of land area' )
x2_outliers <- boxplot(data$x2, main = 'Forest: percentage of forest land' )
x3_outliers <- boxplot(data$x3, main = 'Residential: percentage of land area' )
x4_outliers <- boxplot(data$x4, main = 'Commercial/Industrial:percentage of land area' )
2. Normality - Using the boxplot() function to test whether our dependent variable follows a normal distribution.                                                            ```
                                                                                
```
hist(heart.data$heart.disease)
```
![hist](https://github.com/Marx-wrld/Multiple-Linear-Regression-Analysis/assets/105711066/c71a9656-9dff-48ad-bfe5-5635f4e4a5c2)



