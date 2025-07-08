library(rtracklayer)
library(EnsDb.Hsapiens.v75)
library(locuszoomr)

#Rename GWAS column names for the locuszoomr package i.e.,

names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "CHR"] <- "chrom"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "BP"] <- "pos"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "EA"] <- "effect_allele"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "OA"] <- "other_allele"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "P"] <- "p"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "BETA"] <- "beta"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "variant_id"] <- "SNP"
names(UKB_HbA1c_GWAS)[names(UKB_HbA1c_GWAS) == "SE"] <- "se"

#Variant IDs don't need to be in RSID format, they can be in CHR:POS_EA_OA format

#Better to load a full GWAS rather than a subset with a specific gene region then you can set the flanking region so the plot looks nicer

#Load hg19 recombination data locally

recomb.hg19 <- import.bw("/Users/vc23656/Downloads/hapMapRelease24CombinedRecombMaphg19.bw")

#Annotate data and add recombination rate

UKB_HbA1c_GWAS_plot <- locus(data = UKB_HbA1c_GWAS_full, gene = 'GLP1R', flank = 5e5,
             ens_db = "EnsDb.Hsapiens.v75")

UKB_HbA1c_GWAS_plot <- link_recomb(UKB_HbA1c_GWAS_plot, recomb = recomb.hg19)
