## REGEX TO LOCATE OPEN PARENTHESIS FOLLOWED BY AUTHOR(S) 
## FOLLOWED BY YEAR(S) FOLLOWED BY CLOSED PARENTHESIS
## E.G. (Evans & Crank, 2002)

library(regexr)

rm_citation3 <- construct(

    ## LAST NAME PORTION
    "("                                              %:)%  "LAST NAME GROUP START",

        "("                                             %:)%  "GROUP 1 START (MULTIPLE AUTHORS)",

            ## ENSURE BEGINS WITH OPEN PARENTHESIS OR SEIMCOLON PLUS SPACE OR 
            ## PARENTHESIS FOLLOWED BY EITHER [e.g. OR cf. OR viz.] PLUS SPACE

            ensure_start = "(?<="                              %:)% "BEGIN ENSURE",
                para_or_semi = "(\\(|(;\\s))"                  %:)% "string is lead by an open parenthesis or semicolon + space",
                or = "|"                                       %:)% "OR",

                ## GROUP WITH LEADING OPEN PARENTHESIS FOLLOWED BY EITHER e.g. OR cf. OR viz. 
                "("                                                %:)%  "GROUP ENSURE.1 START",
                    left_par = "\\("                               %:)%  "open parenthesis",  
                    "("                                            %:)%  "GROUP ENSURE.1a START",
                            eg = "(e\\.g\\.)"                          %:)%  "e.g.",                                     
                            or = "|"                                   %:)%  "OR",
                            cf = "(cf\\.)"                             %:)%  "cf.",
                            or = "|"                                   %:)%  "OR",
                            viz = "(viz\\.)"                           %:)%  "viz.",
                    ")"                                            %:)%  "GROUP ENSURE.1a END",  
                    coma_space = ",{0,1}\\s"                       %:)%  "Optional comma followed by a space",
                ")"                                            %:)%  "END GROUP ENSURE.1",

            ensure_end =")"                                    %:)%  "END ENSURE", 

            "("                                                %:)%  "GROUP 1.A START",
                "("                                                %:)%  "GROUP 1.A.1 START",
                    "("                                                %:)%  "GROUP 1.A.1.a START",

                        von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"  %:)%  "Find a von/van/de/du/da followed by space (0 or more)",
                        last_name =   "[A-Z]{1}[a-zA-Z-']+"             %:)%  "A last name (capital followed by one or more letters (1 or more times)",
                        comma_space = ",\\s"                            %:)%  "Comma and a space",

                    ")*"                                                %:)%  "GROUP 1.A.1.a END (0 or more)",
            
                    von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"      %:)%  "Find a von/van/de/du/da followed by space (0 or more)",
                    last_name =   "[A-Z]{1}[a-zA-Z-']+"                 %:)%  "A last name (capital followed by one or more letters (1 or more times)",
                    comma_space = ",*\\s"                               %:)%  "Optiona comma and a space",
                    and =         "(\\&|and)"                           %:)%  "And and sign",
                ")"                                               %:)%  "GROUP 1.A.1 END",
                space = "\\s",
            
            ")*"                                               %:)%  "GROUP 1.A END",
            
            letter_period = "([A-Z]\\.\\s)*"                   %:)%  "Single capital letter followed by a period (0 or more times)",         
            von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"     %:)%  "Find a von/van/de/du/da followed by space (0 or more)",
            last_name =   "[A-Z]{1}[a-zA-Z-']+"                %:)%  "A last name (capital followed by one or more letters (1 or more times)",
            space =       "\\s{0,1}"                           %:)%  "0 or more spaces",
            et_al =       "(et\\sal\\.){0,1}"                  %:)%  "et al. 0 or 1 times)",
            
        ")"                                             %:)%  "GROUP 1 END",

        or = "|"                                        %:)%  "OR",
        "("                                             %:)%  "GROUP 2 START",

            von_prefix =  "(\\b([Vv][oa]n|[dD][eua])\\s)*"  %:)%  "Find a von/van/de/du/da followed by space (0 or more)",
            last_name =   "[A-Z][A-Za-z'-]*"                %:)%  "A last name (capital followed by one or more letters (0 or more times)",
            space =       "\\s",

        ")+"                                            %:)%  "GROUP 2 END (1 or more times)", 

    ")"                                              %:)%  "LAST NAME GROUP END",  
    comma_space = ",\\s",

    ## YEAR PORTION
    "("                                              %:)%  "YEAR GROUP START",
    
        "("                                             %:)%  "GROUP  START",
            year = "(\\d{4}[a-z]{0,1})"                     %:)%  "4 digit year optionally followed by 1 lower case letter",
            or = "|"                                        %:)%  "OR",
            no_date = "(n\\.d\\.)"                          %:)%  "No date",
            or = "|"                                        %:)%  "OR",
            in_press = "(in press)"                         %:)%  "In press",
        ")"                                             %:)%  "GROUP  END",
    
        comma_space = "(,*\\s*)*"                       %:)%  "Optional comma and optional space (0 or more times)",
        not_pages = "(?!(\\s{0,1}p{1,2}(ara){0,1}\\.))" %:)%  "Don't pull out the pages (including para) as a year part",

    ")+"                                             %:)%  "YEAR GROUP END",

    left_para = "(?=[)]{0,1})"                       %:)%  "Optional ending closed parenthesis (0 or 1 times)"

)



