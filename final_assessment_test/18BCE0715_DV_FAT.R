# 18BCE0715 - Sanjit Kumar - Lab FAT

reg_flow <- read_csv("/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/final_assessment_test/reg_flow.csv")
reg_plot <- read_csv("/Users/sanjitkumar/Documents/VIT_DOC/vit_semester_6/B2 - Data Visualisation/lab/final_assessment_test/reg_plot.csv")

reg_flow

head(reg_flow)
head(reg_plot)

links1 <- as.matrix(reg_flow)
nodes1 <- reg_plot

dim(links1)
dim(nodes1)

# COLORING VERTICES AND LABELLING THE NODES
net1 <- graph.data.frame(links1, nodes1, directed=T)
plot(net1, edge.arrow.size=.1,vertex.label=V(net1)$region, vertex.color="orange")


# REMOVE DUPLICATES
plot(net1, remove.loops = TRUE,vertex.label=V(net1)$region, vertex.color="green")
net2 <- simplify(net1, remove.multiple = F, remove.loops = T)
net2
plot(net2, remove.loops = TRUE,vertex.label=V(net1)$region, vertex.color="green")

# FINDING NUMBER OF REGIONS
no_of_regions = count(nodes1$region)
no_of_regions


#HIGHLIGHTING GIVEN PATH
E(net2)
E(net2)$color[E(net2)$region == "Western Asia"] <- 'green'
plot(net2, remove.loops = TRUE,vertex.label=V(net1)$region, vertex.color="green")

path0 <- distances(net1, v=V(net1)[region=="Western Asia"], to=V(net), weights=NA)
my_color <- colorRampPalette(c("dark red", "gold"))
col <- my_color(path0)



#SHORTEST DISTANCES
distances(net2)
dist.from.Oceania <- distances(net2, v=V(net2)["Oceania"], to=V(net2), weights=NA)

path1 <- shortest_paths(net2, 
                            from = V(net2)["Oceania"], 
                            to  = V(net2)["Western Asia"],
                            output = "both")

path2 <- shortest_paths(net2, 
                             from = V(net2)["Eastern Asia"], 
                             to  = V(net2)["Western Asia"],
                             output = "both")

path3 <- shortest_paths(net2, 
                             from = V(net2)["Oceania"], 
                             to  = V(net2)["Western Asia"],
                             output = "both")

path4 <- shortest_paths(net2, 
                             from = V(net2)["Europe"], 
                             to  = V(net2)["Northern America"],
                            )
path4
path5 <- shortest_paths(net2, 
                             from = V(net2)["Southern Asia"], 
                             to  = V(net2)["Western Asia"],
                             output = "both")


path3 <- distances(net2, v=V(net2)["North America"], to=V(net2), weights=NA)
path3
