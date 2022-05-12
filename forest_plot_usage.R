
library(tidyverse)
library(ggthemes)

## Appliance Usage data frame
data_plot_usage <- data.frame(
  Appliance = c("Washer/Dryer", "Refrigerator", "Dishwasher",
                "Heat Pump", "Air Conditioning", "Lighting"),
  Effect_Size = c(-0.0001, 0.0040, -0.0007, 0.0009, 0.0, -0.0075),
  Lower = c(-0.0003, 0.0004, -0.0034, -0.0023, -0.0001, -0.0111),
  Upper = c( 0.0001, 0.0076, 0.0019, 0.0042, 0.0001, -0.0039),
  Number_of_effect_sizes = c(9, 11, 7, 7, 13, 4))

## forest plot for appliance usage
ggplot(data_plot_usage, aes(Effect_Size, Appliance)) +
  geom_vline(xintercept = 0.0, linetype = "dashed", alpha = 0.5) +
  geom_point(size = data_plot_usage$Number_of_effect_sizes) +
  geom_errorbarh(aes(xmin = Lower, xmax = Upper, height = .2)) +
  labs(x = "Effect Size") +
  theme(axis.text = element_text(size = 20)) + 
  xlab("Pooled effect sizes across all interventions (r-Values)") +
  ggtitle("                                   Plot of pooled effect sizes for the Usage of Appliances") +
  theme_economist()


