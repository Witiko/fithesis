%%
%% This is file `fithesis3.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fithesis.dtx  (with options: `class')
%% 
%% 
%% Copyright 1993 1994 1995 The LaTeX3 Project and any individual
%% authors listed elsewhere in this file.
%% 
%% For further copyright information, and conditions for modification
%% and distribution, see the file legal.txt, and any other copyright
%% notices in this file.
%% 
%% This file is part of the LaTeX2e system.
%% ----------------------------------------
%%   This system is distributed in the hope that it will be useful,
%%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%% 
%% IMPORTANT COPYRIGHT NOTICE:
%% 
%% You are NOT ALLOWED to distribute this file alone.
%% 
%% If you receive only some of these files from someone, complain!
%% 
%% However, NO PERMISSION is granted to generate or to distribute a
%% modified version of this file under its original name.
%% 
%% You are NOT ALLOWED to change this file.
%% 
%% 
%% MODIFICATION ADVICE:
%% 
%% If you want to customize this file, it is best to make a copy of
%% the source file(s) from which it was produced.  Use a different
%% name for your copy(ies) and modify the copy(ies); this will ensure
%% that your modifications do not get overwritten when you install a
%% new release of the standard system.  You should also ensure that
%% your modified source file does not generate any modified file with
%% the same name as a standard file.
%% 
%% You will also need to produce your own, suitably named, .ins file to
%% control the generation of files from your source file; this file
%% should contain your own preambles for the files it generates, not
%% those in the standard .ins files.
%% 
%% The names of the source files used are shown above.
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\def\thesis@version{2015/03/21 fithesis3 version 0.3.09 MU thesis class}
\ProvidesClass{fithesis3}[\thesis@version]
\LoadClass[a4paper]{rapport3}
\RequirePackage{xstring}
\RequirePackage{keyval}
\RequirePackage{newfile}
\RequirePackage{etoolbox}
\def\thesissetup#1{%
  \setkeys{thesis}{#1}}
\def\thesis@basepath{fithesis3/}
\define@key{thesis}{basepath}{%
  \ifx\@empty#1\@empty%
    \def\thesis@basepath{}%
  \else%
    \def\thesis@basepath{#1/}%
  \fi}
\def\thesis@logopath{\thesis@basepath logo/\thesis@university/}
\define@key{thesis}{logopath}{%
  \def\thesis@logopath{\thesis@subdir{#1}}}

\def\thesis@subdir#1{%
  \ifx\@empty#1\@empty%
    \thesis@basepath%
  \else%
    \def\@slash{/}%
    \StrLeft{#1}{1}[\@fst]%
    \ifx\@fst\@slash%
      #1/%
    \else%
      \thesis@basepath#1/%
    \fi%
  \fi}
\def\thesis@stylepath{\thesis@basepath  style/}
\define@key{thesis}{stylepath}{%
  \def\thesis@stylepath{\thesis@subdir{#1}}}
\def\thesis@localepath{\thesis@basepath locale/}
\define@key{thesis}{localepath}{%
  \def\thesis@localepath{\thesis@subdir{#1}}}
\newif\ifthesis@woman\thesis@womanfalse
\define@key{thesis}{gender}{%
  \def\thesis@male{m}%
  \def\thesis@arg{#1}%
  \ifx\thesis@male\thesis@arg%
    \thesis@womanfalse%
  \else%
    \thesis@womantrue%
  \fi}
\def\thesis@author{\thesis@placeholders@author}
\define@key{thesis}{author}{%
  \def\thesis@author{#1}}
\def\thesis@bachelors{bc}
\def\thesis@masters{mgr}
\def\thesis@doctoral{d}
\def\thesis@rigorous{r}
\let\thesis@type\thesis@bachelors
\define@key{thesis}{type}{%
  \def\thesis@type{#1}}
\def\thesis@university{mu}
\define@key{thesis}{university}{%
  \def\thesis@university{#1}}
  % whose implicit value is \texttt{fi}.
\def\thesis@faculty{fi}
\define@key{thesis}{faculty}{%
  \def\thesis@faculty{#1}}
\def\thesis@department{\thesis@placeholders@department}
\define@key{thesis}{department}{%
  \def\thesis@department{#1}}
\def\thesis@programme{\thesis@placeholders@programme}
\define@key{thesis}{programme}{%
  \def\thesis@Programme{#1}}
\def\thesis@logo{\thesis@faculty}
\define@key{thesis}{logo}{%
  \def\thesis@logo{#1}}
\def\thesis@style{\thesis@university/\thesis@faculty}
\define@key{thesis}{style}{%
  \def\thesis@style{#1}}
\newif\ifthesis@style@inheritance\thesis@style@inheritancetrue
\define@key{thesis}{styleInheritance}[true]{%
  \def\@true{true}%
  \def\@arg{#1}%
  \ifx\@true\@arg%
    \thesis@style@inheritancetrue%
  \else%
    \thesis@style@inheritancefalse%
  \fi}
\def\thesis@locale{%
  % Babel detection
  \ifx\languagename\undefined%
  czech\else\languagename\fi}
\define@key{thesis}{locale}{%
  \def\thesis@locale{#1}}
\newif\ifthesis@locale@inheritance\thesis@locale@inheritancetrue
\define@key{thesis}{localeInheritance}[true]{%
  \def\@true{true}%
  \def\@arg{#1}%
  \ifx\@true\@arg%
    \thesis@locale@inheritancetrue%
  \else%
    \thesis@locale@inheritancefalse%
  \fi}
\def\thesis@year{\the\year}
\define@key{thesis}{year}{%
  \def\thesis@year{#1}}
\def\thesis@place{Brno}
\define@key{thesis}{place}{%
  \def\thesis@place{#1}}
\def\thesis@title{\thesis@placeholders@title}
\define@key{thesis}{title}{%
  \def\thesis@title{#1}}
\let\thesis@titleEn\undefined
\define@key{thesis}{titleen}{%
  \def\thesis@titleEn{#1}}
\def\thesis@keywords{\thesis@placeholders@keywords}
\define@key{thesis}{keywords}{%
  \def\thesis@keywords{#1}}
\let\thesis@keywordsEn\undefined
\define@key{thesis}{keywordsEn}{%
  \def\thesis@keywordsEn{#1}}
\def\thesis@abstract{\thesis@placeholders@abstract}
\define@key{thesis}{abstract}{%
  \def\thesis@abstract{#1}}
\let\thesis@abstractEn\undefined
\define@key{thesis}{abstractEn}{%
  \def\thesis@abstractEn{#1}}
\def\thesis@advisor{\thesis@placeholders@advisor}
\define@key{thesis}{advisor}{%
  \def\thesis@advisor{#1}}
\def\thesis@thanks{\thesis@placeholders@thanks}
\define@key{thesis}{thanks}{%
  \long\def\thesis@thanks{#1}}
\newif\ifthesis@auto\thesis@autotrue
\define@key{thesis}{autoLayout}[true]{%
  \def\@true{true}%
  \def\@arg{#1}%
  \ifx\@true\@arg%
    \thesis@autotrue%
  \else%
    \thesis@autofalse%
  \fi}
\def\thesis@documentStart{}
\def\thesis@documentEnd{}
\newif\ifthesis@loaded\thesis@loadedfalse
\AtEndPreamble{\thesis@load}
\def\thesis@load{%
  \ifthesis@loaded\else%
    \thesis@loadedtrue
    \makeatletter%
      \ifthesis@locale@inheritance
        \input{\thesis@localepath base}
      \fi
      \thesis@input{\thesis@localepath\thesis@locale}%
      \ifthesis@locale@inheritance
        \thesis@input{\thesis@localepath\thesis@university/%
          \thesis@locale}%
        \thesis@input{\thesis@localepath\thesis@university/%
          \thesis@faculty/\thesis@locale}%
      \fi
      \@ifpackageloaded{hyperref}{}{\RequirePackage{hyperref}}%
      \hypersetup{%
        pdftitle={\ifx\thesis@titleEn\undefined%
          \thesis@title%
        \else%
          \thesis@titleEn%
        \fi}, pdfauthor={\thesis@author},%
        pdfkeywords={\ifx\thesis@keywordsEn\undefined%
          \thesis@keywords%
        \else%
          \thesis@keywordsEn%
        \fi}, pdfcreator={\thesis@version},%
        pdfsubject={\ifx\thesis@abstractEn\undefined%
          \thesis@abstract%
        \else%
          \thesis@abstractEn%
        \fi}
      }%
      \ifthesis@style@inheritance
        \thesis@exists{\thesis@stylepath base.sty}{%
          \RequirePackageWithOptions{\thesis@stylepath base}}%
        \thesis@exists{\thesis@stylepath\thesis@university/%
          base.sty}{\RequirePackageWithOptions{\thesis@stylepath%
          \thesis@university/base}}%
      \fi
      \thesis@exists{\thesis@stylepath\thesis@style.sty}{%
        \RequirePackageWithOptions{\thesis@stylepath\thesis@style}}%
      \ifthesis@auto%
        \AtBeginDocument{\thesis@documentStart}%
        \AtEndDocument{\thesis@documentEnd}%
      \fi%
      \AtEndDocument{%
        % Generate the BibTeX file
        \newoutputstream{bib}%
        \openoutputfile{\jobname.bib}{bib}%
        \thesis@bibgen{bib}
        \closeoutputstream{bib}}%
    \makeatother%
  \fi}
\def\thesis@exists#1#2{%
  \IfFileExists{#1}{#2}{%
  \typeout{File #1 doesn't exist.}}}

\def\thesis@input#1{%
  \thesis@exists{#1}{\input{#1}}}
{\catcode`\<=1
\catcode`\>=2
\catcode`\{=12
\catcode`\}=12
\catcode`\_=13
\gdef\thesis@bibgen#1<<%
  % Helper macros
  \def\add<\addtostream<#1>>%
  \let\ea\expandafter%
  %% Find the last space-separated word
  \def\tail##1<\xtail##1 \relax>%
  \def\xtail##1 ##2<%
    \ifx\relax##2%
      ##1%
      \ea\@gobbletwo%
    \fi%
    \xtail##2>%
  %% Pre-cooked parts of the output
  \edef\thesis@author@toks<\thesis@author>
  \def\surname<\ea\tail\ea<\thesis@author@toks>>%
  \edef\entryType<@\ifx\thesis@type\thesis@masters%
      MastersThesis%
    \else\ifx\thesis@type\thesis@doctoral%
      PhdThesis%
    \else%
      misc%
    \fi\fi>%
  % Generate the file
  <%% Temporarily turn _s into spaces
    \catcode`\_=13 \let_=\space
    % Temporarily disable the UTF-8 encoding
    \def\UTFviii@two@octets##1##2<%
      \string##1\string##2>%
    \def\UTFviii@three@octets##1##2##3<%
      \string##1\string##2\string##3>%
    \def\UTFviii@four@octets##1##2##3##4<%
      \string##1\string##2\string##3\string##4>%
    % Fill the output stream
    \add<\entryType{\surname\thesis@year thesis,>%
    \add<__AUTHOR_____=_"\thesis@author",>%
    \add<__TITLE______=_"\thesis@title",>%
    \add<__YEAR_______=_"\thesis@year",>%
    \add<__TYPE_______=_"\thesis@typeName",>%
    \add<__SCHOOL_____=_"\thesis@universityName,
      \thesis@facultyName",>%
    \add<__SUPERVISOR_=_"\thesis@advisor",>%
    \add<__PAGES______=_"\thepage">%
    \add<}>
  >>>%
>
\def\thesis@lower#1{%
  \edef\thesis@expanded{\csname thesis@#1\endcsname}%
  \expandafter\lowercase\expandafter{\thesis@expanded}}
\def\thesis@upper#1{%
  \edef\thesis@expanded{\csname thesis@#1\endcsname}%
  \expandafter\uppercase\expandafter{\thesis@expanded}}
\endinput
%%
%% End of file `fithesis3.cls'.
