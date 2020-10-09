# install.packages("gdalUtils")


library(hdf5r)
library(rgdal)
library(gdalUtils)
library(raster)

gdalinfo("E:/GIS_Data/Borneo/ICESAT/177219893/ATL08_20181017063816_02850101_003_01.h5")

sds <- get_subdatasets("E:/GIS_Data/Borneo/ICESAT/177219893/ATL08_20181017063816_02850101_003_01.h5")

gdal_translate(sds, dst_dataset = "ATL08_20181017063816_02850101_003_01_01.tif")

rast <- raster("ATL08_20181017063816_02850101_003_01_01.tif")
plot(rast)


files <- dir(path ="E:/GIS_Data/Borneo/ICESAT", pattern = ".h5", recursive = T)
files

filename <- substr(files,1, 888)
filename <- paste0("ICE", filename, ".tif")
filename

i <- 1

#gives error 
for (i in 1:888){
  sds <- get_subdatasets(files[i])
  gdal_translate(sds[1], dst_dataset = filename[i])
}
