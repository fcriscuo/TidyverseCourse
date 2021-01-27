# install package
#install.packages("magick")
# load package
library(magick)
#ggplot2 hex image
img1 <- image_read("https://ggplot2.tidyverse.org/logo.png")
print(img1)
#parsnip image
img2 <- image_read("https://pbs.twimg.com/media/D5bccHZWkAQuPqS.png")
#show the image
print(img2)

#concatenate and print text
cat(image_ocr(img1))
## ggplot2
cat(image_ocr(img2))
## parsnip