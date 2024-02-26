## Multiple linear regression on the Water Pollution in New York Rivers
#project on water pollution of New-york river’s data 
#1976 study exploring the relationship between water quality and land use, Haith (1976) #obtained the measurements (shown in Table 1.8) on 20 river basins in New York State. A #question of interest here is how the land use around a river basin contributes to the #water pollution as measured by the mean nitrogen concentration (mglliter). The data are #shown in Table 1.9 and can also be found at the book website & also on my github :



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
