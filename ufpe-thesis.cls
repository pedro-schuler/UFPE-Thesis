%% ======================================================================
% ufpe-article.cls - Document class for UFPE academic articles
% ======================================================================
% Classe para formatação de artigos acadêmicos segundo normas da UFPE
% Versão 1.0 - Novembro 2023
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufpe-thesis}[Tese/dissertação acadêmica para a UFPE]

%% ======================================================================
% CARREGAMENTO DE CLASSE BASE
% ======================================================================
% Carrega a Classe memoir com opções para artigos acadêmicos
\LoadClass[12pt,a4paper]{memoir}

% ======================================================================
% CARREGAMENTO DE PACOTES
% ======================================================================
% Pacotes essenciais e de compatibilidade
\RequirePackage{luatex85}        % Compatibilidade com versões antigas do LuaTeX
\RequirePackage{etoolbox}        % Ferramentas para programação em LaTeX

% Pacotes para idioma e tipografia
\RequirePackage{fontspec}        % Configuração de fontes para XeLaTeX/LuaTeX
\RequirePackage[brazilian]{babel}  % Suporte ao idioma português brasileiro
\RequirePackage{microtype}       % Melhorias tipográficas e micrométrica
\RequirePackage{indentfirst}     % Indentação no primeiro parágrafo de seções

% Pacotes matemáticos
\RequirePackage{amsmath,amssymb,mathtools}  % Suporte matemático avançado

% Pacotes para figuras e tabelas
\RequirePackage{graphicx}        % Inclusão e manipulação de imagens
%\RequirePackage{booktabs}        % Melhores linhas para tabelas
%\RequirePackage{caption}         % Personalização de legendas
\RequirePackage{tabularray}      % Melhor ambiente de tabelas
\UseTblrLibrary{booktabs}

% Pacotes para bibliografia
\RequirePackage[style=abnt,backend=biber]{biblatex}  % Formatação ABNT para referências

% Pacotes para layout e geometria
%\RequirePackage{geometry}        % Configurações avançadas de geometria da página

% Pacotes para citações
\RequirePackage{csquotes}

% Pacotes para links e referências (DEVE SER O ÚLTIMO CARREGADO)
\RequirePackage{hyperref}        % Suporte a hiperlinks e referências cruzadas

% ======================================================================
% CONFIGURAÇÃO DE FONTES
% ======================================================================
% Configura as fontes padrão conforme normas ABNT
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

% ======================================================================
% CONFIGURAÇÃO DE MARGENS E LAYOUT
% ======================================================================
% Margens de acordo com as normas ABNT
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}

% Configura o tamanho do cabeçalho antes do checkandfixthelayout
\setlength{\headheight}{14.5pt}
\setlength{\headsep}{0.7cm}

% Configura o tamanho do recuo do parágrafo
\setlength{\parindent}{1.25cm}
\checkandfixthelayout

% ======================================================================
% CONFIGURAÇÃO DE TABELAS
% ======================================================================
% Tabelas longas possuem texto de continuação em português
\DeclareTblrTemplate{contfoot-text}{default}{continua}
\DeclareTblrTemplate{conthead-text}{default}{(continuação)}

% ======================================================================
% CONFIGURAÇÃO DE CABEÇALHOS E RODAPÉS
% ======================================================================
% Define os estilos de cabeçalho e rodapé simples com numeração de página
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

