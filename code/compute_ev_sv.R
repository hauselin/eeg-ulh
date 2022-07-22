rm(list = ls())
library(data.table); library(tidyverse); library(lme4); library(lmerTest); library(modelsummary); library(hausekeep)

dt1 <- fread("../data/zzz/data.csv")

d2 <- dt1[, .(offerProbability, offerReward)] %>% 
    distinct() %>% 
    arrange(offerProbability, offerReward) %>% 
    data.table()

# convert back to original values
d2[, offerProbability2 := offerProbability + 0.5]
d2[, offerReward2 := offerReward * 10 + 5]
d2[, ev_hard := offerProbability2 * offerReward2]
d2[, ev_easy := 2 * offerProbability2]
d2[, ev_diff := ev_hard - ev_easy]
d2

# add ev_diff to data
dt2 <- left_join(dt1, d2[, .(offerProbability, offerReward, ev_hard, ev_easy, ev_diff)])

# fit logistic regression to each subject's data to get indifference point
subjs <- dt2[, unique(subject)]
dt2[, sv_diff := as.numeric(NA)]
s <- 6
p <- 0.5  # prob
for (s in subjs) {
    print(s)
    d <- dt2[subject == s]
    # model <- glm(choice ~ ev_diff, d, family = "binomial")
    model <- glm(choice ~ ev_diff + trial, d, family = "binomial")
    
    indiffpoint <- (log(p / (1 - p )) - coef(model)[1]) / coef(model)[2]
    if (indiffpoint < 10 & indiffpoint > -10) {
        print(indiffpoint)
        # shift indifference point 
        dt2[subject == s, sv_diff := abs(ev_diff - indiffpoint)]
        dt2[subject == s, indiff := indiffpoint]
    }
}
datasummary_skim(dt2)

# mean-center
dt2[, ev_diffC := ev_diff - mean(ev_diff, na.rm = T), by = .(subject)]
dt2[, sv_diffC := sv_diff - mean(sv_diff, na.rm = T), by = .(subject)]
dt2[, rtC := rt - mean(rt, na.rm = T), by = .(subject)]

# check stuff
m1 <- lmer(rt ~ ev_diffC + (1 + ev_diffC | subject), dt2)
summaryh(m1)
m2 <- lmer(rt ~ sv_diffC + (1 + sv_diffC | subject), dt2)
summaryh(m2)

# indifference
subj <- distinct(dt2[, .(indiff, subject)])[is.na(indiff), .(subject)]
dt2[subject %in% subj$subject, .(choice = mean(choice, na.rm = T)), by = subject]

dt2[, rtC := NULL]

# save
fwrite(dt2, "../data/data_sv-control-trial.csv")
# doc_refresh("../data/data.csv")



# join data
dt11 <- fread("../data/data.csv")
dt12 <- fread("../data/data_sv-control-trial.csv")
dt13 <- select(dt12, subject, trial, block, sv_diff, indiff, sv_diffC)

oldnames <- names(dt13)[4:6]
newnames <- paste0(oldnames, "_trial")
setnames(dt13, oldnames, newnames)

dt14 <- left_join(dt11, dt13)
fwrite(dt14, "../data/data_joined.csv")

# logistic per person
p1 <- ggplot(dt2, aes(trial, choice)) +
    facet_wrap(~subject) +
    geom_point(size = 0.5) +
    theme_minimal() +
    geom_smooth(method = "glm", method.args = list(family = "binomial"), se = FALSE)
# ggsave("../figures/logistic.png", p1, dpi = 300, width = 18, height = 18, bg = 'white')
