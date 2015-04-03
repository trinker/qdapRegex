## REGEX TO LOCATE PHRASES ALL IN CAPS
## OFTEN THIS CONVENTION IS USED TO MEAN YELLING OR EMPHASIS

library(regexr)

rm_caps_phrase <- construct(

    "("                                     %:)%  "GROUP 2 START",
        opt_caps = "([A-Z'-]+\\b\\s)*"         %:)% "2 or more caps/-/' & space (group optional)", 
        req_caps = "(\\b[A-Z'-]{2,}\\b)"       %:)% "2 or more caps/-/' & space (required)" ,
    ")"                                     %:)%  "GROUP 2 END",

    or  = "|", 
    "("                                     %:)%  "GROUP 1 START",
        req_caps1_sp = "([A-Z'-]+\\b\\s)"      %:)% "1 or more caps/-/' & space", 
        req_caps2 =    "([A-Z'-]+\\b)"         %:)% "1 or more caps/-/'",
    ")"                                     %:)%  "GROUP 1 END",

    or  = "|",

    "("                                     %:)%  "GROUP 3 START",
        cap_1_sp = "([A-Z]\\b\\s)"             %:)% "1 cap & space", 
        cap_2    = "(\\b[A-Z]\\b)"             %:)% "1 cap" ,
    ")"                                     %:)%  "GROUP 3 END"

)
