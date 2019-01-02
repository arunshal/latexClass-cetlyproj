%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a class for LaTeX2e that should format a report as per
% the APJ Abdul Kalam Kerala Technological University 
% thesis/ Project reoprt guidelines.  
% The page layout is set using the
% geometry package.  The double/singlespacing is setup using
% setspace.  Figure captions are set using the hang option of
% caption2.  natbib is used to do the citation using an
% author-year format. This directory/folder also include 
% apjktu.bst file that formats 
% the references as per the ktu guidelines.
%
% To use this class do the following:
%  \documentclass[options]{cetlyproj} 
%
% Options:
%
%   BTech MTech or PhD -- generates the appropriate title page
%   
%
%  
% Example:
%
% \documentclass[BTech]{cetlyproj}
% \documentclass[MTech]{cetlyproj}
% \documentclass[PhD]{cetlyproj}
%
% IMPORTANT NOTICE:
% 
%   PLEASE DO NOT MESS WITH THE MARGINS AND GENERAL FORMATTING SETUP
%   IN THIS FILE UNLESS YOU ARE ABSOLUTELY SURE THAT THE FORMAT DOES NOT
%   MATCH WITH THE THESIS GUIDELINES.  FOR EXAMPLE, DO NOT CHANGE THE 
%   MARGINS AND SPACING JUST TO MAKE YOUR THESIS LARGER!
% 
% Notes:
%
%   * I am using as much of the guidelines for the spacing
%     and margins as I can.
%   * I have modified iitmdss.cls by Prabhu Ramachandran 
%     to create this class
%   * This class will assume a4paper with 12pt fonts.
%
% arun shal <arunshal@cethalassery.ac.in>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{cetlyproj}[2019/01/02 Class for APJKTU project report]

\newif\if@PhD
\newif\if@MTech
\newif\if@BTech

\DeclareOption{PhD}{\@PhDtrue}
\DeclareOption{MTech}{\@MTechtrue}
\DeclareOption{BTech}{\@BTechtrue}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Load the correct class.
\LoadClass[12pt,a4paper]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry and page layout
\RequirePackage[a4paper,left=1.5in,right=1in,top=1in,bottom=0.667in,
                nohead]{geometry}[2002/07/08]
\parskip 8pt

