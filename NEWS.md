NEWS 
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch

 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.2.1
----------------------------------------------------------------

**BUG FIXES**

* `explain` used `message` to print to the console.  `explain` now returns an
  object of the class `explain` with its own print method which uses `cat` 
  rather than `message`. Additionally, the characters `+` and `&` were not 
  handled correctly; this has been corrected.

**NEW FEATURES**

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**

 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.1.3 - 0.2.0
----------------------------------------------------------------

**BUG FIXES**

* `pastex` would throw a warning on a vector (e.g., `pastex(letters)`).  This 
  has been fixed.

* `youtube_id` was documented under `qdap_usa` rather than `qdap_supplement` and
  contained an invalid hyperlink.  This has been fixed.

* `rm_citation` contained a bug that would not operate on citations with a comma 
  in multiple authors before the and/& sign.  See <a href="https://github.com/trinker/qdapRegex/issues/4">issue #4</a>

**NEW FEATURES**

* `is.regex` added as a logical check of a regular expression's validy (conforms 
  to R's regular expression rules).

* `rm_postal_code` added for removing/extracting/replacing U.S. postal codes.

* Case wrapper functions, `TC` (title case), `U` (upper case), and `L` (lower 
  case) added for convenient case manipulation.

* `group` function added to allow for convenient wrapping of grouping 
  parenthesis around regular expressions.

* `rm_citation_tex` added to remove/extract/replace bibkey citations from a .tex 
  (LaTeX) file.

* `regex_cheat` data set and `cheat` function added to act as a quick reference 
  for common regex task operations such a lookaheads.

* `rm_caps_phrase` added to supplement `rm_caps`, extending the search to phases.

* `explain` added to view a visual representation of a regular expression using 
  <a href="http://www.regexper.com" target="_blank">http://www.regexper.com</a> and <a href="http://rick.measham.id.au/paste/explain." target="_blank">http://rick.measham.id.au/paste/explain.</a>  Also 
  takes named regular expressions from the `regex_usa` or other supplied 
  dictionary.

**MINOR FEATURES**

* `last_occurrence` regex added to the `regex_supplement` dictionary to find the
  last occurrence of delimiter.

* `word_boundary`, `word_boundary_left`, and `word_boundary_right` added to
  `regex_supplement` dictionary to provide a true word boundary.  Regexes 
  adapted from: <a href="http://www.rexegg.com/regex-boundaries.html#real-word-boundary" target="_blank">http://www.rexegg.com/regex-boundaries.html#real-word-boundary</a>

* `rm_time2` regex added to the `regex_usa` dictionary to find time + AM/PM

**IMPROVEMENTS**

* The `regex_usa` dictionary regular expressions: `rm_hash`, `rm_tag`, `rm_tag2` 
  and `rm_between` pick up grouping that allows for replacement of individual 
  sections of the substring.  See `?rm_hash` and `?rm_tag` for examples.

* `pastex` picks up a `sep` argument to allow the user to choose what string
  is used to separate the collapsed expressions.

* `rm_citation`, `rm_citation2`, and `rm_citation3` now attempt to include last 
  names that contain the  lower case particles: von, van, de, da, and du.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.1.2
----------------------------------------------------------------

CRAN fix for oldrel Windows.  Updated to R version 3.1.0 in Description file.

**NEW FEATURES**

* `bind` added as a convenience function to add a left and right boundary to 
  each element of a character vector.


 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.1.1
----------------------------------------------------------------

First CRAN Release

**NEW FEATURES**

* `rm_citation` added for removing/extracting/replacing APA 6 style in-text 
  citations.

* `rm_white` and accompanying family of `rm_white` functions added to remove 
  white space.

* `rm_non_ascii` added to remove non-ASCII characters from a string.

* `around_` added to extract word(s) around a given point.

* `pages` and `pages2` added to the `regex_supplement` data set for 
  removing/extracting/validating page numbers.

**IMPROVEMENTS**

* `rm_XXX` family of functions now use `stringi::stri_extract_all_regex` as this 
  approach is much faster than the 
  `regmatches(text.var, gregexpr(pattern, text.var, perl = TRUE))` approach.



 <a href="https://github.com/trinker/qdapRegex" target="_blank">qdapRegex</a> 0.0.1 - 0.2.0
----------------------------------------------------------------

This package is a collection of regex tools associated with the qdap
package that may be useful outside of the context of discourse analysis.  Tools
include removal/extraction/replacement of abbreviations, dates, dollar amounts, 
email addresses, hash tags, numbers, percentages, person tags, phone numbers, 
times, and zip codes.
