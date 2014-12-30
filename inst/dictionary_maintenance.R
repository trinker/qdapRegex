## SOURCE THESE FOR TOOLS TO CREATE DATA FOR 
## PACKAGES AND TRANSFER + CLEAN UP
fls <- dir("inst/regex_scripts")
lapply(file.path("inst/regex_scripts", fls[tools::file_ext(fls) == "R"]), function(x) {
    source(x)[["value"]]
})
source("inst/regex_scripts/meta/pack.skel.R")
library(qdapRegex)

## summary(regex_usa[["rm_citation2"]])
## qdapRegex::explain(as.character(regex_usa[["rm_citation2"]]), open=2)
#==========================
# Regex data set
#==========================
regex_usa <- list(
    rm_abbreviation = rm_abbreviation,
    rm_between = "(%s)(.*?)(%s)",
    rm_between2 = "(?<=%s).*?(?=%s)",    
    rm_caps = "(\\b[A-Z]{2,}\\b)",
    rm_caps_phrase = rm_caps_phrase, 
    rm_citation = rm_citation2 %|% rm_citation3,
    rm_citation2 = rm_citation2,
    rm_citation3 = rm_citation3,
    rm_citation_tex = "\\\\[a-zA-Z0-9]{0,}cite[a-zA-Z0-9]{0,}(\\[([^]]+)\\]){0,2}\\**\\{([a-zA-Z0-9 ,]+)\\}",
    rm_city_state = "([A-Z][\\w-]*(\\s+[A-Z][\\w-]*)+),\\s*([A-Z]{2})\\b|(\\b[A-Za-z]+),\\s*([A-Z]{2})\\b",
    rm_city_state_zip = "([A-Z][\\w-]*(\\s+[A-Z][\\w-]*)+),\\s*([A-Z]{2})\\s*(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b|(\\b[A-Za-z]+),\\s*([A-Z]{2})\\s*(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b",
    rm_date = "\\d{0,2}/\\d{2}/(?:\\d{4}|\\d{2})?|\\d{0,2}-\\d{2}-(?:\\d{4}|\\d{2})?|\\d{0,2}\\.\\d{2}\\.(?:\\d{4}|\\d{2})?", 
    rm_date2 = "(\\b)([A-Za-z]{3,9})(\\s+)([0-9][0-9]*)(,)(\\s+)([0-9]{4})",
    rm_date3 = "[0-9]{4}-[0-9]{2}-[0-9]{2}",
    rm_date4 = "\\d{0,2}/\\d{2}/(?:\\d{4}|\\d{2})?|\\d{0,2}-\\d{2}-(?:\\d{4}|\\d{2})?|\\d{0,2}\\.\\d{2}\\.(?:\\d{4}|\\d{2})?|(\\b)([A-Za-z]{3,9})(\\s+)([0-9][0-9]*)(,)(\\s+)([0-9]{4})|[0-9]{4}-[0-9]{2}-[0-9]{2}",
    rm_dollar = "\\$\\(?[0-9.]+\\)?", 
    rm_email = "([_+a-z0-9-]+(\\.[_+a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,14}))", 
    rm_emoticon = ">?[:;=8XB]{1}[-~+o^]?[|\")(&gt;DO>{pP3/]+|</?3|XD+|D:<|x[-~+o^]?[|\")(&gt;DO>{pP3/]+",
    rm_endmark = "[\\!\\*\\.\\?\\|]+$",
    rm_endmark2 = "[\\!\\.\\?]+$",
    rm_endmark3 = "[\\!\\*\\.\\;\\?\\|\\:]+$",    
    rm_hash = "(?<!/)((#)(\\w+))", 
    rm_nchar_words = "(?<![\\w'])(?:'?\\w'?){%s}(?![\\w'])",
    rm_nchar_words2 = "(?<![\\w'])([\\w']){%s}(?![\\w'])",
    rm_non_ascii = "(<[0-9a-f]{2}>)", 
    rm_number = "-0?\\.\\d*[1-9]|-*[1-9](?:\\d{0,2})(?:,\\d{3})*(?:\\.\\d*[1-9])?|0?\\.\\d*[1-9]|0", 
    rm_percent = "\\(?[0-9.]+\\)?%", 
    rm_phone = "(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?", 
    rm_postal_code = "((A[LKZR])|(C[AOT])|(D[EC])|(FL)|(GA)|(HI)|(I[DLNA])|(K[SY])|(LA)|(M[EDAINSOT])|(N[EVHJMYCD])|(O[HKR])|(PA)|(RI)|(S[CD])|(T[NX])|(UT)|(V[TA])|(W[AVIY]))",
    rm_tag = "(?<![@\\w])(@)(([a-z0-9_]+)\\b)", 
    rm_tag2 = "(?<![@\\w])(@)(([a-z0-9_]{1,15})\\b)",  
    rm_title_name = "(((Dr|Mr|Mrs|Ms|dr|mr|mrs|ms)(\\.))|(Miss|Mizz|mizz))(\\s+)([A-Za-z]+)(\\s[A-Z][A-Za-z]*\\b)*",
    rm_time = "\\d{0,2}:\\d{2}(?:[:.]\\d+)?", 
    rm_time2 = "(\\d{0,2}:\\d{2}(?:[:.]\\d+)?)(\\s+(([AP]\\.{0,1}M\\.{0,1})|([ap]\\.{0,1}m\\.{0,1})))",     
    rm_twitter_url = "(https?://t\\.co[^ ]*)|(t\\.co[^ ]*)",	
    rm_url = "(http[^ ]*)|(ftp[^ ]*)|(www\\.[^ ]*)", 
    rm_url2 = "(((https?|ftps?)://)|(www\\.))(-\\.)?([^\\s/?\\.#-]+\\.?)+(/[^\\s]*)?",
    rm_url3 = "(https?|ftps?)://(-\\.)?([^\\s/?\\.#-]+\\.?)+(/[^\\s]*)?",
    rm_white = "^\\s+|\\s+$|\\s+(?=[.](?:\\D|$))|(\\s+)(?=[,]|[;:?!\\]\\}\\)]+)|(?<=[\\(\\[\\{])(\\s+)|(\\s+)(?=[\\s])",
    rm_white_bracket = "(\\s+)(?=[\\)\\]\\}])|(?<=[\\(\\[\\{])(\\s+)",
    rm_white_colon= "(\\s+)(?=[\\:\\;]+)",
    rm_white_comma = "(\\s+)(?=,)",
    rm_white_endmark = "\\s+(?=[.?!](?:\\D|$))",	
    rm_white_lead = "^\\s+",
    rm_white_lead_trail = "^\\s+|\\s+$",
    rm_white_multiple = "(\\s+)(?=[\\s])",	
    rm_white_punctuation = "\\s+(?=[.](?:\\D|$))|(\\s+)(?=[,]|[;:?!]+)",
    rm_white_trail = "\\s+$",	
    rm_zip = "(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b"
) 

