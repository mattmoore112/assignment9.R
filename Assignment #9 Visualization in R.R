# Load the Lab Analysis dataset
adlb <- read.csv("admiral_adlb.csv")

head(adlb)

# Base R Graphics 
# Scatter plot: Age vs. Lab Analysis Value
plot(adlb$AGE, adlb$AVAL,
     main = "Base R: Age vs. Lab Analysis Value",
     xlab = "Age",
     ylab = "Lab Analysis Value",
     pch = 19)

# Histogram: Lab Analysis Values
hist(adlb$AVAL,
     main = "Base R: Distribution of Lab Analysis Values",
     xlab = "Lab Analysis Value",
     ylab = "Frequency")

# Lattice Graphics 
library(lattice)

# Scatter plot by treatment
xyplot(AVAL ~ AGE | factor(TRT01A),
       data = adlb,
       main = "Lattice: Lab Analysis Value vs. Age by Treatment",
       xlab = "Age",
       ylab = "Lab Analysis Value")

# Box plot by sex
bwplot(AVAL ~ factor(SEX),
       data = adlb,
       main = "Lattice: Lab Analysis Values by Sex",
       xlab = "Sex",
       ylab = "Lab Analysis Value")

# ggplot2
library(ggplot2)

# Scatter plot with trend line
ggplot(adlb, aes(x = AGE, y = AVAL, color = factor(TRT01A))) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: Lab Analysis Value vs. Age by Treatment",
       x = "Age",
       y = "Lab Analysis Value",
       color = "Treatment") +
  theme_minimal()

# Faceted histogram
ggplot(adlb, aes(AVAL)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~ TRT01A) +
  labs(title = "ggplot2: Lab Analysis Value Distribution by Treatment",
       x = "Lab Analysis Value",
       y = "Frequency") +
  theme_minimal()
