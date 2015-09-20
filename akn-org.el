;; Org-mode stuff.
(setq org-directory "~/Work/org/main"
      org-mobile-directory "~/Work/org/mobile"
      org-agenda-files (list "~/Work/org/main/" "~/Work/org/main/muni/")
      org-mobile-inbox-for-pull "~/Work/org/mobile/index.org"
      org-alphabetical-lists t
      org-export-htmlize-output-type 'css)

(defconst akn-export-html-style "
<style>
 <!--/*--><![CDATA[/*><!--*/
   html { margin-left: 0.5in; align: right; font-family: Nimbus Roman No9 L, Times, serif; font-size: 12pt; } 
   body { width: 75% }
   code { font-size: 0.9em; color: brown; background-color: #DDD; }

  .title  { text-align: center; }
  .todo   { border-radius: 4px; color: white; background-color: red; font-family: courier, monospace; padding: 0 4px 0 4px; }
  .done   { border-radius: 4px; color: white; background-color: green; font-family: courier, monospace; padding: 0 4px 0 4px; }
  .tag    { background-color: #add8e6; font-weight:normal }
  .target { }
  .timestamp { color: #bebebe; }
  .timestamp-kwd { color: #5f9ea0; }
  .right  {margin-left:auto; margin-right:0px;  text-align:right; padding-right: 2px; }
  .left   {margin-left:0px;  margin-right:auto; text-align:left; padding-left: 2px; }
  .center {margin-left:auto; margin-right:auto; text-align:center;}
  p.verse { margin-left: 3% }
  pre {
	border: 1pt solid #AEBDCC;
	background-color: #F3F5F7;
	padding: 5pt;
	font-family: courier, monospace;
        font-size: 90%;
        overflow:auto;
  }
  dt { font-weight: bold; }
  div.figure { padding: 0.5em; }
  div.figure p { text-align: center; }
  div.inlinetask {
    padding:10px;
    border:2px solid gray;
    margin:10px;
    background: #ffffcc;
  }
  textarea { overflow-x: auto; }
  .linenr { font-size:smaller }
  .code-highlighted {background-color:#ffff00;}
  .org-info-js_info-navigation { border-style:none; }
  #org-info-js_console-label { font-size:10px; font-weight:bold;
                               white-space:nowrap; }
  .org-info-js_search-highlight {background-color:#ffff00; color:#000000;
                                 font-weight:bold; }

  table.default { background-color: #EEE; border: 1px solid gray; border-spacing: 0; text-align: left; }

  table.default thead tr { }
  table.default thead tr th { color: #228; padding: 3px; border-left: 1px solid gray; border-bottom: 1px solid gray; }
  table.default thead tr th:first-child { border-left: 0;}

  table.default tbody tr { border-top: 1px solid #DDD; }
  table.default tbody tr td { padding: 3px; border-left: 1px solid gray; border-bottom: 1px solid #DDD; }
  table.default tbody tr td:first-child { border-left: 0;}
  /*]]>*/-->
</style>
")

;; Extra style
(defconst akn-export-html-style-extra
"<style type=\"text/css\"> 
<!--/*--><![CDATA[/*><!--*/
 span.section-number-2:after { content: \".\"; } 

 pre.src { font-family: monospace, courier; font-size: 90%; background-color: #DDD; }
 span.org-keyword { color: brown; font-weight: bold; }
 span.org-comment { color: blue; }
 span.org-comment-delimiter { color: blue; }
 span.org-preprocessor { color: blue; font-weight: bold; }
 span.org-type { color: green; font-weight: bold; }
 span.org-variable-name { color: brown; }
 span.org-string { color: brown; font-weight: bold; }

 div#postamble { border-top: #CCC 1px solid; }
 div#postamble > p { margin-top: 0.25em; margin-bottom: 0; font-style: oblique; }
 div#postamble > a { margin-top: 0.25em; margin-bottom: 0; font-style: oblique; }
 p.footnote { margin-top: 0.25em; margin-bottom:0; }
 div#text-footnotes { margin-bottom: 1em; }
 h2.footnotes { margin-bottom: 0.25em; }

 h2 { border-top: 1px solid #C80; }
/*]]>*/--> 
</style>
")

(setq org-export-html-style akn-export-html-style)
(setq org-export-html-style-extra akn-export-html-style-extra)
(setq org-export-html-style-include-default nil)
(setq org-export-html-table-tag "<table class=\"default\">")
