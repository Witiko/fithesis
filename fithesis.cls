%%
%% This is file `fithesis.cls',
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
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fithesis}[2015/01/09 fithesis3 version 0.3.1 MU thesis class]

\ifx\clsclass\undefined
 \def\clsclass{rapport3}
\fi
\LoadClass[a4paper]{\clsclass}

\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{onecolumn}{\@twolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{color}{\gdef\@thesiscolor{true}}

\ExecuteOptions{12pt,oneside,final}
\ProcessOptions

\RequirePackage{tgpagella}
\RequirePackage{mathpazo}
\RequirePackage{graphicx}
\RequirePackage{cmap}
\RequirePackage[T1]{fontenc}
\RequirePackage{hyperref}
\hypersetup{plainpages=false} % Multiple page numbering support
\hypersetup{pdfpagelabels}    % Generate pdf page labels
\hypersetup{pdftex}           % PDF Metadata stamping
\hypersetup{
  pdfcreator={fithesis3 v0.3.1 MU thesis class}
}

\def\Scrreprtcls{scrreprt}
\def\RapportIcls{rapport1}
\def\RapportIIIcls{rapport3}

\ifx\clsclass\RapportIcls\else
\ifx\clsclass\RapportIIIcls\else
 \newcommand*\ChapFont{\bfseries}
 \newcommand*\PageFont{\bfseries}
\fi
\fi

\setcounter{tocdepth}{4}

\input fit1\@ptsize.clo\relax

\def\ps@thesisheadings{%
\def\chaptermark##1{%
\markright{%
\ifnum\c@secnumdepth >\m@ne
\thechapter.\ %
\fi ##1}}
\let\@oddfoot\@empty
\let\@oddhead\@empty
\def\@oddhead{\vbox{\hbox to \textwidth{%
\hfil{\sc\rightmark}}\vskip 4pt\hrule}}
\if@twoside
 \def\@evenhead{\vbox{\hbox to \textwidth{%
 {\sc\rightmark}\hfil}\vskip 4pt\hrule}}
\else
 \let\@evenhead\@oddhead
\fi
\def\@oddfoot{\hfil\PageFont\thepage}
\if@twoside
 \def\@evenfoot{\PageFont\thepage\hfil}%
\else
 \let\@evenfoot\@oddfoot
\fi
\let\@mkboth\markboth
}

\renewcommand*\chapter{%
\if@twoside
 \clearpage
 \thispagestyle{empty}
 \cleardoublepage
\else
 \clearpage
\fi
\thispagestyle{plain}%
\global\@topnum\z@
\@afterindentfalse
\secdef\@chapter\@schapter}

\renewcommand*\part{%
\clearpage
\thispagestyle{empty}
\cleardoublepage
\thispagestyle{empty}%
\if@twocolumn%
 \onecolumn
 \@tempswatrue
\else
 \@tempswafalse
\fi
\hbox{}\vfil
\secdef\@part\@spart}

\def\universityname{Masarykova univerzita}
\def\facultyname{Fakulta informatiky}
\def\lowecasewrapper#1{\lowercase{#1}}
\def\Fi{fi}
\def\Sci{sci}
\def\Law{law}
\def\Eco{eco}
\def\Fss{fss}
\def\Med{med}
\def\Ped{ped}
\def\Phil{phil}
\def\Fsps{fsps}
\def\True{true}

\def\Langcs{cs}
\def\Langsk{sk}
\def\Langen{en}

\def\@thesislang{\Langcs}
\def\@thesissubtitle{Diplomov^^c3^^a1 pr^^c3^^a1ce}
\def\@thesislogopath{loga} % The loga directory by default

\def\titlefont{\fontsize\@xxvpt{30}\selectfont}
\def\thesistitle#1{\gdef\@thesistitle{#1}}
\def\thesisstudent#1{\gdef\@thesisstudent{#1}}
\def\thesisyear#1{\gdef\@thesisyear{#1}}
\def\thesisplaceyear{Brno, \@thesisyear}
\def\thesissubtitle#1{\gdef\@thesissubtitle{#1}}
\def\thesislogopath#1{\gdef\@thesislogopath{#1}}
\def\thesisuniversity#1{\gdef\@thesisuniversity{#1}}
\def\thesislogo#1{\gdef\@thesislogo{#1}}
\def\thesisadvisor#1{\gdef\@thesisadvisor{#1}}
\def\thesisfaculty#1{\gdef\@thesisfaculty{#1}
\def\@slash{/}
\def\facultylogo{\@thesislogopath\ifx\@thesiscolor\True%
  \@slash color%
\fi\@slash\@thesisfaculty-logo}
\ifx\@thesisfaculty\Fi
 \ifx\@thesislang\Langen
  \def\facultyname{Faculty of Informatics}
  \def\universityname{Masaryk University}
   \else \def\facultyname{Fakulta informatiky}
  \fi
 \else \ifx\@thesisfaculty\Sci
  \ifx\@thesislang\Langen
   \def\facultyname{Faculty of Science}
   \def\universityname{Masaryk University}
  \else \def\facultyname{P^^c5^^99^^c3^^adrodov^^c4^^9bdeck^^c3^^a1 fakulta}
  \fi
  \else \ifx\@thesisfaculty\Law
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Law}
    \def\universityname{Masaryk University}
   \else \def\facultyname{Pr^^c3^^a1vnick^^c3^^a1 fakulta}
   \fi
  \else \ifx\@thesisfaculty\Eco
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Economics and Administration}
    \def\universityname{Masaryk University}
   \else \def\facultyname{Ekonomicko-spr^^c3^^a1vn^^c3^^ad fakulta}
   \fi
  \else \ifx\@thesisfaculty\Fss
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Social Studies}
    \def\universityname{Masaryk University}
   \else \def\facultyname{Fakulta soci^^c3^^a1ln^^c3^^adch studi^^c3^^ad}
   \fi
  \else \ifx\@thesisfaculty\Med
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Medicine}
    \def\universityname{Masaryk University}
   \else \def\facultyname{L^^c3^^a9ka^^c5^^99sk^^c3^^a1 fakulta}
   \fi
  \else \ifx\@thesisfaculty\Ped
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Education}
    \def\universityname{Masaryk University}
   \else \def\facultyname{Pedagogick^^c3^^a1 fakulta}
   \fi
  \else \ifx\@thesisfaculty\Phil
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Arts}
    \def\universityname{Masaryk University}
   \else \def\facultyname{Filozofick^^c3^^a1 fakulta}
   \fi
  \else \ifx\@thesisfaculty\Fsps
   \ifx\@thesislang\Langen
    \def\facultyname{Faculty of Sports Studies}
    \def\universityname{Masaryk University}
   \else \def\facultyname{Fakulta sportovn^^c3^^adch studi^^c3^^ad}
   \fi
         \else
          \def\facultyname{\@thesisfaculty}
          \def\universityname{\@thesisuniversity}
          \def\@thesislogopath{.} % The current directory by default
          \def\facultylogo{\@thesislogopath/\@thesislogo}
          \def\thesisplaceyear{\@thesisyear}
         \fi
        \fi
       \fi
      \fi
     \fi
    \fi
   \fi
  \fi
\fi
}

\newif\if@restonecol

\def\alwayssingle{%
\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi}
\def\endalwayssingle{\if@restonecol\twocolumn\fi}


\newif\ifwoman\womanfalse
\def\@w{\ifwoman{a}\else\fi}
\def\thesiswoman#1{\gdef\@thesiswoman{#1}
\ifx\@thesiswoman\True\def\@w{a}\else\def\@w{}\fi}

\def\thesislang#1{\gdef\@thesislang{#1}}

\def\DeclarationTextcs{%
Prohla^^c5^^a1uji, ^^c5^^bee tato \expandafter\lowecasewrapper\@thesissubtitle{}
je m^^c3^^bdm p\r{u}vodn^^c3^^adm autorsk^^c3^^bdm
d^^c3^^adlem, kter^^c3^^a9 jsem vypracoval\@w\ samostatn^^c4^^9b. V^^c5^^a1echny zdroje, prameny a
literaturu, kter^^c3^^a9 jsem p^^c5^^99i vypracov^^c3^^a1n^^c3^^ad pou^^c5^^be^^c3^^adval\@w\ nebo z~nich
^^c4^^8derpal\@w, v~pr^^c3^^a1ci ^^c5^^99^^c3^^a1dn^^c4^^9b cituji s~uveden^^c3^^adm ^^c3^^bapln^^c3^^a9ho odkazu na p^^c5^^99^^c3^^adslu^^c5^^a1n^^c3^^bd
zdroj.}
\def\DeclarationTextsk{%
Prehlasujem, ^^c5^^bee t^^c3^^a1to \expandafter\lowecasewrapper\@thesissubtitle{}
je moj^^c3^^adm p\^{o}vodn^^c3^^bdm autorsk^^c3^^bdm
dielom, ktor^^c3^^a9 som vypracoval\@w\ samostatne. V^^c5^^a1etky zdroje, pramene a
literat^^c3^^baru, ktor^^c3^^a9 som pri vypracovan^^c3^^ad pou^^c5^^be^^c3^^adval\@w\ alebo z~nich
^^c4^^8derpal\@w, v~pr^^c3^^a1ci riadne citujem s~uveden^^c3^^adm ^^c3^^bapln^^c3^^a9ho odkazu na pr^^c3^^adslu^^c5^^a1n^^c3^^bd
zdroj.}
\def\DeclarationTexten{%
Hereby I declare, that this paper is my original authorial work,
which I have worked out by my own. All sources, references and literature used or excerpted
during elaboration of this work are properly cited and listed in complete reference to the due source.
}

\def\DeclarationTitlecs{%
Prohl^^c3^^a1^^c5^^a1en^^c3^^ad
}

\def\DeclarationTitlesk{%
Prehl^^c3^^a1senie
}

\def\DeclarationTitleen{%
Declaration
}

\def\ThanksTitlecs{%
Pod^^c4^^9bkov^^c3^^a1n^^c3^^ad
}

\def\ThanksTitlesk{%
Po^^c4^^8fakovanie
}

\def\ThanksTitleen{%
Acknowledgement
}

\def\AbstractTitlecs{%
Shrnut^^c3^^ad
}

\def\AbstractTitlesk{%
Zhrnutie
}

\def\AbstractTitleen{%
Abstract
}

\def\KeyWordsTitlecs{%
Kl^^c3^^ad^^c4^^8dov^^c3^^a1 slova
}

\def\KeyWordsTitlesk{%
K\v{l}^^c3^^ba^^c4^^8dov^^c3^^a9 slov^^c3^^a1
}

\def\KeyWordsTitleen{%
Keywords
}

\def\AdvisorTitlecs{%
Vedouc^^c3^^ad pr^^c3^^a1ce:
}

\def\AdvisorTitlesk{%
Ved^^c3^^baci pr^^c3^^a1ce:
}

\def\AdvisorTitleen{%
Advisor:
}

\def\DeclarationText{%
\ifx\@thesislang\Langcs
 \DeclarationTextcs
 \else \ifx\@thesislang\Langsk
  \DeclarationTextsk
  \else \ifx\@thesislang\Langen
   \DeclarationTexten
   \else \DeclarationTextcs
  \fi
 \fi
\fi
\vskip 2cm
\hfill\@thesisstudent
}

\def\AdvisorName{\par\vfill{
\ifx\@thesislang\Langcs
 \bf \AdvisorTitlecs
 \else \ifx\@thesislang\Langsk
  \bf \AdvisorTitlesk
  \else \ifx\@thesislang\Langen
   \bf \AdvisorTitleen
   \else \bf \AdvisorTitlecs
  \fi
 \fi
\fi} \@thesisadvisor}

\def\FrontMatter{%
\pagestyle{plain}
\parindent 1.5em
\setcounter{page}{1}
\pagenumbering{roman}}

\newcommand{\ThesisTitlePage}{
\begin{alwayssingle}
\thispagestyle{empty}
\begin{center}
{\sc \universityname\\ \facultyname}
\vskip 1.4em

\includegraphics[width=40mm]{\facultylogo}\\[0.4in]

\let\footnotesize\small
\let\footnoterule\relax{}
{\titlefont\bf\@thesistitle\par\vfil}\vskip 0.8in
{\sc \@thesissubtitle}\\[0.3in]
{\Large\bf\@thesisstudent}
\par\vfill
{\large \thesisplaceyear}
\end{center}
\end{alwayssingle}
\newpage}

\newenvironment{ThesisDeclaration}{%
\begin{alwayssingle}
\ifx\@thesislang\Langcs
 \chapter*{\DeclarationTitlecs}
 \else \ifx\@thesislang\Langsk
  \chapter*{\DeclarationTitlesk}
  \else \ifx\@thesislang\Langen
   \chapter*{\DeclarationTitleen}
   \else \chapter*{\DeclarationTitlecs}
  \fi
 \fi
\fi}
{\par\vfil
\end{alwayssingle}
\newpage}

\newenvironment{ThesisThanks}{%
\begin{alwayssingle}
\ifx\@thesislang\Langcs
 \chapter*{\ThanksTitlecs}
 \else \ifx\@thesislang\Langsk
  \chapter*{\ThanksTitlesk}
  \else \ifx\@thesislang\Langen
   \chapter*{\ThanksTitleen}
   \else \chapter*{\ThanksTitlecs}
  \fi
 \fi
\fi}
{\par\vfill
\end{alwayssingle}
\newpage}

\newenvironment{ThesisAbstract}{%
\begin{alwayssingle}
\ifx\@thesislang\Langcs
 \chapter*{\AbstractTitlecs}
 \else \ifx\@thesislang\Langsk
  \chapter*{\AbstractTitlesk}
  \else \ifx\@thesislang\Langen
   \chapter*{\AbstractTitleen}
   \else \chapter*{\AbstractTitlecs}
  \fi
 \fi
\fi}
{\par\vfil\null
\end{alwayssingle}
\newpage}

\newenvironment{ThesisAbstracten}{%
\begin{alwayssingle}
\chapter*{\AbstractTitleen}
}
{\par\vfil\null
\end{alwayssingle}
\newpage}

\newenvironment{ThesisKeyWords}{%
\begin{alwayssingle}
\ifx\@thesislang\Langcs
 \chapter*{\KeyWordsTitlecs}
 \else \ifx\@thesislang\Langsk
  \chapter*{\KeyWordsTitlesk}
  \else \ifx\@thesislang\Langen
   \chapter*{\KeyWordsTitleen}
   \else \chapter*{\KeyWordsTitlecs}
  \fi
 \fi
\fi}
{\par\vfill
\end{alwayssingle}
\newpage}

\def\MainMatter{%
\if@twoside
 \clearpage
 \thispagestyle{empty}
 \cleardoublepage
\else
 \clearpage
\fi
\setcounter{page}{1}
\pagenumbering{arabic}
\pagestyle{thesisheadings}
\parindent 1.5em}


\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{0.5em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \normalfont \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
    \addvspace{0.2em \@plus\p@}%
  \fi}

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\renewcommand*\l@chapter{\@dottedtocline{1}{0em}{1.5em}}
\renewcommand*\l@section{\@dottedtocline{2}{1.5em}{2.3em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{2}{7.0em}{3.8em}}

\endinput
%%
%% End of file `fithesis.cls'.