pack.skel(regex_usa)
transfer_data()

regex_supplement <- list(
    after_a = "(?<=\\b(an|An)\\s)(\\w+)|(?<=\\b(a|A)\\s)(\\w+)",
    after_the = "(?<=\\b(the|The)\\s)(\\w+)",
    after_ = "(?<=\\b(%s|%s)\\s)(\\w+)",  
    around_ = "(?:[^[:punct:]|\\s]+\\s+){0,%s}(%s)(?:\\s+[^[:punct:]|\\s]+){0,%s}",
    around2_ = "(?:[[:alpha:]]+\\s+){0,%s}(%s)(?:\\s+[[:alpha:]]+){0,%s}",	
    before_ = "\\w+?(?= ((%s|%s)\\b))",
    hexadecimal = "#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})",
    ip_address = "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b",
	last_occurrence = "%s(?=[^%s]+$)",
    pages = "p{1,2}\\.\\s*\\d+\\-*\\d*;*\\s*\\d*",	
    pages2 = "\\d+\\-*\\d*;*\\s*\\d*",	
	split_keep_delim = "(?<=[^%s])(?=[%s])",
    thousands_separator = "(\\d)(?:(?=\\d+(?=[^\\d.]))(?=(?:[0-9]{3})+\\b)|(?=\\d+(?=\\.))(?=(?:[0-9]{3})+(?=\\.)))",
    time_12_hours = "(1[012]|[1-9]):[0-5][0-9](\\s?)(am|pm)",
    version = "(?<=\\b(v|version)\\s?)([0-9]+)\\.([0-9]+)\\.([0-9]+)(?:\\.([0-9]+))?\\b",
    version2 = "\\b(v(ersion)*\\s*)([0-9]+)\\.([0-9]+)\\.([0-9]+)(?:\\.([0-9]+))?\\b",
    white_after_comma = "(?!\\s+),(?=\\D)",		
    word_boundary = "(?i)(?<=^|[^a-z])(%s)(?=$|[^a-z])",
    word_boundary_left = "(?i)(?<=^|[^a-z])",
    word_boundary_right = "(?=$|[^a-z])",	
    youtube_id = "(?<=\\d\\/|\\.be\\/|v[=\\/])([\\w\\-]{11,})|^([\\w\\-]{11})"
)

