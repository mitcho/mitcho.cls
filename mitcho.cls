\ProvidesClass{mitcho}[2010/04/02 mitcho's magical XeLaTeX class]

%%%%%%%%%%
% OPTIONS
%%%%%%%%%%

\RequirePackage{ifthen}

\newboolean{loadBeamer}
\setboolean{loadBeamer}{false}
\newboolean{a4paper}
\setboolean{a4paper}{false}
\newboolean{a1poster}
\setboolean{a1poster}{false}
\newboolean{enumitem-gb4e}
\setboolean{enumitem-gb4e}{false}
\newboolean{expex}
\setboolean{expex}{false}
\newboolean{report}
\setboolean{report}{false}
\newboolean{diff}
\setboolean{diff}{false}

\DeclareOption{a4paper}{
	\setboolean{a4paper}{true}
}
\DeclareOption{a1poster}{
	\setboolean{a1poster}{true}
}
\DeclareOption{enumitem-gb4e}{
	\setboolean{enumitem-gb4e}{true}
}
\DeclareOption{syntax}{
	\AtEndOfClass{\RequirePackage{qtree}}
}
\DeclareOption{phonology}{
	\AtEndOfClass{\RequirePackage[notipa]{OTtablx}}
}
\DeclareOption{latexit}{
	\AtEndOfClass{
		\RequirePackage[papersize={20in,20in}]{geometry}
	}
}
\DeclareOption{expex}{
	\setboolean{expex}{true}
}

\AtBeginDocument{
	\newcommand{\anon}[1]{{#1}}
	\newcommand{\anonhide}[1]{{#1}}
}
\DeclareOption{anonymous}{
	\AtBeginDocument{
		\renewcommand{\anon}[1]{Anonymized}
		\renewcommand{\anonhide}[1]{}
	}
}

\AtBeginDocument{
	\definecolor{diff}{rgb}{0,0,0}
	\group{\newcommand{\diff}[1]{{#1}}}
}
\DeclareOption{diff}{
	\setboolean{diff}{true}
	\AtBeginDocument{
		\definecolor{diff}{rgb}{0.6,0,0}
		\group{\newcommand{\diff}[1]{\textcolor{diff}{#1}}}
	}
}

\DeclareOption{handout}{
	\PassOptionsToClass{handout}{beamer}
	\PassOptionsToClass{12pt}{article}
	\AtEndOfClass{
		\RequirePackage{multicol}
		\ifthenelse{\boolean{a4paper}}{
			% a4 = 210 x 297mm
			% a4half ~ 8.6in x 12.16in
			\RequirePackage[
					papersize={8.8in,12.45in},
					twoside,
					left=1.0in,
					right=0.5in,
					top=1.0in,
					bottom=1.0in,
					foot=0.4in]
				{geometry}
		}{
			% letter = 216mm x 279mm
			% letterhalf ~ 220mm x 340mm
			\RequirePackage[
					papersize={220mm,320mm},
					twoside,
					left=1.0in,
					right=0.5in,
					top=0.8in,
					bottom=1.1in,
					foot=0.4in]
				{geometry}
		}
		\parskip = 0.1in
		\parindent = 0.0in
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
		%\setmathrm{Palatino}
		%\setboldmathrm[BoldFont=Palatino Bold]{Palatino Bold}

		\large
	}
}

\DeclareOption{oldhandout}{ % made into oldhandout October 2012
	\PassOptionsToClass{handout}{beamer}
	\PassOptionsToClass{12pt}{article}
	\AtEndOfClass{
		\RequirePackage{multicol}
		\ifthenelse{\boolean{a4paper}}{
			% a4 = 210 x 297mm
			% a4half ~ 8.6in x 12.16in
			\RequirePackage[
					papersize={8.8in,12.45in},
					twoside,
					left=1.0in,
					right=0.5in,
					top=1.0in,
					bottom=1.0in,
					foot=0.4in]
				{geometry}
		}{
			% letter = 216mm x 279mm
			% letterhalf ~ 220mm x 340mm
			\RequirePackage[
					papersize={220mm,320mm},
					twoside,
					left=1.0in,
					right=0.5in,
					top=1.0in,
					bottom=1.0in,
					foot=0.4in]
				{geometry}
		}
		\parskip = 0.1in
		\parindent = 0.0in
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
		%\setmathrm{Palatino}
		%\setboldmathrm[BoldFont=Palatino Bold]{Palatino Bold}

		\large
	}
}

\DeclareOption{paper}{
	\PassOptionsToClass{11pt}{article}
	\PassOptionsToClass{letterpaper}{article}
	\AtEndOfClass{
		%\RequirePackage[left=1.0in,right=1.0in,top=1.0in,bottom=1.0in,foot=0.75in,paper=letterpaper]{geometry}
		\textwidth = 6.5 in
		\textheight = 9 in
		\oddsidemargin = 0.0 in
		\evensidemargin = 0.0 in
		\topmargin = 0.0 in
		\headheight = 0.0 in
		\headsep = 0.0 in

		\parindent = 1em
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
	}
}

\DeclareOption{lisquib}{
	\PassOptionsToClass{12pt}{article}
	\PassOptionsToClass{letterpaper}{article}
	\AtEndOfClass{
		\RequirePackage[margin=1.5in,paper=letterpaper]{geometry}

		\parindent = 1em
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
%		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
%		\setmathrm{TeX Gyre Pagella}
		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
		\setmathrm{TeX Gyre Termes}
	}
}

\DeclareOption{review}{
	\PassOptionsToClass{11pt}{article}
	\PassOptionsToClass{letterpaper}{article}
	\AtEndOfClass{
		\RequirePackage[paper=letterpaper, hmargin=1in, vmargin=1in]{geometry}
%		\parindent = 0.1in
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
%		\newcommand\fakesc[1]{\scalebox{0.75}{\MakeUppercase{#1}}}
		\RequirePackage{titlesec}
	}
	\AtBeginDocument{
%		\renewcommand{\thesection}{\arabic{section}}
%		\allsectionsfont{\fontsize{12pt}{14pt}}
%		\sectionfont{\textbf}

		\parskip = 0in
		\parindent = 0.5in
		
		\let\footnotesize\small
		
		\titlelabel{\thetitle. }
		\titleformat*{\section}{\fontsize{12pt}{14pt}\bf}
		\titleformat*{\subsection}{\fontsize{12pt}{14pt}\it}
		\titleformat*{\subsubsection}{\fontsize{12pt}{14pt}}
		\titlespacing*{\section}{0pt}{14pt}{14pt}
		\titlespacing*{\subsection}{0pt}{14pt}{14pt}
		\titlespacing*{\subsubsection}{0pt}{14pt}{14pt}
		
%		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
%		\setmathrm{TeX Gyre Termes}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
		
		\fontsize{12pt}{14pt}
	}
}

\DeclareOption{dissertation}{
	\setboolean{report}{true}
	\PassOptionsToClass{11pt}{report}
	\PassOptionsToClass{letterpaper}{report}
	\PassOptionsToClass{twoside}{report}
	\AtEndOfClass{
		\RequirePackage[
				twoside,
				letterpaper,
				left=1in,
				right=1in,
				top=1.4in,
				bottom=1in,
				foot=0.4in]
			{geometry}

%		\RequirePackage{chngcntr}
%		\AtBeginDocument{
%			\counterwithin{exx}{chapter}
%		}

% no longer using \part:
%
%		% table of contents:
%		\RequirePackage{tocloft}
%		% based on http://tex.stackexchange.com/questions/129592/add-parts-to-the-table-of-contents
%		\makeatletter
%		\@addtoreset{section}{part}
%		\makeatother
%		\newlength\mylen
%		\renewcommand\thepart{\Roman{part}}
%		\renewcommand\cftpartpresnum{Part~}
%		\settowidth\mylen{\bfseries\cftpartpresnum\cftpartaftersnum}
%		\addtolength\cftpartnumwidth{\mylen}
		
		\setstretch{1.3}
		\parindent=1em
		\parskip=0pt
		
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}

		\RequirePackage{fancyhdr}
		
		% why isn't this working?
%		\renewcommand{\chaptermark}[1]{\markboth{#1}{}}

		\pagestyle{fancy}
		\fancyhead[RO,LE]{\thepage}
		\fancyhead[LO]{\rightmark}
		\fancyhead[RE]{\leftmark}
		\fancyfoot{}
		\setlength{\headheight}{14pt}

		% reset marking on first page of each chapter:
%		\fancypagestyle{plain}{
%			\fancyhf{} % clear all header and footer fields
%			\renewcommand{\headrulewidth}{0pt}
%			\renewcommand{\footrulewidth}{0pt}
%		}

		\RequirePackage[bordercolor=gray,backgroundcolor=yellow,linecolor=gray]{todonotes}
	}
	\AtBeginDocument{
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
%		\setmainfont{Minion Pro}
%		\setmathfont{Minion Pro}
	}
}


\DeclareOption{cv}{
	\PassOptionsToClass{11pt}{article}
	\AtEndOfClass{
		\textwidth = 6.5 in
		\textheight = 9 in
		\oddsidemargin = 0.0 in
		\evensidemargin = 0.0 in
		\topmargin = 0.0 in
		\headheight = 0.0 in
		\headsep = 0.0 in
		\parskip = 0.2in
		\parindent = 0.0in

		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
		\renewcommand{\textsc}[1]{{#1}} % temporary lack of smallcaps

		\makeatletter
		\renewcommand{\section}[1]{\vspace{\baselineskip}\hrule\vspace{-0.6\baselineskip}\par{\large{\textbf {#1}}}\par\vspace{-0.6\baselineskip}}
		\makeatother
		
		\makeatletter
		\renewcommand{\subsection}[1]{{\textsc {#1}}\par\vspace{-0.6\baselineskip}}
		\makeatother
		
		\newcommand{\entrylabel}[1]{\mbox{#1}\hfil}
		\newenvironment{CV}
			{
			\begin{list}{}
				{\renewcommand{\makelabel}{\entrylabel}
				\setlength{\labelwidth}{87pt}
				\setlength{\leftmargin}{94pt}
			}}
			{\end{list}
		}
		
		\newenvironment{miniCV}
			{
			\begin{list}{}
				{\renewcommand{\makelabel}{\entrylabel}
				\setlength{\labelwidth}{30pt}
				\setlength{\leftmargin}{37pt}
			}}
			{\end{list}
		}
	}
	\AtBeginDocument{
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
	}
}
\DeclareOption{thesis}{
	\setboolean{report}{true}
	\PassOptionsToClass{11pt}{report}
	\AtEndOfClass{
		\textwidth = 6.5 in
		\textheight = 9 in
		\oddsidemargin = 0.0 in
		\evensidemargin = 0.0 in
		\topmargin = 0.0 in
		\headheight = 0.0 in
		\headsep = 0.0 in
		\parskip = 0.0in
		\parindent = 0.2in
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		%\newcommand\fakesc[1]{{\scshape \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
		%\setmathrm{Palatino}
		%\setboldmathrm[BoldFont=Palatino Bold]{Palatino Bold}
	}
}
\DeclareOption{abstract}{
	\PassOptionsToClass{12pt}{article}
	\AtEndOfClass{
		\ifthenelse{\boolean{a4paper}}{
			\textwidth = 160mm
			\textheight = 247mm
		}{
			\textwidth = 6.5 in
			\textheight = 9 in
		}
		\oddsidemargin = 0.0 in
		\evensidemargin = 0.0 in
		\topmargin = 0.0 in
		\headheight = 0.0 in
		\headsep = 0.0 in
		\parskip = 0.0in
		\parindent = 0.0in
		
		%\renewcommand{\section}[1]{\parskip = 0.1in\\\textbf{#1}}
		\bibliographystyle{linquiry2}
		\def\glt{}
		\newcommand\fakesc[1]{{\textsc{#1}}}
	}
	\AtBeginDocument{
		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
		\setmathrm{TeX Gyre Termes}

		\fontsize{12}{14}\selectfont
	}
}

\DeclareOption{poster}{
	\PassOptionsToClass{11pt}{article}
	\AtEndOfClass{
		\ifthenelse{\boolean{a1poster}}{
			\RequirePackage[a1paper, landscape, margin=1.75in]{geometry}
			%\special{papersize=48in,34in}%36in
		}{
			\RequirePackage[papersize={48in,34in}, margin=1.75in]{geometry}
			\special{papersize=48in,34in}%36in
		}

		\RequirePackage{multicol}

%		\textwidth = 6.5 in
%		\textheight = 9 in
%		\oddsidemargin = 0.0 in
%		\evensidemargin = 0.0 in
%		\topmargin = 0.0 in
		\headheight = 0.0 in
		\headsep = 0.0 in
		\parskip = 0.3in
		\parindent = 0.0in

%		\RequirePackage{euler}
%		\setmathrm{Times New Roman}
%		\setmathrm[{Scale=3.5}]{Euler}

		\RequirePackage{unicode-math}
		
		\newfontfamily\ttfont[Scale=0.8]{Monaco}
		\renewcommand{\texttt}[1]{{\ttfont #1}}
		
%		\newcommand{\resetfontscale}{\addfontfeature{Scale=3.5}}
		\renewcommand{\tiny}{\fontsize{24}{30}\selectfont}
		\renewcommand{\small}{\fontsize{32}{41}\selectfont}
		\renewcommand{\normalsize}{\fontsize{36}{45}\selectfont}
		\renewcommand{\large}{\fontsize{42}{67}\selectfont}
		\renewcommand{\Large}{\fontsize{47}{72}\selectfont}
		\renewcommand{\HUGE}{\fontsize{67}{88}\selectfont}
		\DeclareMathSizes{36}{36}{28}{23}
		
		\renewcommand{\section}[1]{\textbf{\Large #1}}
		\bibliographystyle{linquiry2}
		%\newcommand\fakesc[1]{{\addfontfeature{Scale=0.8} \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
		\setmathfont[Scale=1]{lmmath-regular.otf}
		
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}

%		\setstretch{3.6}
%		\resetfontscale
		\normalsize
		\renewcommand{\columnseprulecolor}{\color{gray}}
		\everymath{\displaystyle}
	}
}

\DeclareOption{slides}{
	\setboolean{loadBeamer}{true}
	\PassOptionsToClass{xetex,mathserif,serif,10pt}{beamer}
	\AtEndOfClass{
		\mode<presentation>
		{
			\usetheme{Mitcho}
			% or ...
		
			\setbeamercovered{transparent}
			% or whatever (possibly just delete it)
		}
		\usepackage[english]{babel}

		\bibliographystyle{linquiry2}
		%\newcommand\fakesc[1]{{\addfontfeature{Scale=0.8} \MakeUppercase{#1}}}
		\newcommand\fakesc[1]{\textsc{#1}}
	}
	\AtBeginDocument{
		%\setmainfont[BoldFont={Palatino Bold},SmallCapsFont={Palatino},SmallCapsFeatures={Letters=SmallCaps,Scale=0.7,OpticalSize=0,FakeBold=0.1}]{Palatino}
		\setmainfont[BoldFont={TeX Gyre Pagella Bold}]{TeX Gyre Pagella}
		\setmathrm{TeX Gyre Pagella}
	}
}

% beamer options:
\DeclareOption{trans}{
	\PassOptionsToClass{trans}{beamer}
}
\DeclareOption{draft}{
	\PassOptionsToClass{draft}{beamer}
}

\DeclareOption{gentium}{
	\AtBeginDocument{
		\setmainfont[BoldFont={Palatino Bold}]{Gentium}
		\setmathrm{Gentium}
	}
}

\DeclareOption{landscape}{
	\AtEndOfClass{
		\RequirePackage[papersize={11in,8.5in}, margin=0.6in]{geometry}
		\special{papersize=11in,8.5in}
	}
}

\DeclareOption{naccl}{
	\PassOptionsToClass{12pt}{article}
	\AtEndOfClass{
		\RequirePackage[papersize={8.5in,11in}, hmargin=1.25in, vmargin=1.5in]{geometry}
		\special{papersize=8.5in,11in}
		\parindent = 0.1in
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		\newcommand\fakesc[1]{\scalebox{0.75}{\MakeUppercase{#1}}}
		\RequirePackage{fancyhdr}
		\RequirePackage{sectsty}
	}
	\AtBeginDocument{
		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
		\setmathrm{TeX Gyre Termes}

		\voffset = -0.2in
		\headsep = 0.5in
		\pagestyle{fancy}
		\rhead{}
		\lhead{}
		\lfoot{}
		\cfoot{}
		\rfoot{}
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
		\renewcommand{\thesection}{\arabic{section}.}
		\allsectionsfont{\fontsize{12pt}{12pt}
			\parindent=0in
			\textbf}
		\parskip = 0in
		\parindent = 0.35in
	}
}

\DeclareOption{afla}{
	\PassOptionsToClass{12pt}{article}
	\PassOptionsToClass{a4paper}{article}
	
%The font size for the title of the paper is 14 pt. The font size for the abstract, footnotes,
%and captions is 10 pt. The font size for everything else
%—the main text, the author’s name, affiliation, e-mail address, references—
%is 12 pt.
	
	\AtEndOfClass{
		\RequirePackage[paper=a4paper, hmargin=1in, vmargin=1.25in]{geometry}
%		\special{papersize=8.5in,11in}
%		\parindent = 0.1in
		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
%		\newcommand\fakesc[1]{\scalebox{0.75}{\MakeUppercase{#1}}}
%		\RequirePackage{fancyhdr}
%		\RequirePackage{sectsty}
		\RequirePackage{titlesec}
	}
	\AtBeginDocument{
		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
		\setmathrm{TeX Gyre Termes}

%		\renewcommand{\thesection}{\arabic{section}}
%		\allsectionsfont{\fontsize{12pt}{14pt}}
%		\sectionfont{\textbf}

		\parskip = 0in
		\parindent = 0.5in
		
		\let\footnotesize\small
		
		\titlelabel{\begin{minipage}{0.5in}\thetitle.\end{minipage}}
		\titleformat*{\section}{\fontsize{12pt}{14pt}\bf}
		\titleformat*{\subsection}{\fontsize{12pt}{14pt}}
		\titleformat*{\subsubsection}{\fontsize{12pt}{14pt}}
		\titlespacing*{\section}{0pt}{14pt}{14pt}
		\titlespacing*{\subsection}{0pt}{14pt}{14pt}
		\titlespacing*{\subsubsection}{0pt}{14pt}{14pt}
		
		\fontsize{12pt}{14pt}
	}
}

\DeclareOption{glowinasia}{
	\PassOptionsToClass{12pt}{article}
	\AtEndOfClass{
		\RequirePackage[papersize={210mm,297mm}, hmargin=25mm, vmargin=25mm]{geometry}
		\special{papersize=210mm,297mm}
		\parindent = 6mm
%		\bibliographystyle{linquiry2}
		\def\glt{\vskip.17\baselineskip}
		\newcommand\fakesc[1]{\scalebox{0.75}{\MakeUppercase{#1}}}
		\RequirePackage{fancyhdr}
		\RequirePackage{sectsty}
	}
	\AtBeginDocument{
		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
		\setmathrm{TeX Gyre Termes}

		\voffset = -9.7mm
		\headsep = 25mm
		\pagestyle{fancy}
		\rhead{}
		\lhead{}
		\lfoot{}
		\cfoot{}
		\rfoot{}
		\chead[E]{Online Proceedings of GLOW in Asia Workshop for Young Scholars 2011}
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
		\renewcommand{\thesection}{\arabic{section}.}
		\allsectionsfont{\fontsize{12pt}{12pt}
			\parindent=0in
			\textbf}
		\parskip = 0in
		\parindent = 0.35in
	}
}

\DeclareOption{cascadilla}{
	\PassOptionsToClass{10pt}{article}
	
	\newcommand\CascadillaCopyright {
		\fancypagestyle{plain}{
		\fancyhf{}
		\fancyfoot[L]{\vspace{0.1in}\small\copyright{}\ \the\year\ Michael Yoshitaka Erlewine\\Cascadilla Proceedings
		Project\\Completed \@cascdate}
		\renewcommand{\headrulewidth}{0pt}
		}
	}
%	\AtBeginDocument{\CascadillaCopyright{}}
	\AtBeginDocument{\thispagestyle{plain}\fancypagestyle{plain}{
		\fancyhf{}}		\renewcommand{\headrulewidth}{0pt}}	
	
	\AtEndOfClass{
		\RequirePackage[letterpaper,left=1.38in,right=1.38in,top=1.0in,bottom=1.0in,foot=0.75in]{geometry}
		%\special{papersize=8.5in,11in}
		\bibliographystyle{cascadilla}
		\def\glt{\vskip.17\baselineskip}
		\newcommand\fakesc[1]{\scalebox{0.75}{\MakeUppercase{#1}}}

		\RequirePackage{indentfirst}

		\RequirePackage{fancyhdr}
		\RequirePackage{titlesec}
		% unused:
		% \RequirePackage[labelfont=bf]{caption}
		\setlength{\textheight}{8.75in}
	}
	\AtBeginDocument{
		\setmainfont[BoldFont={TeX Gyre Termes Bold}]{TeX Gyre Termes}
		\setmathrm{TeX Gyre Termes}

		\setlength{\textheight}{9in}
	
		% The stylesheet (apparently) demands justified text *without* any
		% hyphenation (i.e., only word and letter spacing), even though this is
		% really ugly and violates every typographic convention, and ends up 
		% looking like a cheap MS Word document. The following parameter settings
		% discourage TeX's layout algorithm from breaking lines with syllabic hyphens.
		% Can be suppressed by the "hyphenate" class option.
		\hyphenpenalty=5000
		\tolerance=1000
		
		% Paragraph indents should be one quarter inch
		\parindent=0.25in
		
		% Footnotes should be set in 9pt, which is \small
		\let\footnotesize\small
		
		% Disable page numbers. Suppressed by "pagenums" class option.
		\pagestyle{empty}
		\setlength{\footskip}{0in}

		% Reduce the spacing around captions in tables and figures
		\setlength{\abovecaptionskip}{12pt}
		\setlength{\belowcaptionskip}{-5pt}
		
		% Provide a command for the bibliography
		\newcommand{\cascadillabibliography}[1]{\small\renewcommand{\baselinestretch}{2}\bibliographystyle{cascadilla}\bibliography{#1}}
		
		% Tell natbib to indent hanging lines by a quarter inch
		\setlength{\bibhang}{0.25in}
	
		% Set up citation punctuation for, e.g., (Shosted, 2006:13).
		\bibpunct[:]{(}{)}{;}{a}{,}{,}

		% Format section headings according to the cascadilla stylesheet
		\titlelabel{\thetitle.\ }
		\titleformat*{\section}{\fontsize{12pt}{0}\bf}
		\titleformat*{\subsection}{\fontsize{11pt}{0}\itshape}
		\titleformat*{\subsubsection}{\fontsize{11pt}{0}\itshape}
		\titlespacing{\section}{0pt}{11pt}{10pt}
		\titlespacing{\subsection}{0pt}{11pt}{10pt}
		\titlespacing{\subsubsection}{0pt}{11pt}{10pt}
		
		% Commands for immediate subsections, which require different spacing than
		% normal headings
		\newcommand{\immedsubsection}[1]{\vspace{-9pt}\subsection{#1}}
		\newcommand{\immedsubsubsection}[1]{\vspace{-9pt}\subsubsection{#1}}

	}
}

\ProcessOptions

\ifthenelse{\boolean{loadBeamer}}
{
	\LoadClass{beamer}
}{
	\ifthenelse{\boolean{report}}{
		\LoadClass{report}
	}{
		\LoadClass{article}
	}
}

%%%%%%%%%%
% SOME TEXT FORMATTING STUFF
%%%%%%%%%%

\usepackage{fixltx2e}

\usepackage{url}
\usepackage{empheq}

\usepackage{color}
\definecolor{darkgray}{gray}{0.2}
\definecolor{mitred}{cmyk}{0,1,0.65,0.34}
\definecolor{mitgray}{gray}{0.5}
\definecolor{hlyellow}{cmyk}{0,0,0.2,0}

%\usepackage[activate]{pdfcprot} % Use margin kerning

%%% EULER MATH FONT
%\usepackage{euler}
%\usepackage{eulervm}

% math symbols: must be loaded relatively early
\usepackage{amssymb}

\usepackage{setspace}
\usepackage{xspace}
\usepackage{cancel}

\usepackage{hyphenat}

%%%%%%%%%%
% NATIVE FONTS
%%%%%%%%%%

\RequirePackage{microtype}

\RequirePackage{etoolbox}
\AtEndPreamble{
	\usepackage{mathspec}
	\defaultfontfeatures{Mapping=tex-text}
}

\AtBeginDocument{
	\def\en{\rmfamily}

	\newfontfamily\ja[Scale=0.87]{Hiragino Mincho ProN W3}
	\newfontfamily\Japanese[Scale=0.87]{Hiragino Mincho ProN W3}
	\newfontfamily\AltJapanese[Scale=0.8]{Hiragino Mincho ProN W6}

	\newfontfamily\zh[Scale=0.9,BoldFont={STFangsong},BoldFeatures={FakeBold=1.3}]{STFangsong}
	\newfontfamily\Mandarin[Scale=0.9,BoldFont={STFangsong},BoldFeatures={FakeBold=1.5}]{STFangsong}
	\newfontfamily\MandarinOption[Scale=0.9]{STFangsong}
	\newfontfamily\AltMandarin[Scale=0.8]{STFangsong}%LiSong Pro
}

%%%%%%%%%%
% FORMATTING MACROS
%%%%%%%%%%

\newcommand{\topalign}[2][6.5in]{{\vbox to 0pt{\null}{\begin{minipage}[t]{#1}\vspace*{-.13in} #2\end{minipage}}}}

\usepackage{wrapfig} %For text wrap

\ifthenelse{\boolean{loadBeamer}}
{
}{
\renewcommand{\labelenumi}{\alph{enumi})}
\renewcommand{\labelenumii}{\arabic{enumii}.}
}

\ifthenelse{\boolean{loadBeamer}}
{
}{
	\ifthenelse{\boolean{diff}}{
		\usepackage[linktocpage=true,bookmarks=true,hyperfootnotes=true,hyperindex=true,colorlinks=false,pdfnewwindow=true,pdfauthor={},unicode=true]{hyperref} %Michael Yoshitaka Erlewine
	}{
		\usepackage[linktocpage=true,bookmarks=true,hyperfootnotes=true,hyperindex=true,colorlinks=true,pdfnewwindow=true,urlcolor=darkgray,linkcolor=darkgray,bookmarksopen=true,anchorcolor=darkgray,citecolor=darkgray,pdfauthor={},unicode=true]{hyperref} %Michael Yoshitaka Erlewine
		
	}
}

%%%%%%%%%%
% LING PACKAGES
%%%%%%%%%%

\usepackage{tikz}
\usetikzlibrary{arrows}
\usetikzlibrary{chains}
\tikzstyle{every picture}+=[remember picture]
\tikzstyle{na} = [baseline=-.5ex]
\tikzstyle{skip loop}=[to path={-- ++(0,#1) -| (\tikztotarget)}]
\tikzstyle{skip loop dead}=[to path={-- ++(0,#1) -| node {x} ++(-4cm,0)}]
\tikzstyle{leaf} = [baseline=-1.85ex]
\tikzstyle{root} = [baseline=1.5ex]
\usetikzlibrary{calc, decorations, decorations.pathreplacing, decorations.pathmorphing}

\usepackage{graphicx}
%\DeclareGraphicsExtensions{.pdf}

\RequirePackage{enumitem}

% something for pandoc support, to make sure things aren't munged:
\newcommand{\dummywrap}[1]{#1}


%bibliography setup
\usepackage{natbib}
\newcommand{\cites}[2][]{\citeauthor{#2}'s\xspace#1\ (\citeyear{#2})}

% symbolfootnote:
\long\def\symbolfootnote[#1]#2{\begingroup%
\def\thefootnote{\fnsymbol{footnote}}\footnote[#1]{#2}\endgroup}

\long\def\normalfootnote[#1]#2{\begingroup%
\def\thefootnote{\Arabic{footnote}}\footnote[#1]{#2}\endgroup}

\long\def\symbolfootnotemark#1{\begingroup%
\def\thefootnote{\fnsymbol{footnote}}\footnotemark{#1}\endgroup}

\long\def\symbolfootnotetext#1{\begingroup%
\def\thefootnote{\fnsymbol{footnote}}\footnotetext{#1}\endgroup}

%%%%%%%%%%
% LING SYMBOLS/MACROS
%%%%%%%%%%

\usepackage{amsmath}
\newcommand{\checkmk}{\ensuremath{^{\checkmark}}}
\newcommand{\xmark}[0]{\checkmk{}\!}
%\usepackage{amsfonts}

\usepackage{stmaryrd} % for \sem
\newcommand{\Sem}[2][]{\ensuremath{\left\llbracket #2\right\rrbracket^{#1}}}
%\newcommand{\sem}[2][M\!,g]{\mbox{ $[\![ #2 ]\!]^{#1}$}}

% define \must and \might
\def\must{\ensuremath{\Box}}
\def\might{\ensuremath{\diamondsuit}}

% define \Bracket{}, for Type Theory or algebraic ideals.
\newcommand{\Bracket}[1]{\ensuremath{\langle #1\rangle}}

% define \xbar{}, a bar-level command
\newcommand{\xbar}[1]{\ensuremath{\overline{\mathrm{#1}}}}
\newcommand{\xbarbar}[1]{\ensuremath{\overline{\overline{\mathrm{#1}}}}}

\RequirePackage[normalem]{ulem}
% defines \hl{}, highlighting
\RequirePackage{soul}
\sethlcolor{hlyellow}
% define \strike{}, a strikeout command
\newcommand{\strike}[1]{\sout{#1}}

% defines changed environment
% footnote trick from http://tex.stackexchange.com/questions/113640/print-mdframed-footnotes-at-bottom-of-page-instead-of-after-frame
\RequirePackage{mdframed}
\RequirePackage{footnote}
\newenvironment{changed}
{   
    \savenotes
	\begin{mdframed}[backgroundcolor=hlyellow,linecolor=transparent,linewidth=0pt,leftmargin=-10pt,rightmargin=-10pt,footnoteinside=false]
    \stepcounter{footnote}
    \renewcommand{\thempfootnote}{\arabic{footnote}}
    }
{
    \end{mdframed}
    \spewnotes
}

\RequirePackage{wasysym}

% Define \handparen, for nice asides
% from Omer
\newcommand{\handparen}[1]{{\paren{\justifying~\parbox{\linewidth-2em}{ {#1} }~}}}
\newcommand{\paren}[1]{{\ensuremath{\left ( \text{#1} \right ) }}}

% Better switching between ragged-right/left and justifying environments
% used for Omer's handparen
\RequirePackage{ragged2e}

\AtBeginDocument{
	\newfontfamily\FingerFont[Scale=1]{Hiragino Mincho ProN W6}
	%\newfontfamily\BangFont[Scale=1.1]{MS Mincho}
	\newfontfamily\BangFont[Scale=1.1]{Hiragino Mincho Pro W3}
}
\newcommand{\finger}{{\FingerFont ☞}}
\newcommand{\bang}{{\BangFont ‽}}
\usepackage{skull}

%\usepackage[marginpar]{todo}
\newcommand{\fixme}[1]{\noindent\begin{mdframed}{\bf FIXME:} #1\end{mdframed}}
%\newcommand{\fixme}[1]{\todo{#1}}
\newcommand{\fm}[1]{\fbox{{\bf FIXME:} #1}}
\newcommand{\maybestrike}[1]{{\bf STRIKE?} \sout{#1}}
\newcommand{\awk}[1]{\fbox{{\bf AWK:} #1}}%\todo[Awkward]{#1}
%\newcommand{\checkme}[1]{<>\todo[Check]{#1}}
%\AtEndDocument{\todos}

\newcommand{\linkarrow}[3][0]{\raisebox{#1in}[0pt]{\hspace{-3pt}\rule[-3pt]{#2}{0.5pt}\hspace{-1pt}|$_{#3}$}}
\newcommand{\twolinkarrow}[4][0]{\raisebox{#1in}[0pt]{$\uparrow$\hspace{-3pt}\rule[-3pt]{#2}{0.5pt}\hspace{-1pt}|\rule[-3pt]{#3}{0.5pt}\hspace{-1pt}|$_{#4}$}}
\newcommand{\charset}{\mbox{char}}

\newcommand{\ett}{\Bracket{\Bracket{e,t},t}}
\newcommand{\gap}[1][0.2in]{\uline{\hspace*{#1}}}
\newcommand{\tikzgap}[1]{\underline{\hspace{0.1in}\tikz[na]\node [coordinate] (#1) {};\hspace{0.1in}}\,}
\newcommand{\tikzmark}[1]{\tikz[na]\node [coordinate] (#1) {};}
\newcommand{\tikznode}[2]{\tikz[na]\node [] (#1) {#2};}
\newcommand{\tikzrect}[2]{\tikz[na]\node [rectangle] (#1) {#2};}
\newcommand{\labelbox}[2]{\tikz[na]\node [rectangle,outer sep=-1pt,inner sep=0pt] (#1) {#2};}

\newcommand{\tikzleaf}[1]{
	{\vspace{-1in}\hspace*{0.5in}\tikz[leaf]\node [coordinate] (#1) {};\hspace*{0.5in}} }
\newcommand{\tikzleafmark}[1]{
	{\vspace{-1in}\hspace*{0.1in}\tikz[leaf]\node [coordinate] (#1) {};\hspace*{0.1in}} }
\newcommand{\tikzroot}[1]{{\tikz[root]\node [coordinate] (#1) {};}}

\newcommand{\tikznolabel}[1]{{\vspace*{-1.5em}\tikz[root]\node [coordinate] (#1) {};}}

\newlength{\labelwordoffset}
\setlength{\labelwordoffset}{-0.31in}
\newlength{\labelwordboxwidth}
\newcommand{\labelword}[2]{%
	\settowidth{\labelwordboxwidth}{#2}%
	\begin{minipage}[t]{\labelwordboxwidth}
		\centering
		#2\\
		\vspace*{\labelwordoffset}\tikz[root]\node [coordinate] (#1) {};
	\end{minipage}%
}
\newcommand{\newlabelword}[2]{%
	%\settowidth{\labelwordboxwidth}{#2}%
	%\begin{minipage}[t]{\labelwordboxwidth}
		%\vspace*{\labelwordoffset}
		\tikz[baseline,anchor=base]{\node [rectangle,draw=none] (#1) {#2};}%
	%\end{minipage}%
}


\newcommand{\tikzlabelleaf}[2]{
	\settowidth{\labelwordboxwidth}{#2}
	\begin{minipage}[t]{\labelwordboxwidth}
		\centering
		#2\\
		\vspace*{-0.38in}\tikz[root]\node [coordinate] (#1) {};
	\end{minipage}
}

\newcommand{\highlightbox}[1]{\hspace{0.1in}{\color{gray}\vrule width 0.1in}\hspace{0.3in}\begin{minipage}{\columnwidth-0.5in}#1\end{minipage}\\}

\newcommand{\group}[1]{#1}

%%%% text controls

\lefthyphenmin3

%gb4e for numbered examples, loaded last due to _ and ^ overloading
\ifthenelse{\boolean{enumitem-gb4e}}{
	\RequirePackage{enumitem}
	\AtEndPreamble{
		\usepackage{enumitem-gb4e}
	}
}{
	\ifthenelse{\boolean{expex}}{
		\AtEndPreamble{
			\usepackage{expex}
		}
	}{
		\AtEndPreamble{
			\usepackage{gb4e}
		}		
	}
}
