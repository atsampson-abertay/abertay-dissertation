% Abertay honours dissertation class for LaTeX
% Copyright 2018 Adam Sampson <a.sampson@abertay.ac.uk>

% This attempts to match "Abertay Formatting Guide 2016.pdf", or
% "Abertay Project Template v2 SDI.docx" (preferring the latter where
% they differ).

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abertayhons}[2017/08/01 Abertay dissertation]

\ProcessOptions

\LoadClass[12pt,twoside]{report}

% A4, one-inch margins.
\RequirePackage[a4paper,margin=1in]{geometry}

% Use TeX Gyre versions of Courier/Times/Helvetica.
\RequirePackage{tgcursor}
\RequirePackage{tgtermes}
\RequirePackage{tgheros}

% Sans-serif body text.
\renewcommand*\familydefault{\sfdefault}

% Ragged right. Please don't ever do this in a real LaTeX document; the
% Abertay style guide only requires it because Word does a truly awful
% job of proper justification.
\RequirePackage{ragged2e}
\RaggedRight
\hyphenpenalty=999999

% Implicit in the above, and also a bad idea in the real LaTeX world:
% gaps between paragraphs instead of paragraph indentation.
\setlength{\parindent}{0pt}
\setlength{\parskip}{10pt plus2pt minus2pt}

% "1.5" line spacing.
\RequirePackage{setspace}
\onehalfspacing

% XXX heading sizes

% Order of sections...

% - Title page
\def\year#1{\gdef\@year{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\school#1{\gdef\@school{#1}}
\renewcommand{\maketitle}{%
\thispagestyle{empty}
\vspace*{5.5cm}
\begin{center}
\parbox{11cm}{\large\centering
\@title
\vskip 0.5cm
\@author
\vskip 0.5cm
\@degree, \@year}
\end{center}
\null\vfill
\begin{flushright}
{\large \@school} \\
{\large Abertay University}
\end{flushright}
}

% - Abstract
\renewenvironment{abstract}
{\chapter*{Abstract}
\addcontentsline{toc}{section}{Abstract}}
{}
% - Table of Contents
\renewcommand{\contentsname}{Table of Contents
\thispagestyle{empty}}
% - Table of Figures
\renewcommand{\listfigurename}{Table of Figures
\addcontentsline{toc}{section}{Table of Figures}}
% - Table of Tables
\renewcommand{\listtablename}{Table of Tables
\addcontentsline{toc}{section}{Table of Tables}}
% - Acknowledgements
\newenvironment{acknowledgements}
{\chapter*{Acknowledgements}
\addcontentsline{toc}{section}{Acknowledgements}}
{}
% - Author's declaration
% - (main text)
% - Appendices
% - Definitions
% - Glossary
% - List of references
\renewcommand{\bibname}{List of References}
% - Bibliography
% - Index

% Harvard citation style.
% See the reference sheet at: https://ctan.org/pkg/natbib?lang=en
%\RequirePackage{natbib}
% XXX This is not quite "Cite Them Right" style.
%\bibliographystyle{agsm}
\RequirePackage
[backend=biber,bibstyle=authoryear,citestyle=authoryear]{biblatex}

% i, ii... for intro pages
\newcommand\tablematter{
\pagenumbering{roman}
\singlespacing
}

\newcommand\frontmatter{
\pagenumbering{roman}
\onehalfspacing
}

% 1, 2... for main pages
\newcommand\mainmatter{
\newpage
\pagenumbering{arabic}
\onehalfspacing
}

% XXX Appendix A, B, C...
