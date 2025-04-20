% ufpe-article.cls - Document class for UFPE academic articles
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufpe-article}[Artigo acadêmico para a UFPE]

% Carrega a Classe memoir e algumas opções padrão
\LoadClass[12pt,a4paper,article]{memoir}

% Carrega os pacotes necessário
\RequirePackage{luatex85}
\RequirePackage{amsmath,amssymb,mathtools}
\RequirePackage{fontspec}
\RequirePackage[brazilian]{babel}
\RequirePackage{graphicx,microtype}
\RequirePackage[style=abnt,backend=biber]{biblatex}
\RequirePackage{indentfirst,hyperref}
\RequirePackage{booktabs,caption,geometry}

% Configura as fontes padrão
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

% Define os tamanhos de fontes e baselineskip
%% \fontsize{Tamanho da Fonte}{Tamanho do Baseline}
\renewcommand{\normalsize}{\fontsize{12pt}{14.4pt}\selectfont}
\renewcommand{\small}{\fontsize{10.95pt}{13.6pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont}
\renewcommand{\large}{\fontsize{14.4pt}{18pt}\selectfont}
\renewcommand{\Large}{\fontsize{17.28pt}{22pt}\selectfont}
\normalsize

% Configurações de espaçamento no início do parágrafo
\setlength{\parindent}{1.25cm}

% Margens de acordo com as normas ABNT
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout

% Define os estiles de cabeçalho e rodapé mais simples
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\thepage}
\makeevenfoot{abntheadings}{}{}{}
\makeoddfoot{abntheadings}{}{}{}

\makepagestyle{plainheadings}
\makeevenhead{plainheadings}{\thepage}{}{}
\makeoddhead{plainheadings}{}{}{\thepage}
\makeevenfoot{plainheadings}{}{}{}
\makeoddfoot{plainheadings}{}{}{}

\aliaspagestyle{plain}{plainheadings}

\setlength{\headheight}{14.5pt}
\setlength{\headsep}{0.7cm}

% Formatação dos títulos de seção
\setsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setsubsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setsubsubsecheadstyle{\normalsize\bfseries\itshape}

% Configuração de numeração de seções
\counterwithout{figure}{section}
\counterwithout{table}{section}

\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% Espaçamento
\OnehalfSpacing

% Configuração do Sumário. Ainda necessita conferência das normas.
\setrmarg{2.55em}
\renewcommand{\cftsectionfont}{\bfseries}
\renewcommand{\cftsectionpagefont}{\bfseries}
\renewcommand{\cftsectionleader}{\cftdotfill{\cftsectiondotsep}}
\renewcommand{\cftsectiondotsep}{\cftdotsep}
\settocdepth{subsection}
\setsecnumdepth{subsubsection}
\renewcommand{\contentsname}{Sumário}

% Comandos disponíveis
\newcommand{\ufpetitle}[6]{%
	% #1: Título, #2: Autor, #3: Departamento, #4: Graduação, #5: Disciplina, #6: Data
	\thispagestyle{empty}
	\title{#1}
	\author{#2}

	% Altera a geometria da página para o título
	\newgeometry{left=2cm, right=2cm, top=2cm, bottom=2cm}

	\begin{titlingpage}
		\begin{center}
			\vspace*{1cm}
			\includegraphics[width=0.3\textwidth]{logoUFPE-Versoes.png}\par
			{\Large\bfseries UNIVERSIDADE FEDERAL DE PERNAMBUCO\par}
			\vspace{1cm}
			{\large\bfseries #3\par}
			{\large\bfseries #4\par}
			{\large\bfseries #5\par}
			\vspace{4cm}
			{\LARGE\bfseries\MakeUppercase{\thetitle}\par}
			\vspace{4cm}
			{\large\bfseries\theauthor\par}
			\vfill
			{\large RECIFE\\
				#6 \par}
		\end{center}
	\end{titlingpage}

	% Retorna a geometria original
	\restoregeometry
}

\newcommand{\ufpetoc}{%
	\renewcommand{\contentsname}{Sumário}
	%% \aliaspagestyle{tocheadings}{empty} % Make sure TOC uses empty style
	\pagestyle{empty}
	\addcontentsline{toc}{section}{\contentsname}
	\begingroup
	\SingleSpacing
	\tableofcontents*
	\endgroup
	\thispagestyle{empty} % Explicitly force this page to be empty
	\clearpage
}

\newcommand{\ufpeabstract}[4]{%
	% #1: Resumo em Português, #2: Palavras-chave, #3: Resumo em inglês, #4: Palavras-chave em inglês
	\thispagestyle{empty}
	\section*{Resumo}
	\addcontentsline{toc}{section}{Resumo}
	#1

	\vspace{1cm}
	\noindent \textbf{Palavras-chave:} #2.

	\vspace{2cm}
	\section*{Abstract}
	\addcontentsline{toc}{section}{Abstract}
	#3

	\vspace{1cm}
	\noindent \textbf{Keywords:} #4.
	\clearpage
}

\newcommand{\ufpestartcontent}{%
	\pagestyle{abntheadings}
}

\newcommand{\ufpereferences}{%
	\clearpage
	\renewcommand{\bibname}{Referências}
	\printbibliography[heading=bibintoc]
}

% Define o estilo padrão para as páginas do início do documento como sendo empty
\AtBeginDocument{%
	\pagestyle{empty}
}

% Exemplo de uso da classe ufpe-article
%
% \documentclass{ufpe-article}
%
% % Add your bibliography file
% \addbibresource{references.bib}
%
% \begin{document}
%
% % Create the title page
% \ufpetitle{Título do Artigo}
%          {Pedro Malta Schuler Caloête}
%          {DEPARTAMENTO DE CIÊNCIAS CONTÁBEIS E ATUARIAIS}
%          {BACHARELADO EM CIÊNCIAS CONTÁBEIS}
%          {DISCIPLINA}
%          {DATA}
%
% % Generate table of contents
% \ufpetoc
%
% % Add abstract and keywords
% \ufpeabstract{Este é o resumo do artigo acadêmico. Deve conter entre 150 e 250 palavras, apresentando de forma concisa os objetivos, metodologia, resultados e conclusões do trabalho. O texto deve ser em parágrafo único, justificado e com espaçamento simples.}
%              {palavra1; palavra2; palavra3; palavra4; palavra5}
%              {This is the abstract of the academic article. It should contain between 150 and 250 words, concisely presenting the objectives, methodology, results, and conclusions of the work. The text should be in a single paragraph, justified, and with single spacing.}
%              {keyword1; keyword2; keyword3; keyword4; keyword5}
%
% % Start main content with proper page style
% \ufpestartcontent
%
% % Main content
% \section{Introdução}
% Este é um texto de exemplo para a introdução...
%
% % More sections...
%
% % Add references
% \ufpereferences
%
% \end{document}
