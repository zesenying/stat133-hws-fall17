
#remove_missing
a<-c(1,4,7,NA,10)
remove_missing<-function(x){
  x[!is.na(x)]
}
remove_missing(a)

#get_minimum()
get_minimum<-function(x,na.rm=TRUE){
  head(sort(remove_missing(x),decreasing=FALSE,n=1L))
}
get_minimum(a)

#get_average
get_average<-function(x,na,rm=TRUE){sum=0
x<-remove_missing(x)
for(m in x)
{sum=(sum+n)}
sum/length(x)}


b<-c(18,15,16,4,17,9)
#drop lowestum 
drop_lowest<-function(x){
  min=get_minimum(x)
for(i in 1:length(x)){
  if(x[i] == min(x)){
    x[-i]
  break}
}
  x[-i]
}

drop_lowest(b)
#rescale100
rescale100<-function(x.xmin,xmax){
  x<-remove_missing(x)
  100*((x-xmin)/(xmax-xmin))
}
rescale100(b)
#list of hws
hws<-c(100,80,30,70,75,85)

#score_homework
score_homework<-function(x,drop=TRUE){
  if(drop==TRUE){get_average(drop_lowest(x))
  }
  else
  {
    get_average(x)
    
  }
}
#score_quiz()
quizzes<-c(100,80,70,0)
score_quiz<-function(x,drop=TRUE){
  if(drop==TRUE){
    get_average(drop_lowest(x))}else
    {get_average(x)}

  }


#score_lab
score_lab<-function(x){
  if(x == 11|x==12){100}
  else if(x==10){80}
  else if(x==9) {60}
  else if(x==8){40}
  else if(x==7){20}
  else if(x<=6){0}
}


  