% ======================================================================
% FORMATAÇÃO DE SEÇÕES E TÍTULOS
% ======================================================================
% Formatação dos títulos de seção conforme ABNT
\chapterstyle{default}
\renewcommand{\printchaptername}{\chapnamefont\MakeUppercase{\chaptername}}
\renewcommand{\printchapternum}{\chapnumfont \thechapter}
\renewcommand{\afterchapternum}{\space}
\renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{#1}}

\setsecheadstyle{\normalsize\bfseries}
\setsubsecheadstyle{\normalsize}
\setsubsubsecheadstyle{\normalsize\itshape}

% Configuração de numeração de seções e capítulos
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% ======================================================================
% CONFIGURAÇÃO DE ESPAÇAMENTO
% ======================================================================
%% Espaçamento 1.5 conforme normas ABNT e convenções de tipografia
%% \OnehalfSpacing
%% Espaçamento de 1.5 conforme normas ABNT e convenções do Microsoft Word
%\setSingleSpace{1.5}
%\SingleSpacing
\setSpacing{1.5}

% ======================================================================
% CONFIGURAÇÃO DAS LISTAS E FIGURAS
% ======================================================================
% Define título e formatação
% Configuração dos nomes para Lista de Figuras e Tabelas
\renewcommand{\listfigurename}{Lista de Figuras}
\renewcommand{\listtablename}{Lista de Tabelas}

% ======================================================================
% CONFIGURAÇÃO DO SUMÁRIO (TOC)
% ======================================================================
% Define título e formatação
\renewcommand{\contentsname}{SUMÁRIO}
\renewcommand{\printtoctitle}[1]{%
	\centering\textbf{\MakeUppercase{#1}}\par
	\vspace{1em}
}

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

% ======================================================================
% CONFIGURAÇÃO DA PÁGINA DE REFERÊNCIAS
% ======================================================================
% Redefine o estilo de cabeçalho bibliográfico para centralizar e usar maiúsculas
\defbibheading{bibintoc}[\refname]{%
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{\uppercase{#1}}
	\markboth{\uppercase{#1}}{\uppercase{#1}}%
	{\centering\textbf{\MakeUppercase{#1}}\par}
	\vspace{1em}
	\par\nobreak
}

% ======================================================================
% CONFIGURAÇÃO DE LEGENDAS
% ======================================================================
% Define o tamanho das legendas e centralização utilizando as funcionalidade do memoir.
\captionnamefont{\footnotesize\bfseries}
\captiontitlefont{\footnotesize}
\captionstyle[\centering]{} % Centraliza se couber em uma linha

% ======================================================================
% FUNÇÕES AUXILIARES INTERNAS
% ======================================================================
% Processa a lista de autores adicionais
% Comandos disponíveis

% ======================================================================
% COMANDOS E AMBIENTES PERSONALIZADOS
% ======================================================================

% ---------------------------------------------------------------------
% Comando para página de título
% ---------------------------------------------------------------------
\newcommand{\ufpetitle}[6]{%
	% #1: Título, #2: Autor, #3: Departamento, #4: Graduação, #5: Programa, #6: Data
	\thispagestyle{empty}
	\title{#1}
	\author{#2}

	% Altera a geometria da página para o título
	%	\newgeometry{left=2cm, right=2cm, top=2cm, bottom=2cm}

	\begin{titlingpage}
		% Recua 1cm para a esquerda e 0cm para a direita (ajustando a margem 3-2 para 2-2)
		\begin{adjustwidth*}{-1cm}{0cm}
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
		\end{adjustwidth*}
	\end{titlingpage}

	% Retorna a geometria original
	%\restoregeometry
	\setcounter{page}{2}
}
% ---------------------------------------------------------------------
% Comando para Folha de Rosto
% ---------------------------------------------------------------------
\newcommand{\ufpeapprovalpage}[2]{%
	% #1: Natureza do trabalho (ex: Dissertação apresentada...)
	% #2: Orientador(a)
	\clearpage
	\thispagestyle{empty}

	\begin{adjustwidth*}{-1cm}{0cm}
		\begin{center}
			{\large\bfseries\theauthor\par}
			\vspace{4cm}
			{\LARGE\bfseries\MakeUppercase{\thetitle}\par}
			\vspace{2cm}

			% ABNT exige que a natureza do trabalho seja recuada para a metade da página
			\begin{flushright}
				\begin{minipage}{0.5\textwidth}
					\SingleSpacing
					\footnotesize
					#1\par
					\vspace{1cm}
					\textbf{Orientador(a):} #2
				\end{minipage}
			\end{flushright}

			\vfill
			{\large RECIFE\\ \@date \par}
		\end{center}
	\end{adjustwidth*}
	\clearpage
}

% ---------------------------------------------------------------------
% Comando para resumo/abstract
% #1: Resumo em Português
% #2: Palavras-chave
% #3: Resumo em inglês
% #4: Palavras-chave em inglês
% ---------------------------------------------------------------------
\newcommand{\ufpeabstract}[4]{%
	% #1: Resumo em Português, #2: Palavras-chave, #3: Resumo em inglês, #4: Palavras-chave em inglês
	\thispagestyle{empty}
	\chapter*{Resumo}
	#1

	\vspace{1cm}
	\noindent \textbf{Palavras-chave:} #2.

	\clearpage

	\thispagestyle{empty}
	\chapter*{Abstract}
	#3

	\vspace{1cm}
	\noindent \textbf{Keywords:} #4.
	\clearpage
}

% ---------------------------------------------------------------------
% Comando para iniciar o conteúdo principal
% ---------------------------------------------------------------------
\newcommand{\ufpestartcontent}{%
	\clearpage
	\pagestyle{abntheadings}
	\aliaspagestyle{chapter}{abntheadings} % Garante que a 1ª pág. da Introdução tenha cabeçalho
	%\pagenumbering{arabic}
}

% ---------------------------------------------------------------------
% Comando para gerar o sumário
% ---------------------------------------------------------------------
\newif\if@tocgenerated
\@tocgeneratedfalse

\newcommand{\ufpetoc}{%
	\pagestyle{empty}

	% Sumário
	%\addcontentsline{toc}{chapter}{\contentsname}
	\begingroup
	\SingleSpacing
	\tableofcontents*
	\endgroup
	\clearpage

	% Lista de Figuras
	\iftotalfigures
		\addcontentsline{toc}{chapter}{\listfigurename}
		\begingroup
		\SingleSpacing
		\listoffigures*
		\endgroup
		\clearpage
	\fi

	% Lista de Tabelas
	\iftotaltables
		\addcontentsline{toc}{chapter}{\listtablename}
		\begingroup
		\SingleSpacing
		\listoftables*
		\endgroup
		\clearpage
	\fi
	\global\@tocgeneratedtrue
}

% ---------------------------------------------------------------------
% Comando para formatar as referências
% ---------------------------------------------------------------------
\newcommand{\ufpereferences}{%
	\clearpage
	\renewcommand{\bibname}{Referências}
	\renewcommand{\refname}{REFERÊNCIAS}
	\printbibliography[heading=bibintoc]
}

% ---------------------------------------------------------------------
% Ambiente para citações longas segundo normas da ABNT
% Esse ambiente formata citações com recuo de 4cm da margem esquerda,
% espaçamento simples entre linhas e tamanho de fonte 10pt.
% Não aplica recuo de primeira linha para manter todo o texto alinhado.
% ---------------------------------------------------------------------
\newenvironment{ufpequotation}{%
	% Verifica se não está aninhada em outra citação
	\@ifundefined{@inquote}{}{%
		\PackageError{ufpe-article}{ufpequotation aninhada detectada. Não é permitido aninhar ambientes de citação.}%
	}%
	\def\@inquote{true}%

	% Verifica se algum texto foi digitado antes de abrir a citação
	\ifhmode
		\par
	\fi

	\par\vspace{0.5\baselineskip}% Adiciona espaço antes
	\begin{adjustwidth}{4cm}{0cm}% Recuo de 4cm da margem esquerda
		\setlength{\parindent}{0pt}% Sem recuo de primeira linha
		\begin{SingleSpace}% Espaçamento simples entre linhas usando o ambiente
			\footnotesize% Tamanho de fonte 10pt
			}{%
		\end{SingleSpace}%
	\end{adjustwidth}%
	\par\vspace{0.5\baselineskip}% Adiciona espaço depois
	\let\@inquote\relax % Limpa a flag
}

% ---------------------------------------------------------------------
% Comando alternativo para citações longas
% Uso: \ufpequote{Texto da citação}
% ---------------------------------------------------------------------
\newcommand{\ufpequote}[1]{%
	\begin{ufpequotation}
		#1
	\end{ufpequotation}
}

% Define o estilo padrão para as páginas do início do documento como sendo empty
\AtBeginDocument{%
	\pagestyle{empty}
	\aliaspagestyle{chapter}{empty} % Mascara a numeração nas primeiras páginas do sumário e listas
	\pagenumbering{arabic}
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
