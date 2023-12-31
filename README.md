## **The BCR model of Prostate Cancer**
### Sample 1
```R
#test data

# fat_stemness_BCR_Score model:
scores <- fat_stemness_BCR_Score(test_input_data)
scores

```

### Sample 2
```R
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

data <- fread("test.txt",header = T,sep = '\t') %>%
      column_to_rownames(var = "sampleid")

# fat_stemness_BCR_Score model:
result <- fat_stemness_BCR_Score(as.matrix(data)) %>%
	as.data.frame()

colnames(result) <- "score"
result <- rownames_to_column(result,var = "sampleid")
result
```
* Website: 
	[PCaMLmodel](http://www.dzwgylab.com/PCaMLmodel)
