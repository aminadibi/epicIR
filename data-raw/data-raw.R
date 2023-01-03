# Internal Data Documentation
# This document outlines how internal data were embedded within the package

CanSim.105.0501<-read.csv("./data-raw/CanSim.105.0501.csv", header = T); #used for validation
#CanSim.052.0005<-read.csv("./CanSim.052.0005.csv", header = T); #used for validation
UN_IR_pyramid_2022<-read.csv("./data-raw/UN_IR_pyramid_2022.csv", header = T); #used for validation


usethis::use_data(CanSim.105.0501, UN_IR_pyramid_2022, internal = TRUE, overwrite = TRUE)
