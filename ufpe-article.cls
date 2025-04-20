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
\RequirePackage{etoolbox} % Adiciona pacote para lidar com múltiplos autores

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
\newcommand{\ufpetitle}[7][]{%
	% #1: Lista de autores (opcional, separados por vírgula), #2: Título, #3: Autor principal (legado), 
	% #4: Departamento, #5: Graduação, #6: Disciplina, #7: Data
	\thispagestyle{empty}
	\title{#2}
	\author{#3}

	% Altera a geometria da página para o título
	\newgeometry{left=2cm, right=2cm, top=2cm, bottom=2cm}

	\begin{titlingpage}
		\begin{center}
			\vspace*{0.5cm}% Reduzido de 1cm para 0.5cm
			\includegraphics[width=0.3\textwidth]{logoUFPE-Versoes.png}\par
			{\Large\bfseries UNIVERSIDADE FEDERAL DE PERNAMBUCO\par}
			\vspace{0.6cm}% Reduzido de 1cm para 0.6cm
			{\large\bfseries #4\par}
			{\large\bfseries #5\par}
			{\large\bfseries #6\par}
			\vspace{3cm}% Reduzido de 4cm para 3cm
			{\LARGE\bfseries\MakeUppercase{\thetitle}\par}

			% Calcula o espaço entre o título e os autores com base no número de autores
			\ifblank{#1}{%
				% Se nenhum autor adicional for fornecido, use apenas o autor principal
				\vspace{3cm}% Reduzido de 4cm para 3cm
				{\large\bfseries\theauthor\par}
			}{%
				% Se autores adicionais forem fornecidos
				\newcounter{authorcount}
				\setcounter{authorcount}{1} % Começa com 1 para o autor principal

				% Conta os autores adicionais
				\def\do##1{\stepcounter{authorcount}}
				\docsvlist{#1}

				% Ajusta o espaço baseado no número de autores de forma mais agressiva
				\ifnumgreater{\value{authorcount}}{1}{%
					\setlength{\dimen0}{3cm - 0.7cm * (\value{authorcount} - 1)}
					\ifdim\dimen0<1cm\setlength{\dimen0}{1cm}\fi
					\vspace{\dimen0}
				}{%
					\vspace{3cm}% Reduzido de 4cm para 3cm
				}

				% Imprime o autor principal
				{\large\bfseries\theauthor\par}

				% Imprime os autores adicionais com espaçamento reduzido
				\newcounter{authorcounter}
				\setcounter{authorcounter}{0}

				\renewcommand*{\do}[1]{%
					\stepcounter{authorcounter}%
					\ifnumless{\value{authorcounter}}{6}{%
						\ifnumgreater{\value{authorcount}}{3}{%
							\vspace{0.2cm}% Espaçamento menor quando há muitos autores
						}{%
							\vspace{0.3cm}% Espaçamento normal quando há poucos autores
						}%
						{\large\bfseries##1\par}
					}{}%
				}
				\docsvlist{#1}
			}

			\vfill
			% Adiciona espaço antes da cidade/data para melhor separação
			\vspace{0.5cm}
			{\large RECIFE\\
				#7 \par}
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
% % O primeiro argumento opcional é uma lista de autores adicionais separados por vírgulas
% \ufpetitle[Ana Silva, João Santos, Maria Oliveira]{Título do Artigo}
%          {Pedro Malta Schuler Caloête}
%          {DEPARTAMENTO DE CIÊNCIAS CONTÁBEIS E ATUARIAIS}
%          {BACHARELADO EM CIÊNCIAS CONTÁBEIS}
%          {DISCIPLINA}
%          {2023}
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
% % More sections...
%
% % Add references
% \ufpereferences
%
% \end{document}
% \end{document}
