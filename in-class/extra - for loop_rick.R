yy <- c(10, 345)

library(glue)

paste('She said: "hi how are you?" nicely.')
paste("She said: \"hi how are you?\" nicely.")
paste("hello {B0} how's it going?")
paste("hello ", B0, " how's ", "it going?")
glue("hello {B0} how's it going?")

paste0("hello", B0, "how's", "it going?")
glue("The value of i is {i}")

# library(epoxy) # For larger chunks of text in e.g. HTML RMarkdown reports

for (i in yy) {
  print(glue("The value of i is {i}"))
  i *100
}

