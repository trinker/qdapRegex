## REGEX TO LOCATE NUMBERS INCLUDING COMMA SEPARATED 
## AND NEGATIVES 


library(regexr)

rm_number <- construct(
         "(?<=^|[^0-9.,])-?[0-9]+(?=$|[^0-9-.,])",
    "|",
         "-0?\\.\\d*[0-9]",                
    "|",
         "-*[0-9]",
         "(?:\\d{0,2})",
         "(?:,\\d{3})*",
         "(?:\\.\\d*[0-9])?",
    "|",
         "0?\\.\\d*[0-9]"
)