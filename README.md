*The BCR model based on Fatty acid metabolism and stemness genelists*
## Sample 1
```R
	scores <- fat_stemness_BCR_Score(test_input_data)
	scores
```

## Sample 2
```
#if your data was input as data.frame

library(PCaMLmodel)
library(data.table)
library(tidyverse)
library(survival)

#such as your input file was named test.txt
#the format like 
#sampleid gene1 gene2 gene3...
#TCGA-2A-A8W3-01	509.250122221517	371.812665359136	192.037124283762
#TCGA-CH-5788-01	188.721606594081	900.654359416522	344.648267600287

data <- fread("test.txt",header = input$header,sep = '\t')
data <- out_dz() %>%
      column_to_rownames(var = "sampleid")
result <- fat_stemness_BCR_Score(test_input_data) %>%
	as.data.frame()
colnames(result) <- "score"
result <- rownames_to_column(result,var = "sampleid")
result
```
* Website: *
	[PCaMLmodel website](http://dzwgylab.com/PCaMLmodel)
