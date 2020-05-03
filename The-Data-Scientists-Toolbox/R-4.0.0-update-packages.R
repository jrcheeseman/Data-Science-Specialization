# Save current packages and their versions to object called ip

ip <- installed.packages()
ip

# Save the object as an .rds file somewhere

saveRDS(ip, "CurrentPackages.rds")

# After updating base R, load the file and reinstall 

ip <- readRDS("CurrentPackages.rds")

install.pacakges(ip[, 1])