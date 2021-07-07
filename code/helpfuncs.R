library(hausekeep); library(sjPlot); library(glue); library(ggplot2)

scale_minmax <- function(x, new_range = c(0, 1)) {
  scale_01 <- (x - min(x, na.rm = T)) / (max(x, na.rm = T) - min(x, na.rm = T))
  x_scaled <- scale_01 * (new_range[2] - new_range[1]) + new_range[1]
  return(x_scaled)
}

export_results <- function(model, model_name) {
    fwrite(summaryh(model), glue("../results/{model_name}.csv"))
    # https://strengejacke.github.io/sjPlot/reference/tab_model.html
    tab_model(model,
              transform = NULL,
              show.stat = TRUE,
              show.se = TRUE,
              show.fstat = TRUE,
              show.aic = TRUE,
              df.method = "satterthwaite",
              string.se = "SE",
              string.est = "Estimate",
              show.re.var = FALSE,
              show.r2 = FALSE,
              file = glue("../results/{model_name}.html"))
}

s <- 13
ggtheme <- theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = "white", colour = NA),
      axis.line.x = element_line(size = 0.5, linetype = "solid", colour = "black"),
      axis.line.y = element_line(size = 0.5, linetype = "solid", colour = "black"),
      axis.text.x = element_text(size = s, colour = 'black'),
      axis.text.y = element_text(size = s, colour = 'black'),
      plot.title = element_text(size = s, hjust = 0.5),
      text = element_text(size = s), panel.spacing.x = unit(1, "lines"),
      legend.key = element_blank(), legend.key.height = unit(2, 'line'))

