##data analysis in ecology
# install ggbiome
if (!require(devtools)) install.packages("devtools")
devtools::install_github("valentinitnelav/plotbiomes",force = TRUE)
library(ggplot2)
library(ggbiomes)

data("Whittaker_biomes", package = "plotbiomes")
# loading the package
library(plotbiomes)
library(ggplot2)
library(dplyr)

# view data structure
head(Whittaker_biomes)
str(Whittaker_biomes)

##
whittaker_base_plot() + 

###
ggplot() +
  geom_polygon(data = Whittaker_biomes,
               aes(x = temp_c, y = precp_cm, 
                   fill = biome),
               colour = "gray98", 
               linewidth = 0.3) +
  scale_fill_manual(name   = "Whittaker biomes",
                    breaks = sort(unique(Whittaker_biomes$biome)),
                    values = c("#D73027", "#F46D43", "#FDAE61", 
                               "#FEE08B", "#FFFFBF", "#D9EF8B",
                               "#A6D96A", "#66BD63", "#1A9850", 
                               "#D9D9D9", "#A6CEE3", "#67A9CF")) +
  scale_x_continuous(name = "Temperature (°C)",
                     limits = c(-15, 30),
                     breaks = seq(-15, 30, 5)) +
  scale_y_continuous(name = "Precipitation (cm)",
                     limits = c(0, 450),
                     breaks = seq(0, 450, 50)) +
  theme_bw() +
  theme(panel.grid = element_blank(),
        legend.position = "right",
        legend.text = element_text(size = 8),
        legend.title = element_text(size = 9))




## add my study site
my_sites <- data.frame(
  site = c("Site_A", "Site_B", "Site_C", "Site_D"),
  temp_c = c(25, 10, -5, 15),
  precp_cm = c(300, 100, 20, 250),
  group = c("Forest", "Grassland", "Tundra", "Forest")
)


whittaker_base_plot() +
  geom_point(data = my_sites,
             aes(x = temp_c, y = precp_cm, 
                 color = group, shape = group),
             size = 4, alpha = 0.8) + theme_bw()
  
  
