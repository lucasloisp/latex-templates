\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{baseline}[2022/03/05 Baseline article template]

\newif\if@flagslides\@flagslidesfalse
\DeclareOption{slides}{\@flagslidestrue}

\newif\if@flagslidenotes\@flagslidenotesfalse
\DeclareOption{notes}{\@flagslidenotestrue}

\newif\if@flagdark\@flagdarkfalse
\DeclareOption{dark}{\@flagdarktrue}

\DeclareOption{draft}{
  \PassOptionsToPackage{draft}{graphicx}
}

\ProcessOptions\relax

\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}

\if@flagslides

\PassOptionsToClass{14pt}{beamer}
\LoadClass{beamer}

\setbeamertemplate{footline}{}
\setbeamertemplate{navigation symbols}{}

\setbeamerfont{date}{size=\footnotesize}
\setbeamerfont{institute}{size=\footnotesize}
\setbeamerfont{frametitle}{series=\fontseries{regular},parent=structure}
\setbeamerfont{title}{series=\fontseries{medium}}

\if@flagslidenotes
\RequirePackage{pgfpages}
\setbeameroption{show notes on second screen=right}
\setbeamertemplate{note page}[plain]
\fi

\if@flagdark
\usecolortheme[RGB={79,119,163}]{structure}
\definecolor{SlideBg}{RGB}{0,0,0}
\definecolor{TextColor}{RGB}{217,217,217}
\setbeamerfont{section in toc}{series=\fontseries{regular}}
\else
\usecolortheme[RGB={5,46,102}]{structure}
\definecolor{SlideBg}{RGB}{237,237,237}
\definecolor{TextColor}{RGB}{67,67,67}
\fi
\setbeamercolor{normal text}{bg=SlideBg,fg=TextColor}

\PassOptionsToPackage{defaultfam}{montserrat}
\PassOptionsToPackage{thin}{montserrat}
\PassOptionsToPackage{semibold}{montserrat}
\PassOptionsToPackage{tabular}{montserrat}
\PassOptionsToPackage{lining}{montserrat}
\RequirePackage{montserrat}
\renewcommand*\oldstylenums[1]{{\fontfamily{Montserrat-TOsF}\selectfont #1}}

\else

\PassOptionsToClass{12pt}{article}
\PassOptionsToClass{a4paper}{article}
\LoadClass{article}

\newlength{\alphabet}
\settowidth{\alphabet}{\normalfont abcdefghijklmnopqrstuvwxyz}
\PassOptionsToPackage{textwidth=2.3\alphabet}{geometry}
\RequirePackage{geometry}

\setlength{\parindent}{0pt}
\setlength{\parskip}{4pt}

\RequirePackage{setspace}
\onehalfspacing

\PassOptionsToPackage{activate={true,nocompatibility}}{microtype}
\PassOptionsToPackage{final}{microtype}
\PassOptionsToPackage{tracking=true}{microtype}
\PassOptionsToPackage{kerning=true}{microtype}
\PassOptionsToPackage{spacing=true}{microtype}
\PassOptionsToPackage{factor=1100}{microtype}
\PassOptionsToPackage{stretch=10}{microtype}
\PassOptionsToPackage{shrink=10}{microtype}
\RequirePackage{microtype}

\RequirePackage{inconsolata}

\PassOptionsToPackage{oldstyle}{XCharter}
\PassOptionsToPackage{sups}{XCharter}
\RequirePackage{XCharter}
\frenchspacing

\PassOptionsToPackage{compact}{titlesec}
\RequirePackage{titlesec}
\newcommand{\flatcaps}[1]{\textsc{\MakeLowercase{#1}}}
\titleformat{\section}{\large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}{\large}{\thesubsection}{.6em}{\flatcaps}
\titleformat{\subsubsection}{}{\thesubsubsection}{0.6em}{\itshape}
\titlespacing*{\section}{0pt}{2\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsection}{0pt}{1\baselineskip}{0.5\baselineskip}
\titlespacing*{\subsubsection}{0pt}{8pt}{5pt}

\PassOptionsToPackage{backend=biber}{biblatex}
\PassOptionsToPackage{block=ragged}{biblatex}
\PassOptionsToPackage{style=ieee}{biblatex}
\RequirePackage{biblatex}
\let\oldcite\cite
\renewcommand\cite{\unskip~\oldcite}

\RequirePackage{subcaption}

\RequirePackage{float}

\RequirePackage{tikz}
\RequirePackage{tikz-network}

\RequirePackage{hyperref}
\RequirePackage{cleveref}

\RequirePackage{titling}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[R]{\theauthor}
\fancyhead[L]{\rightmark}

\RequirePackage{enumitem}

\fi

\RequirePackage{xcolor}

\RequirePackage{booktabs}

\RequirePackage{graphicx}
\RequirePackage{svg}

\RequirePackage{minted}
