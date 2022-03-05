\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{baseline}[2022/03/05 Baseline article template]

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

\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}
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

\RequirePackage{graphicx}

\RequirePackage{minted}
