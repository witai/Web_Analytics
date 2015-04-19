setwd("C:/Rdata/01_ITSCourse/00_datasets/test")
#測試抓取html網頁資料，以抓取新光人壽服務中心為例
library(stringr) #處理string的套件
library(XML)#處理xml的套件
library(RCurl)

SKL_address_parse = htmlParse("SKL.html",encoding = "UTF-8")
class(SKL_address_parse)
print(SKL_address_parse)
tbls = readHTMLTable(SKL_address_parse)
str(tbls)
sapply(tbls,nrow) #查看html欄位，確定要抓哪一個html table
tbls[[13]] #但是看不到，改成從tbls的list找，發現在list的第13個元素

SKL_address_table = tbls[[13]]
tbls[[13]][[1]]
colnames(SKL_address_table) <- c("CSCname", "Address", "Number(O)", "Number(F)","MAP")
write.table(SKL_address_table,file = "SKL_address.csv",row.names=FALSE,sep=",")
