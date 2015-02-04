" Matt's variant of the Amy colorscheme from Sublime Text
" Based on base16-default, but heavily hacked up

" GUI color definitions
let s:amy = {}
let s:amy.background         = "200020"
let s:amy.boolean            = "8080a0"
let s:amy.builtinConstant    = "707090"
let s:amy.caret              = "7070ff"
let s:amy.character          = "666666"
let s:amy.className          = "70e080"
let s:amy.classType          = "70e0a0"
let s:amy.comment            = "ae61c8"
let s:amy.compilerDirective  = "c080c0"
let s:amy.controlKeyword     = "80a0ff"
let s:amy.foreground         = "d0d0ff"
let s:amy.functionArgument   = "80b0b0"
let s:amy.functionName       = "50a0a0"
let s:amy.invalidDeprecated  = "200020" | let s:amy.invalidDeprecated_bg = "cc66ff"
let s:amy.invalidIllegal     = "400080" | let s:amy.invalidIllegal_bg    = "ffff00"
let s:amy.invisibles         = "bfbfbf"
let s:amy.keyword            = "a080ff"
let s:amy.keywordDecorator   = "a16946"
let s:amy.keywordOperator    = "a0a0ff"
let s:amy.libraryConstant    = "200020"
let s:amy.libraryFunction    = "200020"
let s:amy.lineHighlight      = "000020" " with alpha premultiplied
let s:amy.moduleName         = "b000b0"
let s:amy.numeric            = "7090b0"
let s:amy.polymorphicVariant = "60b0ff"
let s:amy.punctuation        = "805080"
let s:amy.selection          = "000040" " with alpha premultiplied
let s:amy.storage            = "b0fff0"
let s:amy.string             = "999999"
let s:amy.supportModule      = "a00050"
let s:amy.tagName            = "009090"
let s:amy.variable           = "008080"
let s:amy.variant            = "60b0ff"

let s:cterm = {}
let s:cterm.000020 = "16"
let s:cterm.000040 = "17"
let s:cterm.008080 = "18"
let s:cterm.009090 = "19"
let s:cterm.200020 = "20"
let s:cterm.400080 = "21"
let s:cterm.50a0a0 = "22"
let s:cterm.60b0ff = "23"
let s:cterm.666666 = "24"
let s:cterm.707090 = "25"
let s:cterm.7070ff = "26"
let s:cterm.7090b0 = "27"
let s:cterm.70e080 = "28"
let s:cterm.70e0a0 = "29"
let s:cterm.805080 = "30"
let s:cterm.8080a0 = "31"
let s:cterm.999999 = "32"
let s:cterm.a00050 = "33"
let s:cterm.a080ff = "34"
let s:cterm.a0a0ff = "35"
let s:cterm.a16946 = "36"
let s:cterm.ae61c8 = "37"
let s:cterm.b000b0 = "38"
let s:cterm.b0fff0 = "39"
let s:cterm.bfbfbf = "40"
let s:cterm.c080c0 = "41"
let s:cterm.d0d0ff = "42"

fun s:setCTerm()
    for pair in items(s:cterm)
        let hex = pair[0]
        let index = pair[1]
        let components = matchlist(hex, '\(..\)\(..\)\(..\)')
        let rgb = components[1] . '/' . components[2] . '/' . components[3]

        execute "! printf \"\\033]4;" . index . ";rgb:" . rgb . "\\033\\\\\"" 
    endfor
endfun

call s:setCTerm()

" Theme setup
hi clear
syntax reset
let g:colors_name = "mmhce-amy"

" Highlighting function
fun <sid>hi(group, guifg, guibg)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=#" . a:guifg
    exec "hi " . a:group . " ctermfg=" . s:cterm[a:guifg]
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
    exec "hi " . a:group . " ctermbg=" . s:cterm[a:guibg]
  endif
endfun

