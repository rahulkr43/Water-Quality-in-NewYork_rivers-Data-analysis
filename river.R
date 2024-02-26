library(readxl)
river_data <- read_excel("river data.xlsx")
View(river_data)

river_data
data <- river_data
#Missing Data Visualization.
sapply(river_data, function(x) sum(is.na(x)))
#data <- na.omit(river_data)
#data

#To find the extreme values, we will represent them graphically using the boxplot function, which also returns them to us

par(mfrow = c(3, 2))
Y_outliers <- boxplot(data$y , main = 'Mean nitrogen concentration (mg/liter)' )
x1_outliers <- boxplot(data$x1 , main = 'Agriculture: percentage of land area' )
x2_outliers <- boxplot(data$x2, main = 'Forest: percentage of forest land' )
x3_outliers <- boxplot(data$x3, main = 'Residential: percentage of land area' )
x4_outliers <- boxplot(data$x4, main = 'Commercial/Industrial:percentage of land area' )

#Checking the normality and homogeneity of the variance We will check these conditions for the following numerical variables: 

Y_outliers <- hist(data$y , main = 'Mean nitrogen concentration',xlab ='mg/liter' )
x1_outliers <- hist(data$x1 , main = 'Agriculture ',xlab = 'percentage of land area' )
x2_outliers <- hist(data$x2, main = 'Forest',xlab ='percentage of forest land' )
x3_outliers <- hist(data$x3, main = 'Residential', xlab= 'percentage of land area' )
x4_outliers <- hist(data$x4, main = 'Commercial/Industrial',xlab= 'percentage of land area' )


numeric_data <- data[, c('y', 'x1', 'x2', 'x3', 'x4')]
res <- cor(numeric_data, method = 'spearman')
round(res, 2)

library(corrplot)
## corrplot 0.92 loaded
corrplot(res, type="upper", order="hclust",addCoef.col = "white")

# Get summary of the data
summary(river_data)

#Checking the normality of our Dependent variable


shapiro.test(river_data$y)

# perfoem the MUltiple regression 
mdl <- lm(river_data$y~x1+x2+x3,data = river_data)
summary(mdl)

x <- model.matrix(~x1+x2+x3+x4,river_data)  # x= independent variable
x
y <-river_data$y   # y= dependent variable
y  
xtxi <- solve(t(x)%*%x)
xtxi

solve(crossprod(x,x),crossprod(x,y))
names(mdl)

mdls<- summary(mdl)
mdls
names(mdls)

sqrt(deviance(mdl)/df.residual(mdl))
mdls$sigma
xtxi<-mdls$cov.unscaled
sqrt(diag(xtxi))*60975
mdls$coef[,2]

1-deviance(mdl)/sum((y-mean(y))^2)
mdls$r.squared

new_mdl <-lm(y~x1+x2+x3+x4,data = river_data)
new_mdl
plot(new_mdl)
summary(new_mdl)


































