## REGEX TO LOCATE AUTHOR(S) FOLLOWED OPEN PARENTHESIS 
## FOLLOWED BY YEAR(S) FOLLOWED BY CLOSED PARENTHESIS
## E.G. Evans & Crank (2002)

library(regexr)

rm_citation2 <- construct(
    "(",
        
        ## THE LAST NAMES

        "("                                             %:)%  "GROUP 1 START",
    
            "("                                             %:)%  "GROUP 1A START",
        
                "("                                             %:)%  "GROUP 1A.1 START",

                    "("                                             %:)%  "GROUP 1A.1a START",  
          
                        "("                                             %:)%  "GROUP 1A.1a_i START",
                            von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"  %:)%  "Find a von/van/de/du/da followed by...",
                            last_name =   "[A-Z]{1}[a-zA-Z-']+"             %:)%  "A last name (capital followed by one or mor letters (1 or more times)",
                            comma_space = ",\\s"                            %:)%  "Comma and a space",
                        ")*"                                            %:)%  "GROUP 1A.1a_i END (zero or more times)",
                
                        von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"  %:)%  "Find a von/van/de/du/da followed by space",
                        last_name =   "[A-Z]{1}[a-zA-Z-']+"             %:)%  "A last name (capital followed by one or more letters (1 or more times)",
                        comma_space = ",*\\s"                           %:)%  "Comma (0 or more) and a space",
                        and =         "(\\&|and)"                       %:)%  "And and sign",
        
                    ")"                                             %:)%  "GROUP 1A.1a END",   
                    space = "\\s",
        
                ")*"                                            %:)%  "GROUP 1A.1 END (zero or more times)",  
 
                letter_period = "([A-Z]\\.\\s)*"                %:)%  "Single capital letter followed by a period (0 or more times)",         
                von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"  %:)%  "Find a von/van/de/du/da followed by...",
                last_name =   "[A-Z]{1}[a-zA-Z-'s]+"            %:)%  "A last name (capital followed by one or more letters (1 or more times)",
                space =       "\\s",
                et_al =       "(et\\sal\\.('s??)??\\s){0,1}"         %:)%  "et al. 0 or 1 times)",
        
            ")"                                            %:)%  "END GROUP 1A",
            or = "|"                                       %:)% "OR",
        
            "("                                            %:)%  "START GROUP 1B",
                von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"  %:)%  "Find a von/van/de/du/da followed by...",
                last_name =   "[A-Z][A-Za-z'-]*"                %:)%  "A last name (capital followed by one or more letters (1 or more times)",
                space = "\\s"                                   %:)%  "Space",    
            ")+"                                           %:)%  "END GROUP 1B",

        ")"                                             %:)%  "GROUP 1 END", 
  
        ## THE PARENTHESIS WITH YEAR

        left_par = "\\("                              %:)%  "open parenthesis", 
        "("                                           %:)%  "YEAR: GROUP 2 START",
    
            "("                                             %:)%  "GROUP 2A START",
                year = "(\\d{4}[a-z]{0,1})"                     %:)%  "4 digit year optionally followed by 1 lower case letter",
                or = "|"                                        %:)%  "OR",
                no_date = "(n\\.d\\.)"                          %:)%  "No date",
                or = "|"                                        %:)%  "OR",
                in_press = "(in press)"                         %:)%  "In press",
            ")"                                             %:)%  "GROUP 2A END",

            comma_space_optiona = "(,\\s*)*"                %:)% "Comma + optional space (whole group optional",
        ")+"                                          %:)%  "YEAR: GROUP 2 END (1 or more times)",

        right_par = "\\)"                          %:)%  "closed parenthesis", 
    ")"
)



