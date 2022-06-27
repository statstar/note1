library(raster)

kor <- getData("GADM", country="KOR", level=1)
plot(kor)
alt <- getData("alt", country="KOR", mask=T)
plot(alt)
plot(kor, add=T)

kor@data %>% dplyr::select(NAME_1)

kor@data$NAME_1
confirmed <- c(149, 85, 142, 91, 99, 131,83,
               1014, 200, 211, 206, 67, 92,
               131, 26, 600, 86)
kor@data$confirmed <- confirmed
View(kor@data)
kor@data$cut1 <-cut(kor@data$confirmed,
                    c(0,50,100,200,500,1000,2000),
                    rev(heat.colors(6)))
plot(kor, col=paste(kor@data$cut1))
lonlat <- coordinates(kor)
text(lonlat[,1], lonlat[,2], confirmed, cex=0.6)
