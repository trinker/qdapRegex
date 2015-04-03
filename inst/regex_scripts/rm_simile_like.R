## REGEX TO LOCATE LIKE SIMILIES

library(regexr)

rm_simile_like  <- construct(
    
    like_space      = "(\\b[Ll]ike\\b)"          %:)%  "`like` followed by boundary", 
    article         = "(\\s+((the)|a|(an)))*"    %:)%  "article followed by boundary"

)