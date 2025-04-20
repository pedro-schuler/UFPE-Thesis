% ufpe-thesis.cls - Document class for UFPE academic theses and dissertations
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufpe-thesis}[Tese/dissertação acadêmica para a UFPE]

% Carrega a Classe memoir e algumas opções padrão
\LoadClass[12pt,a4paper]{memoir}

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

% Formatação dos capítulos e títulos de seção
\chapterstyle{default}
\renewcommand{\printchaptername}{\chapnamefont\MakeUppercase{\chaptername}}
\renewcommand{\printchapternum}{\chapnumfont \thechapter}
\renewcommand{\afterchapternum}{\space}
\renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{#1}}

\setsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setsubsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setsubsubsecheadstyle{\normalsize\bfseries\itshape}

% Configuração de numeração de seções e capítulos
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% Espaçamento
\OnehalfSpacing

% Configuração dos nomes para Lista de Figuras e Tabelas
\renewcommand{\listfigurename}{Lista de Figuras}
\renewcommand{\listtablename}{Lista de Tabelas}

% Configuração do Sumário. Ainda necessita conferência das normas.
\setrmarg{2.55em}
\renewcommand{\cftchapterfont}{\bfseries}
\renewcommand{\cftchapterpagefont}{\bfseries}
\renewcommand{\cftsectionfont}{\bfseries}
\renewcommand{\cftsectionpagefont}{\bfseries}
\renewcommand{\cftchapterleader}{\cftdotfill{\cftchapterdotsep}}
\renewcommand{\cftchapterdotsep}{\cftdotsep}
\renewcommand{\cftsectionleader}{\cftdotfill{\cftsectiondotsep}}
\renewcommand{\cftsectiondotsep}{\cftdotsep}

% Configuração para Lista de Figuras
\renewcommand{\cftfigureleader}{\cftdotfill{\cftfiguredotsep}}
\renewcommand{\cftfiguredotsep}{\cftdotsep}

% Configuração para Lista de Tabelas
\renewcommand{\cfttableleader}{\cftdotfill{\cfttabledotsep}}
\renewcommand{\cfttabledotsep}{\cftdotsep}

\settocdepth{subsection}
\setsecnumdepth{subsubsection}
\renewcommand{\contentsname}{Sumário}

% Comandos disponíveis
\newcommand{\ufpetitle}[6]{%
	% #1: Título, #2: Autor, #3: Departamento, #4: Graduação, #5: Programa, #6: Data
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

% Comando para gerar o sumário e as listas de figuras e tabelas
\newcommand{\ufpetoc}{%
	\renewcommand{\contentsname}{Sumário}

	% Sumário
	\pagestyle{empty}
	\addcontentsline{toc}{chapter}{\contentsname}
	\begingroup
	\SingleSpacing
	\tableofcontents*
	\endgroup
	\clearpage

	% Lista de Figuras (somente se houver figuras)
	\iftotalfigures{%
		\pagestyle{empty}
		\addcontentsline{toc}{chapter}{\listfigurename}
		\begingroup
		\SingleSpacing
		\listoffigures*
		\endgroup
		\clearpage
	}{}

	% Lista de Tabelas (somente se houver tabelas)
	\iftotaltables{%
		\pagestyle{empty}
		\addcontentsline{toc}{chapter}{\listtablename}
		\begingroup
		\SingleSpacing
		\listoftables*
		\endgroup
		\clearpage
	}{}
}

\newcommand{\ufpeabstract}[4]{%
	% #1: Resumo em Português, #2: Palavras-chave, #3: Resumo em inglês, #4: Palavras-chave em inglês
	\pagestyle{empty}
	\chapter*{Resumo}
	\addcontentsline{toc}{chapter}{Resumo}
	#1

	\vspace{1cm}
	\noindent \textbf{Palavras-chave:} #2.

	\vspace{2cm}
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{Abstract}
	#3

	\vspace{1cm}
	\noindent \textbf{Keywords:} #4.
	\clearpage
}

\newcommand{\ufpestartcontent}{%
	\pagestyle{abntheadings}
	\pagenumbering{arabic}
}

\newcommand{\ufpereferences}{%
	\clearpage
	\renewcommand{\bibname}{Referências}
	\printbibliography[heading=bibintoc]
}

% Define o estilo padrão para as páginas do início do documento como sendo empty
\AtBeginDocument{%
	\pagestyle{empty}
	\pagenumbering{roman}
}

% Exemplo de uso da classe ufpe-thesis
%
% \documentclass{ufpe-thesis}
%
% % Add your bibliography file
% \addbibresource{references.bib}
%
% \begin{document}
%
% % Create the title page
% \ufpetitle{Título da Dissertação}
%          {Pedro Malta Schuler Caloête}
%          {DEPARTAMENTO DE CIÊNCIAS CONTÁBEIS E ATUARIAIS}
%          {PROGRAMA DE PÓS-GRADUAÇÃO EM CIÊNCIAS CONTÁBEIS}
%          {MESTRADO EM CIÊNCIAS CONTÁBEIS}
%          {2023}
%
% % Generate table of contents, list of figures and list of tables
% \ufpetoc
%
% % Add abstract and keywords
% \ufpeabstract{Este é o resumo da dissertação acadêmica. Deve conter entre 150 e 250 palavras, apresentando de forma concisa os objetivos, metodologia, resultados e conclusões do trabalho. O texto deve ser em parágrafo único, justificado e com espaçamento simples.}
%              {palavra1; palavra2; palavra3; palavra4; palavra5}
%              {This is the abstract of the academic thesis. It should contain between 150 and 250 words, concisely presenting the objectives, methodology, results, and conclusions of the work. The text should be in a single paragraph, justified, and with single spacing.}
%              {keyword1; keyword2; keyword3; keyword4; keyword5}
%
% % Start main content with proper page style
% \ufpestartcontent
%
% % Main content
% \chapter{Introdução}
% Este é um texto de exemplo para a introdução...
%
% % Example figure
% \begin{figure}
%   \centering
%   \rule{8cm}{6cm} % Placeholder for an image
%   \caption{Exemplo de figura}
%   \label{fig:exemplo}
% \end{figure}
%
% % Example table
% \begin{table}
%   \centering
%   \begin{tabular}{lc}
%     \toprule
%     Item & Valor \\
%     \midrule
%     A & 10 \\
%     B & 20 \\
%     \bottomrule
%   \end{tabular}
%   \caption{Exemplo de tabela}
%   \label{tab:exemplo}
% \end{table}
%
% % More chapters...
%
% % Add references
% \ufpereferences
%
% \end{document}
