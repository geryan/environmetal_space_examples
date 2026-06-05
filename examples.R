# examples of environmental data over space and time


library(terra)
library(geodata)


# download a single tile of 12 months of average minimum temperature in area
# of 30x30 degrees around Nigeria (0-30 degrees lon and lat)

# for present time
tmin_t1 <- worldclim_tile(
  lon = 3.3,
  lat = 6.5,
  var = "tmin",
  res = 10,
  path = tempdir() # you might want to set this so you don't need to repeatedly download
)

# for future time
tmin_t2 <- cmip6_tile(
  lon = 3.3,
  lat = 6.5,
  model = "CNRM-CM6-1",
  ssp = "370",
  time = "2021-2040", # for more times repeat for other possibilities, see ?cmip6_tile
  var = "tmin",
  res = 10,
  path = tempdir() # you might want to set this so you don't need to repeatedly download
)

plot(tmin_t1)
plot(tmin_t2)



# same fore precipitation (rainfall)
# for present time
prec_t1 <- worldclim_tile(
  lon = 3.3,
  lat = 6.5,
  var = "prec",
  res = 10,
  path = tempdir() # you might want to set this so you don't need to repeatedly download
)

# for future time
prec_t2 <- cmip6_tile(
  lon = 3.3,
  lat = 6.5,
  model = "CNRM-CM6-1",
  ssp = "370",
  time = "2021-2040",
  var="prec",
  res = 10,
  path = tempdir() # you might want to set this so you don't need to repeatedly download
)

plot(prec_t1)
plot(prec_t2)

# standardise the data so mean = 0 and sd = 1
tmin_t1_scaled <- scale(tmin_t1)

# take some sample locations
n_samples <- 100
set.seed(20260505)

samples <- spatSample(
  x = tmin_t1_scaled[[1]],
  size = n_samples,
  as.points = TRUE
)

# plot samples
plot(tmin_t1_scaled[[1]])
points(samples)
