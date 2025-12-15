##data analysis in ecology
# install ggbiome
#if (!require(devtools)) install.packages("devtools")
#devtools::install_github("valentinitnelav/plotbiomes",force = TRUE)
devtools::install_github('guillembagaria/ggbiome', build_vignettes = TRUE,dependencies = FALSE,force = TRUE)
# loading the package
library(ggplot2)
library(ggbiomes)
library(plotbiomes)
library(dplyr)

# view data structure within plotbiomes package
data("Whittaker_biomes", package = "plotbiomes")
head(Whittaker_biomes)
str(Whittaker_biomes)

##plot the figure 
whittaker_base_plot()


##add my study site with coordinates
my_sites <- sites <- data.frame(site = c("A", "B"), lat = c(69.49, 41.43),long = c(27.23, 2.07))


##get the temperature and  precipitation and biomes

ggbiomass::gd_get_biome(sites, si_lat = "lat", si_long = "long")


whittaker_base_plot() +
  geom_point(data = my_sites,
             aes(x = temp_c, y = precp_cm, 
                 color = group, shape = group),
             size = 4, alpha = 0.8) + theme_bw()
  
  