\renewcommand{\@pnumwidth}{2.5em}
%\renewcommand{\@tocrmarg}{2.5em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Using setspace to do the single/double spacing.  Setspace also
%% makes all tables and figures have single spacing automatically.
\RequirePackage{setspace} 
\RequirePackage{atbeginend} % used to redefine the list environs
\setstretch{1.5}

\BeforeBegin{itemize}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{itemize}{\end{singlespace}}

\BeforeBegin{enumerate}{\vspace*{-5ex}\begin{singlespace}}
\AfterEnd{enumerate}{\end{singlespace}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% The figure captioning is done correctly via the hang option.
%%\RequirePackage[hang]{caption2}  -> TeX generates error
\RequirePackage[hang]{caption}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
% 
% natbib allows easy switching of citation style and using it along
% with the apjktu.bst makes things perfect.
\RequirePackage[authoryear,round]{natbib} 
%\RequirePackage[numbers,square]{natbib} 
\bibliographystyle{apjktu}

\newcommand{\bibstyle@apjktu}{\bibpunct{(}{)}{;}{a}{,}{,}%
     \gdef\NAT@biblabel##1{##1. }}
%
\setlength{\bibhang}{0pt}
\citestyle{apjktu}
%\citestyle{unsrt_newen}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Other useful macros.  Many of these are modifications from iitmdiss.cls

% \department{department name} -- user macro to declare name of department.
\def\department#1{\gdef\@department{#1}}
% \programme{\programme name} -- user macro to declare name of department.
\def\programme#1{\gdef\@programme{#1}}
%\RequirePackage[dvips]{graphicx}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The title page

\def\maketitle{%
  \pagenumbering{roman}
  \thispagestyle{empty}
  \newpage
  \null
  \setcounter{page}{0}
  \parskip=0pt
  \begin{center}%
  \let \footnote \thanks
  \vglue 0in % this makes top margin 2in
  \vskip -5ex%
    {\Large \bf \expandafter{\@title} \par}%
    \vskip 6ex%
    {\normalsize
      \if@PhD
         {\em A THESIS }\par
         \vskip 5ex%
         {\normalsize \em submitted by \par}
         \vskip 5ex%
         {\bf \large\uppercase{\@author}\par\par}
         \vskip 5ex%
         {\em for the award of the degree }\par
         \vskip 5ex%
         {\em of} \par
         \vskip 5ex%
         {\bf \large \MakeUppercase{Doctor of Philosophy}} \par
       \else
           { A PROJECT REPORT }\par
           \vskip 2ex%
           {\normalsize \em submitted by \par}
           \vskip 2ex%
           {\bf \large\uppercase{\@author}\par\par}
           \vskip 2ex%
           {\normalsize \em to \par}
           \vskip 1ex%
           {\normalsize \em the APJ Abdul Kalam Technological University \par in partial fulfillment of the requirements for the award of the \par of \par}
           \vskip 1ex%
           \if@MTech
             { Master of Technology \par}
           \fi
           \if@BTech
              { Bachelor of Technology \par}
           \fi
            {\normalsize in \par \@programme }
      \fi
    }
  \end{center}%

  \vspace*{0.5in}
  %\centerline{\psfig{figure=emblem.ps}}
%  \centerline{\includegraphics{cetly.eps}}
  \centerline{\includegraphics[scale=1.]{cetly.eps}}
  \vspace*{-0.15in}
  \begin{center}
    {\bf \large DEPARTMENT OF \@department\par}
    {\bf \large COLLEGE OF ENGINEERING THALASSERY\par}
    {\bf \large THALASSERY, KERALA - 670107}
    \vglue 0.50em
    {\bf \large \@date}\par
  \end{center}
  \parskip 8pt
}

\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\newpage}

   % QUOTATIONS
   %
   \def\quotations{\chapter*{\centerline{QUOTATIONS}}
   %\addcontentsline{toc}{chapter}{QUOTATIONS}
   }

   % DEDICATION
   %
   \def\dedication{\chapter*{\centerline{DEDICATION}}
   %\addcontentsline{toc}{chapter}{DEDICATION}
   }

  % DECLARATION
  %
  \def\declaration{
  
  \clearpage
  \vspace*{10pt}
  
  \centerline{\Large \bf DECLARATION}
  \thispagestyle{empty}
  \typeout{Certificate}
  \setcounter{page}{0}
  	%\addcontentsline{toc}{chapter}{DECLARATION}
  }

   % CERTIFICATE
   %
   %   - this produces a certificate page as per KTU Regulations
   %     comment the following lines out to get it working.
   %
   \def\certificate{%% A preliminary chapter
     \clearpage
     \vspace*{10pt}
     \begin{center}
     	{\bf \large DEPARTMENT OF \@department\par}
     	{\bf \large COLLEGE OF ENGINEERING THALASSERY}
     \end{center}
 	 \centerline{\includegraphics[scale=1.]{cetly.eps}}
 	  \vskip 25pt
     \centerline{\Large \bf CERTIFICATE}
    
     
     \thispagestyle{empty}
     \typeout{Certificate}
     \setcounter{page}{0}
   }

   % ACKNOWLEDGEMENTS
   %
   \def\acknowledgements{\chapter*{\centerline{ACKNOWLEDGEMENTS}}
     \addcontentsline{toc}{chapter}{ACKNOWLEDGEMENTS}
   }

   % ABSTRACT
   %   - this produces pages suitable for Abstract
   \def\abstract{\chapter*{\centerline{ABSTRACT}}
   \addcontentsline{toc}{chapter}{ABSTRACT}
   }

   % GLOSSARY
   %
   \def\glossary{\chapter*{\centerline{GLOSSARY}}
   \addcontentsline{toc}{chapter}{GLOSSARY}
   }

   % ABBREVIATIONS
   %
   \def\abbreviations{\chapter*{\centerline{ABBREVIATIONS}}
   \addcontentsline{toc}{chapter}{ABBREVIATIONS}
   }

   % Use the nomencl package for the NOTATION section.

   % Makes the chapter heading
   \def\@makechapterhead#1{%
     {\parindent \z@ \raggedright \normalfont
       \ifnum \c@secnumdepth >\m@ne
       \begin{center}
         \Large\bfseries \@chapapp\space \thechapter
       \end{center}
       \par\nobreak
       \vskip 20\p@
       \fi
       \interlinepenalty\@M
       \Large \bf
       \begin{center}
         #1\par\nobreak      
       \end{center}
       \vskip 20\p@
       \thispagestyle{empty}
     }}

   % Makes the chapter heading for \chapter* commands
   \def\@makeschapterhead#1{%
     \vspace*{25\p@}%
     {\parindent \z@ \raggedright
       \normalfont
       \interlinepenalty\@M
       \Large \bfseries #1\par\nobreak
       \vskip 20\p@
     }}


   %LIST OF PAPERS
   \def\listofpapers{
           \normalbaselines
           \chapter*{\centerline{LIST OF PAPERS BASED ON THESIS}}
           \markboth{LIST OF PAPERS BASED ON THESIS}{LIST OF PAPERS BASED ON THESIS}
           %\addcontentsline{toc}{chapter}{LIST OF PAPERS BASED ON THESIS}
   }

   
   % CV
   \def\CV{\chapter*{\centerline{CURRICULUM VITAE}}}

   % Comittee
   \if@PhD
       \def\committee{\chapter*{\centerline{DOCTORAL COMMITTEE}}}
   \fi


   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   % Renewed commands to set the titles of various pages correctly.
   \renewcommand\contentsname{\centering CONTENTS}
   \renewcommand\listfigurename{\centering LIST OF FIGURES}
   \renewcommand\listtablename{\centering LIST OF TABLES}
   \renewcommand{\chaptername}{CHAPTER}
   \renewcommand\bibname{\centering REFERENCES}
   \renewcommand\appendixname{APPENDIX}


