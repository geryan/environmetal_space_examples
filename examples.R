# examples of environmental data over space and time


library(terra)
library(geodata)


# download a single tile of 12 months of average minimum temperature in area
# of 30x30 degrees around Nigeria (0-30 degrees lon and lat)

tmin <- cmip6_tile(
  lon = 3.3,
  lat = 6.5,
  model = "CNRM-CM6-1",
  ssp = "370",
  time = "2021-2040",
  var="tmin",
  res = 10,
  path = tempdir() # you might want to set this so you don't need to repeatedly download
)

plot(tmin)

# same fore precipitation (rainfall)
prec <- cmip6_tile(
  lon = 3.3,
  lat = 6.5,
  model = "CNRM-CM6-1",
  ssp = "370",
  time = "2021-2040",
  var="prec",
  res = 10,
  path = tempdir() # you might want to set this so you don't need to repeatedly download
)

plot(prec)


# standardise the data so mean = 0 and sd = 1
tmin_scaled <- scale(tmin)
prec_scaled <- scale(prec)


# take some sample locations

n_samples <- 100
set.seed(20260505)

samples <- spatSample(
  x = tmin_scaled[[1]],
  size = n_samples,
  as.points = TRUE
)

# plot samples
plot(tmin[[1]])
points(samples)
