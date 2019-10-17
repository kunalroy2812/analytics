#Data Structures in R

#vectors----
v1=10
v1
print(v1)
v2=1:100
v2
(v3 = c(1,6,4,10))        #create & print
v4
v4=seq(1,100, 5)
v4
v5 = c('A', 'Kunal', "IIFT")
v5
class(v5)
v4
(v6 = 1:100000)
(v7 = rnorm(100, mean=60, sd=10))
mean(v7)
sd(v7)
v7
v7[1:10]
v7[seq(1,100,5)]
v7[seq(1,100,2)]
v7[v7>50]
v7[v7 > 70 | v7 < 60]
mean(v7[v7 > 70 | v7 < 60])
plot(v7)
hist(v7)
plot(density(v7))
hist(v7, breaks=10)
quantile(v7)
summary(v7)
quantile(v7, seq(0,1, .1))
quantile(v7, seq(0,1, .01))
sort(v7)
sort(v7, decreasing = TRUE)
#matrix----
?matrix
matrix(data = 1:24, nrow = 6, ncol = 4)
matrix(data = 1:24, nrow = 4, ncol = 6)
table(mtcars$cyl)
?table
t1 = table(mtcars$cyl, mtcars$gear, dnn=c('cyl','gear'))
t1
addmargins(t1)
addmargins(t1, FUN=mean)
addmargins(t1, FUN=list(list(mean,sum), list(sd,var)))
?addmargins
?margin.table
#dataframe----
mtcars
data()
AirPassengers
class(mtcars)
head(mtcars,n=3)
tail(mtcars)
dim(mtcars)   #dimensions
nrow(mtcar)   #no of rows
nrow(mtcars)  #no of rows
names(mtcars) #names of columns
rownames(mtcars) #rownames
head(mtcars)
summary(mtcars)

#summarising / filter data from DF
mtcars[ mtcars$gear == 4, ]
mtcars[ mtcars$gear ==4 & mtcars$mpg < 25, c('mpg', 'gear', 'cyl')]
mtcars
mtcars[ order(mtcars$mpg), ]
head(mtcars)
mtcars[ row.names(mtcars)== 'Mazda RX4', ]

mtcars[c(1,3,4), c(1,5)]

# export to csv
mtcars
write.csv(mtcars, 'kunal.csv')
read.csv('dhiraj.csv')
df1 = read.csv('kunal.csv')
head(df1)
names(df1)
length(names(df1))
ncol(df1)
write.csv(mtcars, 'kunal1.csv', row.names = F)
df2 = read.csv('kunal1.csv')
head(df2)
(carnames = paste('car', 1:32, sep=':'))
df2$cars = carnames
head(df2)

#create DF
#rollno, name, gender, marks, grade
(rollno =1:30)
(name = paste('student',1:30))
rep(c('M','F'), c(12,18))
set.seed(123)
(gender = sample(c('M','F'), size=30, replace=T, prob=c(.6,.4)))
table(gender)
prop.table(table(gender))

(marks = runif(30, min=50, max=100))
x = c(-14.45, -14.67, 14.45, 14.67)
x
trunc(x)
round(x,1)
floor(x)
ceiling(x)
(grades = sample(c('A','B','C'), size=30, replace=T, prob=c(.3, .45, .25)))   #(A-30, B-45, C-25)
table(grades)
prop.table(table(grades))

rollno; name; gender; marks; grades
students = data.frame(rollno, name, gender, marks, grades)
head(students)
str(students)
summary(students)
students$name = as.character(students$name)
str(students)
summary(students)
students$grades = factor(students$grades, ordered=T)
students$grades
students$grades = factor(students$grades, ordered=T, levels=c('C','B','A'))
students$grades
table(students$grades)
barplot(table(students$grades), col=1:3)
hist(students$marks)
range(students$marks)
hist(students$marks, breaks=c(0,50,70,90,100))


#M, marks > 70
students
students[ students$gender == 'M' & students$marks > 70, ]

#
library(dplyr)
#install.packages(dplyr)

students %>% filter(gender == 'M' & marks > 70) %>% arrange(marks) %>% head(n=3) %>% select(rollno, name)
