yy <- c(10, 345)

library(glue)
for (i in yy) {
  print(glue("The value of i is {i}"))
  print(i *100)
}

