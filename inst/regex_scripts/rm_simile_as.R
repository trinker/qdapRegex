## REGEX TO LOCATE AS SIMILES 

library(regexr)

rm_simile_as  <- construct(
    
    as              = "(\\b[Aa]s\\b\\s+)",
    word            = "([a-zA-Z']+)", 
    as              = "(\\s+\\b[Aa]s\\b)"

)