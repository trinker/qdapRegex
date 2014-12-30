context("Checking cheat")

test_that("cheat returns as expected",{

    m <- structure(list(Name = c("Lookahead", "Lookbehind", "Negative Lookahead", 
        "Negative Lookbehind", "Non-Capturing Group", "Exception", "Dot", 
        "Case Insensitive", "Digit", "Non-Digit", "Word", "Non-Word", 
        "Whitespace", "Non-Whitespace", "Word Boundary", "Non-Word Boundary", 
        "0-1 (Greedy)", "0-1 (Lazy)", ">= 0 (Greedy)", ">= 0 (Lazy)", 
        ">= 1 (Greedy)", ">= 1 (Lazy)", "Exactly N", "Min-Max", "> N"
        ), Regex = c("(?=foo)", "(?<=foo)", "(?!foo)", "(?<!foo)", "(?:foo)", 
        "[^X]", ".", "(?i:foo)", "\\d", "\\D", "\\w", "\\W", "\\s", "\\S", 
        "\\b", "\\B", "x?", "x??", "x*", "x*?", "x+", "x+?", "x{4}", 
        "x{4,8}", "x{9,}"), `What it Does` = c("What follows is `foo`", 
        "What precedes is `foo`", "What follows is not `foo`", "What precedes is not `foo`", 
        "Match this group (`foo`) but with no capture", "Match everything except `X`", 
        "Match any character", "Matches irregardless of case; `Foo` & `foO` matched", 
        "Match digits (i.e., [0-9])", "Match non-digits (i.e., [^0-9])", 
        "Match words (i.e., [_a-zA-Z0-9])", "Match non-words (i.e., [^_a-zA-Z0-9])", 
        "Match whitespace (i.e., [ \\t\\r\\n\\f])", "Match non-whitespace (i.e., [^ \\t\\r\\n\\f])", 
        "Match beginning/end of word", "Match not beginning/end of word", 
        "Match 0-1 times greedy", "Match 0-1 times lazy", "Match 0 or more times greedy", 
        "Match 0 or more times lazy", "Match 1 or more times greedy", 
        "Match 1 or more times lazy", "Match N times", "Match min-max times", 
        "Match N or more times")), .Names = c("Name", "Regex", "What it Does"
        ), row.names = c(NA, 25L), class = "data.frame")
    
    out1 <- cheat(print=FALSE)
    expect_equivalent(out1, m)
    
})

test_that("cheat prints as expected",{
    
    out2 <- c("   NAME                REGEX    WHAT IT DOES                                       ", 
    "1  Lookahead           (?=foo)  What follows is `foo`                              ", 
    "2  Lookbehind          (?<=foo) What precedes is `foo`                             ", 
    "3  Negative Lookahead  (?!foo)  What follows is not `foo`                          ", 
    "4  Negative Lookbehind (?<!foo) What precedes is not `foo`                         ", 
    "5  Non-Capturing Group (?:foo)  Match this group (`foo`) but with no capture       ", 
    "6  Exception           [^X]     Match everything except `X`                        ", 
    "7  Dot                 .        Match any character                                ", 
    "8  Case Insensitive    (?i:foo) Matches irregardless of case; `Foo` & `foO` matched", 
    "9  Digit               \\\\d      Match digits (i.e., [0-9])                         ", 
    "10 Non-Digit           \\\\D      Match non-digits (i.e., [^0-9])                    ", 
    "11 Word                \\\\w      Match words (i.e., [_a-zA-Z0-9])                   ", 
    "12 Non-Word            \\\\W      Match non-words (i.e., [^_a-zA-Z0-9])              ", 
    "13 Whitespace          \\\\s      Match whitespace (i.e., [ \\\\t\\\\r\\\\n\\\\f])           ", 
    "14 Non-Whitespace      \\\\S      Match non-whitespace (i.e., [^ \\\\t\\\\r\\\\n\\\\f])      ", 
    "15 Word Boundary       \\\\b      Match beginning/end of word                        ", 
    "16 Non-Word Boundary   \\\\B      Match not beginning/end of word                    ", 
    "17 0-1 (Greedy)        x?       Match 0-1 times greedy                             ", 
    "18 0-1 (Lazy)          x??      Match 0-1 times lazy                               ", 
    "19 >= 0 (Greedy)       x*       Match 0 or more times greedy                       ", 
    "20 >= 0 (Lazy)         x*?      Match 0 or more times lazy                         ", 
    "21 >= 1 (Greedy)       x+       Match 1 or more times greedy                       ", 
    "22 >= 1 (Lazy)         x+?      Match 1 or more times lazy                         ", 
    "23 Exactly N           x{4}     Match N times                                      ", 
    "24 Min-Max             x{4,8}   Match min-max times                                ", 
    "25 > N                 x{9,}    Match N or more times                              "
    )
                
    expect_equivalent(capture.output(cheat()), out2)
 
})