" Vim editor colors
" call <sid>hi("Bold",          "", "", "", "", "bold")
call <sid>hi("Debug",         s:amy.invalidIllegal, "")
call <sid>hi("Directory",     s:amy.builtinConstant, "")
call <sid>hi("ErrorMsg",      s:amy.invalidIllegal, "")
call <sid>hi("Exception",     s:amy.invalidIllegal, "")
call <sid>hi("FoldColumn",    s:amy.foreground, s:amy.lineHighlight)
call <sid>hi("Folded",        s:amy.foreground, s:amy.lineHighlight)
call <sid>hi("IncSearch",     s:amy.selection, "")
" call <sid>hi("Italic",        , "")
call <sid>hi("Macro",         s:amy.compilerDirective, "")
call <sid>hi("MatchParen",    s:amy.selection, "")
call <sid>hi("ModeMsg",       s:amy.supportModule, "")
call <sid>hi("MoreMsg",       s:amy.supportModule, "")
call <sid>hi("Question",      s:amy.builtinConstant, "")
call <sid>hi("Search",        s:amy.builtinConstant, "")
call <sid>hi("SpecialKey",    s:amy.punctuation, "")
call <sid>hi("TooLong",       s:amy.invalidIllegal, "")
" call <sid>hi("Underlined",    
call <sid>hi("Visual",        "", s:amy.selection)
call <sid>hi("VisualNOS",     s:amy.selection, "")
call <sid>hi("WarningMsg",    s:amy.invalidDeprecated, "")
call <sid>hi("WildMenu",      s:amy.foreground, "")
call <sid>hi("Title",         s:amy.foreground, "")
call <sid>hi("Conceal",       s:amy.punctuation, "")
call <sid>hi("Cursor",        s:amy.caret, "")
call <sid>hi("NonText",       s:amy.foreground, "")
call <sid>hi("Normal",        s:amy.foreground, "")
call <sid>hi("LineNr",        s:amy.compilerDirective, "")
call <sid>hi("SignColumn",    s:amy.foreground, "")
call <sid>hi("SpecialKey",    s:amy.punctuation, "")
call <sid>hi("StatusLine",    s:amy.lineHighlight, "")
call <sid>hi("StatusLineNC",  s:amy.lineHighlight, "")
call <sid>hi("VertSplit",     s:amy.foreground, s:amy.lineHighlight)
call <sid>hi("ColorColumn",   s:amy.punctuation, "")
call <sid>hi("CursorColumn",  s:amy.punctuation, "")
call <sid>hi("CursorLine",    s:amy.compilerDirective, "")
call <sid>hi("CursorLineNr",  s:amy.compilerDirective, "")
call <sid>hi("PMenu",         s:amy.foreground, "")
call <sid>hi("PMenuSel",      s:amy.selection, "")
call <sid>hi("TabLine",       s:amy.foreground, "")
call <sid>hi("TabLineFill",   s:amy.foreground, "")
call <sid>hi("TabLineSel",    s:amy.foreground, "")

" Standard syntax highlighting
call <sid>hi("Boolean",      s:amy.builtinConstant)
call <sid>hi("Character",    s:amy.character)
call <sid>hi("Comment",      s:amy.comment)
call <sid>hi("Conditional",  s:amy.keyword)
call <sid>hi("Constant",     s:amy.libraryConstant)
call <sid>hi("Define",       s:amy.compilerDirective)
call <sid>hi("Delimiter",    s:amy.punctuation)
call <sid>hi("Float",        s:amy.numeric)
call <sid>hi("Function",     s:amy.functionName)
call <sid>hi("Identifier",   s:amy.character)
call <sid>hi("Include",      s:amy.functionName)
call <sid>hi("Keyword",      s:amy.keyword)
call <sid>hi("Label",        s:amy.classType)
call <sid>hi("Number",       s:amy.numeric)
call <sid>hi("Operator",     s:amy.foreground)
call <sid>hi("PreProc",      s:amy.classType)
call <sid>hi("Repeat",       s:amy.classType)
call <sid>hi("Special",      s:amy.keywordOperator)
call <sid>hi("SpecialChar",  s:amy.punctuation)
call <sid>hi("Statement",    s:amy.character)
call <sid>hi("StorageClass", s:amy.classType)
call <sid>hi("String",       s:amy.string)
call <sid>hi("Structure",    s:amy.keyword)
call <sid>hi("Tag",          s:amy.classType)
call <sid>hi("Todo",         s:amy.invalidDeprecated)
call <sid>hi("Type",         s:amy.classType)
call <sid>hi("Typedef",      s:amy.classType)

" C highlighting
" call <sid>hi("cOperator",   s:gui0C, "", s:cterm0C, "", "")
" call <sid>hi("cPreCondit",  s:gui0E, "", s:cterm0E, "", "")

