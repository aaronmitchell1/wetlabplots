#Takes a df with means and SDs across control and treated samples, values for each tube are merged

library(ggplot2)

ggplot(ASA_grouped_R, aes(x = Group, y = Mean, fill = Group)) +
    geom_bar(stat = "identity", position = "dodge", width = 0.7) +
    geom_errorbar(aes(ymin = Mean - SD, ymax = Mean + SD), width = 0.2, position = position_dodge(0.7)) +
    facet_wrap(~ Time, scales = "free_y") +  # Facet by Time
    labs(x = "Group", y = "Mean ± SD") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_y_continuous(limits = c(0, 3))
