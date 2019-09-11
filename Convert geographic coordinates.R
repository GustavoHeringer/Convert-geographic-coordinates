## Convert geographic coordinates from sexagesimal degree (18º43'18.7") to decimal degrees (-18.72186) using R.  ##
### Gustavo Heringer <<gustavoheringer@hotmail.com>>                                                             ##
### May 19 2019                                                                                                  ##

# Before start: 
# Data from the Northern hemisphere and from the east of the Greenwich Meridian you must remove "-1*" or replace with "1*" in the calculation below.

# Your data frame must look like: 
#  ID| degree_S| min_S| sec_S| degree_W| min_W| sec_W|
# sp1|       18|    43|  18.7|       40|    10|  48.2|
# sp2|       18|    33|  30.1|       40|    13|   4.7|
# sp3|       18|    33|  32.9|       40|    12|  57.7|

# Latitude: decimal degree calculation
df$lat_DD <- -1*(df$degree_S + df$min_S/60 + df$sec_S/3600) # using column name
df$lat_DD <- -1*(df[,2] + df[,3]/60 + df[,4]/3600) # using column order

# Longitude: decimal degree calculation
df$long_DD <- -1*(df$degree_W + df$min_W/60 + df$sec_W/3600) # using column name
df$long_DD <- -1*(df[,5] + df[,6]/60 + df[,7]/3600) # using column order

# Saving the dataframe
df.dd <- data.frame(ID=df$ID, LAT_DD=df$lat_DD, LONG_DD=df$long_DD)
write.table(df.dd, "coordenates.txt")
