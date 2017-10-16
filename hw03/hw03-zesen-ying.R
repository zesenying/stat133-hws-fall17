# ==========================================================
# Title: hw03 ranking teams
# Description: This file is for the data preparation
# Inputs(s): data file 'nba2017-roster.csv' and 'nba2017-stats.csv'
# Output(s): data file 'nba2017-teams.csv'
# Author: Zesen Ying
# Date: 10-15-2017
# ==========================================================
library('dplyr')
library('ggplot2')
library('readr')
library('scales')

#raw data
setwd('C:/Users/Zesen Ying/stat133/stat133-hws-fall17/hw03/')
github<-"https://github.com/ucb-stat133/stat133-fall-2017/raw/master/"
csv<"data/nba2017-stats.csv"
download.file(url=paste0(github,csv),destfile = './data/nba2017-stats.csv')
data_stats<- read.csv('./data/nba2017-stats.csv',
                      stringsAsFactors = FALSE)
data_roster<-read.csv('./data/nba2017-roster.csv',
                      stringsAsFactors = FALSE)
# Adding new variables
data_stats <- mutate(data_stats, missed_fg = field_goals_atts-field_goals_made)
data_stats<- mutate(data_stats, missed_ft = points1_atts-points1_made)
data_stats<- mutate(data_stats, points = points1_made+2*points2_made+3*points3_made)
data_stats<-mutate(data_stats, rebounds = def_rebounds+off_rebounds)
data_stats<-mutate(data_stats, efficiency=(points+rebounds+assists+steals+blocks+missed_fg-missed_ft-turnovers)/games_played)
data_stats
sink(file ='./output/efficiency-summary.txt')
summary(data_stats$efficiency)

#merging tables
merge_teams<-merge(data_stats,data_roster)

#creating nba2017 teams.csv
new_team<-data_stats %>%
  group_by(team) %>%
  summarise(
                 experience= round(sum(experience),2),
                 salary=round(sum(salary)*(10**(-6)),2),
                 points3= sum(points3_made),
                 points2= sum(points2_made),
                 free_throws = sum(points1_made),
                 points= sum(points),
                 off_rebounds = sum(off_rebounds),
                 def_rebounds = sum(def_rebounds),
                 assists = sum(assists),
                 steals = sum(steals),
                 blocks = sum(blocks),
                 turnovers =sum(turnovers),
                 fouls = sum(fouls),
                 efficiency = sum(efficiency))



#column team no found??


#no idea what is going on

#some graphics
stars(new_team[,-1], labels= new_team$team)
#ranking of teams
teams_salary<-reorder(new_teams,salary)
ggplot(data=new_teams, 
       aes(x=team,y=salary)
       +geom_bar(stat="identity")
       +labs(y="Salary(inmillion)")+
        labs(x="team")+(coord_flip())+
         geom_hline(aes(yintercept=100),
                    col="red")+ggtitle
       ("NBA Teams ranked by Total Salary"))
#PCA
PCA<-prcomp(c(new_team$points3,
              new_team$points2,
              new_team$free_throws,
              new_team$off_rebounds,
              new_team$def_rebounds,
              new_team$assists,
              new_team$steals,
              new_team$blocks,
              new_team$turnovers,
              fouls,), scale=TRUE)
eigen<-data.frame(
  eigenvalue=PCA
  
  
  
)
#Index based on PC1








# REFLECTION

#first of all, I downloaded the data from github data but it happens to not have the column team
#so I got really confused by this hw


#looks more simply and the shorter length of the file feels great
#yes, it makes things easier
# lab?
# the graphs are hard
# I did it by myself
# 4 hours
# fixing code
# Not really, sorry

