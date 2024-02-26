#Multiple linear regression on the Water Pollution in New York Rivers
#Multiple linear regression on the percentage of people
#biking to work each day, the percentage of people smoking, 
#and the percentage of people with heart disease in an imaginary
#sample of 500 towns.


## Load the data into R by importing the dataset to the text(base)

## Get the summary of the data

summary(heart.data)

## Checking that our data meets the main assumptions for linear regression

cor(heart.data$biking, heart.data$smoking)

hist(heart.data$heart.disease)

plot(heart.disease ~ biking, data=heart.data)

plot(heart.disease ~ smoking, data=heart.data)

## Performing the linear regression analysis

heart.disease.lm<-lm(heart.disease ~ biking + smoking, data = heart.data)

summary(heart.disease.lm)

## Checking for homoscedasticity

par(mfrow=c(2,2))
plot(heart.disease.lm)
par(mfrow=c(1,1))

## Visualizing the results with a graph
###->step 1: creating a new dataframe with the information needed to plot the model

plotting.data<-expand.grid(
  biking = seq(min(heart.data$biking), max(heart.data$biking), length.out=30),
  smoking=c(min(heart.data$smoking), mean(heart.data$smoking), max(heart.data$smoking)))

###->step 2: Prediciting the values of heart disease based on my linear model

plotting.data$predicted.y <- predict.lm(heart.disease.lm, newdata=plotting.data)

###->step 3: Rounding the smoking numbers to two decimals

plotting.data$smoking <- round(plotting.data$smoking, digits = 2)

###->step 4: Changing the ‘smoking’ variable into a factor

plotting.data$smoking <- as.factor(plotting.data$smoking)

###->step 5: Plotting the original data

heart.plot <- ggplot(heart.data, aes(x=biking, y=heart.disease)) +
  geom_point()

heart.plot

###->step 6: Adding the regression lines

heart.plot <- heart.plot +
  geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking), size=1.25)

heart.plot

###->step 7: Making the graph ready for publication

heart.plot <-
  heart.plot +
  theme_bw() +
  labs(title = "Rates of heart disease (% of population) \n as a function of biking to work and smoking",
       x = "Biking to work (% of population)",
       y = "Heart disease (% of population)",
       color = "Smoking \n (% of population)")

heart.plot

###->Adding our regression model to the graph
