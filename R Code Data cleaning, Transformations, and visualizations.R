#@Author: Thomas Sorenson
#Description: This file utilizes the Cereal Dataset to illustrate how to clean, transform, and visualize data in R. This dataset and script can be used as an instructional aid for anyone who is new to coding in R foR for data analytics.


#First we need to read in or in other words import our dataset into R so that we can interact with it. The following scrip will read in our data.

cereal = read.csv("E:/Analysis6100/Data Sets/cereal.csv");

#Now just to verify we read the data in correctly. You can list the variables with the script below:
ls(cereal);

##Im interested in potentially removing the rating variable from my dataset, so ill start by finding the index and name of the variable.
cereal$rating;


##find the imdex of rating
colnames(cereal)
colnames(cereal[16])


##remove rating from dataset
cereal= cereal[-16]

##Now ill check if it was removed successfully
colnames(cereal)

##Now Im interested in adding a new variable that represents the calories per cup of each cereal.
cereal$cpc= cereal$calories/cereal$cups

##Now checking my new variable
cereal$cpc


##Im also not completely happy with my manufacturer variable. im going to change this variable to either be General Mills, Keloggs, or Other.
##I dont want to lose my existing variable for manufacturers just in case i need the details later, so ill subset this variable.
mfr= cereal[2]
mfr;

##create new mfr variable isolating general mills, kelloggs, or other
cereal$mfr2= ifelse(cereal$mfr=="G","gm",ifelse(cereal$mfr=="K","kelloggs","other"))


##Now ill check if mfr2 returns the correct output
cereal$mfr2;


##Now i just want to verify if variables were added to cereal dataset
colnames(cereal)


##Now ill create some visualizations for the cereal dataset.  Create a histogram of the calories of all the cereals

hist(cereal$calories,
#change the bars color to dark blue
col="dark blue",
#Change the label on the X axis
xlab="Number of Calories",
#Change the label of the Y Axis
ylab="Number of Cereals",
#add a title to the histogram
main=  "Calories in Common Cereals", 
#change the title color to dark red
col.main="Dark Red")



##Now ill Create a box plot that seperates the number of complex carbs in a serving on the Y axis and the type of cereal on the x Axis
boxplot(cereal$carbo~cereal$type)

##Now ill Create a more advanced boxplot serperating the calories per cup (y-axis)
boxplot(cereal$cpc~cereal$type,
##Then adjust the width of the boxplot to show how many hot/cold cereals there are
varwidth=TRUE,
##Label the x axis for hot and cold types
xlab="Type of Cerea (c= Cold  h= Hot)",
##label the y axis for cpc
ylab="Calories per Cup",
##limit the plot to show only the cereals with calories per cup less than or equal to 300
ylim=c(0,300))


##Now im going to point out some interesting and potential useful information from this dataset
##which cereal in this dataset has the highest calories per cup
highest_cpc= which.max(cereal$cpc)

##display name of the cereal that has the highest cpc
cereal$name[highest_cpc]

##display the cpc of the highest cpc cereal
highest_cpc;


##how many cereals in this dataset are manufactured by post
count_post=sum(cereal$mfr=="P")
##display the number of post cereals
count_post;


##what percentage of cereals in this dataset where not manufactured by generall mills or kelloggs
##sum the cereals "other" from mfr2
count_other= sum(cereal$mfr2=="other")
##find the total number of cereals in the data set
all_cereals= length(cereal$mfr2)
##calculate the percentage of other manufactured cereals from thetotal cereals
percent_other= count_other/all_cereals
##display the percentage (as decimal)
percent_other;


##how many cereals in this dataset have 0 fiber
##sum the number of cereals where fiber = 0
count_0fiber= sum(cereal$fiber==0) 
##display the number of cereals where fiber = 0
count_0fiber


##which variables in this dataset where not loaded as numeric variables
#display summary statistics for this data set
summary(cereal)


##probability of a cereal having atleast 100mg of potassium 
##sum the number of cereals with potass>= 100
count_100potass= sum(cereal$potass>=100)
##calculate the percentage of cereals with potass >=100
percent_100potass= count_100potass/all_cereals
##display percentage of cereals with >= 100 potass (as decimal)
percent_100potass

##what is the probability of a cereal containing atleast 100mg of potass given that post is the manufacturer
##sum the number of cereals with >= 100 potass & are manufactured by post
count_post100potass= sum(cereal$potass>=100 & cereal$mfr=="P")  
##Sum the number of cereals manufactured by post
count_post= sum(cereal$mfr=="P")
##calculate the percentage of cereals with >= 100 potass given post is the manufacturer
percent_post100potass= count_post100potass/count_post
##display the percentage of cereals with >=100 potass given post is the manufacturer
percent_post100potass









