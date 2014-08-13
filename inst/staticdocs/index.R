library(staticdocs)

sd_section("Removing/Extracting/Replacing",
  "Function to clean and parse text data.",
  c(
  	"pastex", 
  	"rm_",
  	"rm_abbreviation",
  	"rm_between",
  	"rm_bracket",
  	"rm_caps",
  	"rm_city_state",
  	"rm_city_state_zip",  	
  	"rm_date",
    "rm_dollar",
    "rm_email",
  	"rm_emoticon",
    "rm_hash",
  	"rm_nchar_words",
  	"rm_number",
    "rm_percent",
    "rm_phone",
    "rm_tag",
    "rm_time", 
  	"rm_title_name", 
    "rm_url",
    "rm_zip",
  	"validate"
  )
)

sd_section("Regular Expression Dictionaries",
 "Data sets with canned regular expressions.",
  c(
    "regex_usa",
  	"regex_supplement"
  )
)