pack.skel(regex_supplement)
transfer_data()


regex_cheat <- structure(list(
        Name = c("Lookahead", "Lookbehind", "Negative Lookahead", 
            "Negative Lookbehind", "Non-Capturing Group", "Exception", "Dot", 
            "Case Insensitive", "Digit", "Non-Digit", "Word", "Non-Word",
            "Whitespace", "Non-Whitespace", "Word Boundary", "Non-Word Boundary",
            "0-1 (Greedy)", "0-1 (Lazy)", ">= 0 (Greedy)", ">= 0 (Lazy)", 
            ">= 1 (Greedy)", ">= 1 (Lazy)", "Exactly N", "Min-Max", "> N"), 
        Regex = c("(?=foo)", "(?<=foo)", "(?!foo)", "(?<!foo)", "(?:foo)", 
            "[^X]", ".", "(?i:foo)", "\\d", "\\D", "\\w", "\\W", "\\s", "\\S",
            "\\b", "\\B", "x?", "x??", "x*", "x*?", "x+", "x+?", "x{4}", 
            "x{4,8}", "x{9,}"), 
        `What it Does` = c(
            "What follows is `foo`", 
            "What precedes is `foo`", 
            "What follows is not `foo`", 
            "What precedes is not `foo`", 
            "Match this group (`foo`) but with no capture",
            "Match everything except `X`",
            "Match any character", 
            "Matches irregardless of case; `Foo` & `foO` matched",
            "Match digits (i.e., [0-9])",
            "Match non-digits (i.e., [^0-9])",
            "Match words (i.e., [_a-zA-Z0-9])",
            "Match non-words (i.e., [^_a-zA-Z0-9])",
            "Match whitespace (i.e., [ \\t\\r\\n\\f])",
            "Match non-whitespace (i.e., [^ \\t\\r\\n\\f])",
            "Match beginning/end of word",
            "Match not beginning/end of word",
            "Match 0-1 times greedy",
            "Match 0-1 times lazy",
            "Match 0 or more times greedy",
            "Match 0 or more times lazy",
            "Match 1 or more times greedy",
            "Match 1 or more times lazy",  
            "Match N times",
            "Match min-max times",
            "Match N or more times"  
    )), 
    .Names = c("Name", "Regex", "What it Does"), 
        row.names = c(NA, 25L), class = "data.frame"
)

pack.skel(regex_cheat)
transfer_data()
