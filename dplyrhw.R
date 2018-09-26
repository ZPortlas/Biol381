# Homework: manipulating data with dplyr
# Biol 381 9/26/18
# ZMP
###

library("dplyr")
glimpse(iris)
### 150 observations and 5 variables

iris1 <- filter(iris, Species == c("virginica", "versicolor"), Sepal.Length > 6, Sepal.Width > 2.5)
glimpse(iris1)
### 28 observations and 5 variables

iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width)
glimpse(iris2)
head(iris2)
### 28 observations and 3 variables

iris3 <- arrange(iris2, desc(Sepal.Length))
head(iris3)

iris4 <- mutate(iris3, Sepal.Area = Sepal.Length*Sepal.Width)
glimpse(iris4)
### 28 observations and 4 variables

iris5 <- summarize(iris4, meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), number = n())
print(iris5)

irisSpecies <- group_by(iris4, Species)
iris6 <- summarize(irisSpecies, meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), number = n())
print(iris6)

##### Using pipes instead!
iris %>%
  filter(Species == c("virginica", "versicolor"), Sepal.Length > 6, Sepal.Width > 2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length*Sepal.Width) %>%
  group_by(Species) %>%
  summarize(meanLength = mean(Sepal.Length), meanWidth = mean(Sepal.Width), number = n())
