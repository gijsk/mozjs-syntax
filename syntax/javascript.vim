" Vim syntax file
" Language:     JavaScript
" Creator:      Menno van Slooten <mennovanslooten@gmail.com>
" Contributor:  Gijs Kruitbosch <gijskruitbosch@gmail.com>



syn clear
if exists("b:current_syntax")
  finish
endif

syn match   Function    "[0-9a-zA-Z_$]\+\([\(]\)\@="
"syn match   Identifier        "[a-zA-Z_$]\+\(\.\)\@="
syn match   Identifier  "[0-9a-zA-Z_$]\+\( = function\)\@="
syn match   Identifier  "[0-9a-zA-Z_$]\+\(: function\)\@="
syn match   Delimiter   "[\[\]\{\};:\(\)]" 
syn match   Number      "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match   Operator    "[+=<>!*/&|%?.,]"

" COMPLETELY_UPPER_CASE constants
syn match   Constant    "\<[A-Z_]\{3,}\>"
" Alternatively some mozilla code uses kFoo:
syn match   Constant    "\<k[A-Z][a-zA-Z_]\{3,}\>"
" And gFoo for globals:
syn match   Special     "\<g[A-Z][a-zA-Z_]\{3,}\>"
" And CapitalizedCamelCase for other globals:
" (This was too noisy, so disabled for now)
" syn match   Special     "\<[A-Z][a-zA-Z_]\{3,}\>"
" And we have some interface weirdness:
syn match   Special     "nsI[a-zA-Z]\{3,}"
syn match   Special     "inI[a-zA-Z]\{3,}"
syn match   Special     "mozI[a-zA-Z]\{3,}"

syn keyword Constant    null NaN Infinity require import
syn keyword Constant    Cu Ci Cc Cr Components interfaces classes results
" These are common enough that I figured it made sense to add them:
syn keyword Constant    Services XPCOMUtils Task Promise console
syn keyword Boolean     false true 
syn keyword Special     this window document arguments
syn keyword Keyword     Array Boolean Date Function Number Object String RegExp Map Set

syn match   Identifier  /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/
syn region  String      start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  
syn region  String      start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  

" Mark obvious misspellings as errors:
syn keyword Error       lenght funtcion functon funciton retrun

" Add some more obvious keywords
syn keyword Keyword     break continue case default
syn keyword Exception   try catch throw finally
syn keyword Operator    new return typeof in yield

" XXXgijs: So now we have map.set/get/delete, this isn't as easy as you'd like it to be:
syn match   Operator    "\(\.\)\@<!\<delete\>"
syn match   Keyword     "\(\.\)\@<!\<[gs]et\>"

syn keyword Type        var const let
syn keyword Debug       debugger alert dump
syn keyword Conditional if else switch
syn keyword Repeat      while for do in of

" mochitest stuff
syn keyword Function     is ok isnot 

syn region  javascriptFunctionDeclaration start="function\*\? " end="\>" contains=javascriptFunctionKeyword,javascriptFunctionName
syn match   javascriptFunctionName         " \w\+" contained

syn region  javascriptArrowFunctionDeclaration start="\w\+\s*=\s*([^()]*)\s*" end="=>" contains=javascriptArrowFunctionName
syn match   javascriptArrowFunctionName        "\w\+\(\s*=\)\@=" contained



syn match   Comment     "\(\\\)\@<!\/\/.*" 
syn region  Comment     start="/\*"  end="\*/" 
"syn region  String      start="/[^ */]" excludenl skip="\\/" end="/"

" We like to put preprocessor stuff in our js files:

syn match   Comment     "^#.*" 
syn match   PreCondit   "^#\(ifndef\|ifdef\|else\|elif\|endif\).*"
syn match   Include     "^#include.*"
syn match   PreProc     "^#filter.*"

let b:current_syntax = "javascript"

hi link javascriptFunctionDeclaration  Keyword
hi link javascriptFunctionName         Identifier
hi link javascriptArrowFunctionName    Identifier

