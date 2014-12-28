## REGEX TO LOCATE ABBREVIATIONS
## 2 SINGLE LETTERS (CASE INSENSITIVE); EACH LETTER FOLOWED BY A PERIOD

library(regexr)

rm_abbreviation <- construct(
 
    let_per_1 = "([A-Za-z][\\.]\\s*){1,}"  %:)%  "Letter folowed by period and optional space (1 or more times)",
    let_per_2 = "([A-Za-z][\\.])"          %:)%  "Ending letter folowed by period" 
    
)