Config { 
    font = "xft:inconsolata:size=11:antialias=true"
    , fgColor = "#EFEFEF"
    , bgColor = "#333333"
    , position = Bottom R 60
    , lowerOnStart = True
    , commands = [ 
        Run Battery ["-t", "<left>"] 100
        , Run MultiCpu ["-t","<total0>"] 30
        , Run Date "<fc=#5994ad>%_d %#B %Y <fc=#82cbea>%H:%M</fc></fc> " "date" 600
        , Run StdinReader
    ]
    , sepChar = "%"
    , alignSep = "}{"
    , template = " %StdinReader% }{<fc=#777777> | cpu</fc> <fc=#999999>%multicpu% </fc> <fc=#777777>bat</fc> <fc=#999999>%battery%</fc> %date% "
}
