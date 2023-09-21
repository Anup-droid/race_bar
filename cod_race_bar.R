#Cause of Death India, Global Burden of Disease, 2019
#Required Package
library(gapminder)
library(ggplot2)
library(tidyverse)
library(gganimate)
library(ggdark)

#Required data load
GBDIND <- read_excel("C:/Users/Anup Kumar/Desktop/R-Code/Data_Visualization/GBDIND.xlsx")

#Animated Race bar plot of cause of death
cod_plot <- GBDIND %>%
  ggplot() +
  geom_col(aes(Rank, Death, fill = Disease)) +
  geom_text(aes(Rank, Death, label = round(Death,0), hjust = -0.1)) +
  geom_text(aes(Rank, y = 0 , label = Disease), hjust = 1.1) +
  geom_text(
    aes(
      x = 15,
      y = max(Death) ,
      label = as.factor(Year)
    ),
    vjust = 1.0,
    alpha = 0.5,
    col = "gray",
    size = 20
  ) +
  coord_flip(clip = "off", expand = FALSE) + scale_x_reverse() +
  dark_theme_classic() + theme(
    panel.grid = element_blank(),
    legend.position = "none",
    axis.ticks.y = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    plot.margin = margin(1, 4, 1, 10, "cm")
  ) +
  labs(title = "Cause of Death, India,2019",
       subtitle = "The estimated annual number of deaths from each cause",
       caption = "Source: IHME, Global Burden of Disease (2019)")+
  ylab("Number of Death")+
  transition_states(Year, state_length = 0, transition_length = 2) +
  enter_fade() +
  exit_fade() +
  ease_aes('quadratic-in-out')

#Animation
cod_anim=animate(
  cod_plot,
  width = 700,
  height = 432,
  fps = 15,
  duration = 2,
  rewind = FALSE
)
#To save the animation
anim_save("C:/Users/Anup Kumar/Desktop/R-Code/Data_Visualization/cod.gif",cod_anim)