" CSS highlighting
" call <sid>hi("cssBraces",      s:gui05, "", s:cterm05, "", "")
" call <sid>hi("cssClassName",   s:gui0E, "", s:cterm0E, "", "")
" call <sid>hi("cssColor",       s:gui0C, "", s:cterm0C, "", "")

" Diff highlighting
" call <sid>hi("DiffAdd",      s:gui0B, s:gui01,  s:cterm0B, s:cterm01, "")
" call <sid>hi("DiffChange",   s:gui03, s:gui01,  s:cterm03, s:cterm01, "")
" call <sid>hi("DiffDelete",   s:gui08, s:gui01,  s:cterm08, s:cterm01, "")
" call <sid>hi("DiffText",     s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "")
" call <sid>hi("DiffAdded",    s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "")
" call <sid>hi("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "")
" call <sid>hi("DiffNewFile",  s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "")
" call <sid>hi("DiffLine",     s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "")
" call <sid>hi("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "")

" Git highlighting
" call <sid>hi("gitCommitOverflow",  s:gui08, "", s:cterm08, "", "")
" call <sid>hi("gitCommitSummary",   s:gui0B, "", s:cterm0B, "", "")
  
" GitGutter highlighting
" call <sid>hi("GitGutterAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "")
" call <sid>hi("GitGutterChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "")
" call <sid>hi("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "")
" call <sid>hi("GitGutterChangeDelete",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "")

" HTML highlighting
" call <sid>hi("htmlBold",    s:gui0A, "", s:cterm0A, "", "")
" call <sid>hi("htmlItalic",  s:gui0E, "", s:cterm0E, "", "")
" call <sid>hi("htmlEndTag",  s:gui05, "", s:cterm05, "", "")
" call <sid>hi("htmlTag",     s:gui05, "", s:cterm05, "", "")

" JavaScript highlighting
" call <sid>hi("javaScript",        s:gui05, "", s:cterm05, "", "")
" call <sid>hi("javaScriptBraces",  s:gui05, "", s:cterm05, "", "")
" call <sid>hi("javaScriptNumber",  s:gui09, "", s:cterm09, "", "")

" Markdown highlighting
" call <sid>hi("markdownCode",              s:gui0B, "", s:cterm0B, "", "")
" call <sid>hi("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "")
" call <sid>hi("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "")
" call <sid>hi("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "")

" NERDTree highlighting
" call <sid>hi("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "")
" call <sid>hi("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "")

" PHP highlighting
" call <sid>hi("phpMemberSelector",  s:gui05, "", s:cterm05, "", "")
" call <sid>hi("phpComparison",      s:gui05, "", s:cterm05, "", "")
" call <sid>hi("phpParent",          s:gui05, "", s:cterm05, "", "")

" Python highlighting
" call <sid>hi("pythonOperator",  s:gui0E, "", s:cterm0E, "", "")
" call <sid>hi("pythonRepeat",    s:gui0E, "", s:cterm0E, "", "")

" Ruby highlighting
" call <sid>hi("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "")
" call <sid>hi("rubyConstant",                s:gui0A, "", s:cterm0A, "", "")
" call <sid>hi("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "")
" call <sid>hi("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "")
" call <sid>hi("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "")
" call <sid>hi("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "")
" call <sid>hi("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "")

" SASS highlighting
" call <sid>hi("sassidChar",     s:gui08, "", s:cterm08, "", "")
" call <sid>hi("sassClassChar",  s:gui09, "", s:cterm09, "", "")
" call <sid>hi("sassInclude",    s:gui0E, "", s:cterm0E, "", "")
" call <sid>hi("sassMixing",     s:gui0E, "", s:cterm0E, "", "")
" call <sid>hi("sassMixinName",  s:gui0D, "", s:cterm0D, "", "")

" Signify highlighting
" call <sid>hi("SignifySignAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "")
" call <sid>hi("SignifySignChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "")
" call <sid>hi("SignifySignDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "")

" Spelling highlighting
" call <sid>hi("SpellBad",     "", s:gui00, "", s:cterm00, "undercurl")
" call <sid>hi("SpellLocal",   "", s:gui00, "", s:cterm00, "undercurl")
" call <sid>hi("SpellCap",     "", s:gui00, "", s:cterm00, "undercurl")
" call <sid>hi("SpellRare",    "", s:gui00, "", s:cterm00, "undercurl")

" Remove functions
delf <sid>hi


