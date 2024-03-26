#Print & Class

print("Hello World! That's my first Data Mining Homework.")

x=2 
class(x)
y="hello world"
print(y)
class(y)

#Combine & length

x = c(1,2,3,4)
class(x)
name=c("Cansu","Gürkan")
name
length(x)
y
length(y)

#Function

sq = function(x) {
  return(x^2)
}
print(sq(25))

#Data Input/Output - View, head, dim, help, nrow, ncol

mydat = read.csv("http://johnmuschelli.com/intro_to_r/data/Youth_Tobacco_Survey_YTS_Data.csv")
View(mydat)
head(mydat)

View(mtcars)

install.packages("carData")
library(carData)
data(Salaries)
View(Salaries)

help("dim")
dim(mydat)
dim(mtcars)
dim(Salaries)


nrow(mydat)
ncol(Salaries)


#Rename & Names
install.packages("dplyr")
library(dplyr)
data_renamed = rename(mydat, year=YEAR)

names(mydat)
names(data_renamed)

#Readr

install.packages("readr")
library(readr)

data_renamed_2 = rename(data_renamed, Year=year)
write.csv(data_renamed_2, path="tutun.csv")  #There is an error here
getwd()


#ls - all data and functions we have done

ls()


#Dataframe & tibble

install.packages("tidyverse")
library(tidyverse)


mydat2=data(mtcars) #mydat as a value
View(df)
mydat2=data.frame(mtcars) #mydat as a data, equals to mtcars
dim(mydat2)
head(mydat2)
View(mydat2) 

mydat2_tibble = as_tibble(mydat2)

#Uppercase & Lowercase

mydat2_renamed = dplyr::rename(mydat2_tibble, MPG=mpg)
mydat2_renamed2 = dplyr::rename_all(mydat2_renamed, toupper)

#filter & select & pipe

mydat2_cyl_filt=filter(mydat2, cyl>6 | cyl<8)
mydat2_disp_fcyl=select(mydat2_cyl_filt, disp)
View(mydat2_disp_fcyl)

mydat2_piped=mydat2 %>% filter(disp > 200 & hp==110) %>% select(qsec, wt)
View(mydat2_piped)


#Add new column & Mutate & Transmute

mydat2$newcol = mydat2$wt*3 #newcol is not a defined function. It's a filter, new column's name. I gave the name. A new column was added. But we ruined the database. 
mydat2=mtcars #We can reach our original mydat2 data by doing this. But the original original data is mtcars. So we can make a copied data and work on this like this example. 

mydat2_mut = mutate(mydat2, newcol=wt*4) #newcol is new columns's name, which I named. This is a better option to add a new column since we have a new data and didn't change the original.

mydat2_mut2=mutate(mydat2,
                   hp_categ = ifelse(
                     hp <= 100,
                     "low",
                     ifelse(hp<=150,
                            "medium",
                            "high")
                   ))
View(mydat2_mut2)


transmute(veri2, newcol=disp*5, mpg, gear) 


#Arrange 

arrange(mydat2, desc(mpg)) #like a sort in Excel, applying the change to all data.
