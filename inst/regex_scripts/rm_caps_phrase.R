## REGEX TO LOCATE PHRASES ALL IN CAPS
## OFTEN THIS CONVENTION IS USED TO MEAN YELLING OR EMPHASIS

library(regexr)

rm_caps_phrase <- construct(
 
    par_1_s = "("                           %:)%  "GROUP 1 START",
         req_caps1 = "([A-Z'-]+\\b\\s)"         %:)% "1 or more caps/-/' & space", 
         req_caps2 = "([A-Z'-]+\\b)"            %:)% "1 or more caps/-/'",
    par_1_e = ")"                           %:)%  "GROUP 1 END",

    or  = "|",

    par_2_s = "("                           %:)%  "GROUP 2 START",
         opt_caps = "([A-Z'-]+\\b\\s)*"         %:)% "2 or more caps/-/' & space (optional)", 
         req_caps = "(\\b[A-Z'-]{2,}\\b)"       %:)% "2 or more caps/-/' & space (required)" ,
    par_2_e = ")"                           %:)%  "GROUP 2 END",

    or  = "|",

    par_3_s = "("                           %:)%  "GROUP 3 START",
         cap_1_sp = "([A-Z]\\b\\s)"             %:)% "1 cap & space", 
         cap_2    = "(\\b[A-Z]\\b)"             %:)% "1 cap" ,
    par_3_e = ")"                           %:)%  "GROUP 3 END"

)