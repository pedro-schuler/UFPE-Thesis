%% ======================================================================
% ufpe-article.cls - Document class for UFPE academic articles
% ======================================================================
% Classe para formatação de artigos acadêmicos segundo normas da UFPE
% Versão 1.0 - Novembro 2023
% ======================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufpe-article}[Artigo acadêmico para a UFPE]

%% ======================================================================
% CARREGAMENTO DE CLASSE BASE
% ======================================================================
% Carrega a Classe memoir com opções para artigos acadêmicos
\LoadClass[12pt,a4paper,article]{memoir}

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
\RequirePackage{booktabs}        % Melhores linhas para tabelas
\RequirePackage{caption}         % Personalização de legendas

% Pacotes para bibliografia
\RequirePackage[style=abnt,backend=biber]{biblatex}  % Formatação ABNT para referências

% Pacotes para layout e geometria
\RequirePackage{geometry}        % Configurações avançadas de geometria da página

% Pacotes para links e referências
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
\checkandfixthelayout

% Configurações de espaçamento no início do parágrafo
\setlength{\parindent}{1.25cm}

% ======================================================================
% CONFIGURAÇÃO DE CABEÇALHOS E RODAPÉS
% ======================================================================
% Define os estilos de cabeçalho e rodapé simples com numeração de página
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\thepage}
\makeevenfoot{abntheadings}{}{}{}
\makeoddfoot{abntheadings}{}{}{}

% Aplica o mesmo estilo para páginas comuns e especiais
\aliaspagestyle{plain}{abntheadings}
\aliaspagestyle{title}{empty}

% Configuração de altura do cabeçalho
\setlength{\headheight}{14.5pt}
\setlength{\headsep}{0.7cm}

% ======================================================================
% FORMATAÇÃO DE SEÇÕES E TÍTULOS
% ======================================================================
% Formatação dos títulos de seção conforme ABNT
\setsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setsubsecheadstyle{\normalsize\bfseries\MakeUppercase}
\setsubsubsecheadstyle{\normalsize\bfseries\itshape}

% Configuração de numeração de seções
\counterwithout{figure}{section}
\counterwithout{table}{section}

\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% ======================================================================
% CONFIGURAÇÃO DE ESPAÇAMENTO
% ======================================================================
%% Espaçamento 1.5 conforme normas ABNT e convenções de tipografia
%% \OnehalfSpacing
%% Espaçamento de 1.5 conforme normas ABNT e convenções do Microsoft Word
\setSingleSpace{1.5}
\SingleSpacing

% ======================================================================
% CONFIGURAÇÃO DO SUMÁRIO (TOC)
% ======================================================================
% Define título e formatação
\renewcommand{\contentsname}{SUMÁRIO}
\renewcommand{\printtoctitle}[1]{%
	\centering\textbf{\MakeUppercase{#1}}\par
	\vspace{1em}
}

% Configurações unificadas de formatação do sumário
% Fontes para entradas de seção
\renewcommand{\cftsectionfont}{\bfseries\MakeUppercase}
\renewcommand{\cftsectionpagefont}{\bfseries}
\renewcommand{\cftsubsectionfont}{\bfseries}
\renewcommand{\cftsubsectionpagefont}{\bfseries}
\renewcommand{\cftsubsubsectionfont}{\bfseries}
\renewcommand{\cftsubsubsectionpagefont}{\bfseries}

% Largura dos números de seção
\renewcommand{\cftsectionnumwidth}{2em}
\renewcommand{\cftsubsectionnumwidth}{2.5em}
\renewcommand{\cftsubsubsectionnumwidth}{3.5em}

% Remover indentação e configurar espaçamento
\setlength{\cftsectionindent}{0em}
\setlength{\cftsubsectionindent}{0em}
\setlength{\cftsubsubsectionindent}{0em}
\setlength{\cftbeforechapterskip}{0pt}

% Configurar pontos líderes (pontilhado)
\renewcommand{\cftsectionleader}{\cftdotfill{\cftsectiondotsep}}
\renewcommand{\cftsectiondotsep}{\cftdotsep}
\renewcommand{\cftsubsectionleader}{\cftdotfill{\cftsectiondotsep}}
\renewcommand{\cftsubsectiondotsep}{\cftsectiondotsep}

% Outras configurações do sumário
\setrmarg{2.55em}
\setpnumwidth{2em}
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
% VARIÁVEIS DE CONTROLE PARA VERIFICAÇÃO DE FLUXO
% ======================================================================
% Define os condicionais internos
\newif\if@tocgenerated
\@tocgeneratedfalse

\newif\if@abstractused
\@abstractusedfalse

% ======================================================================
% FUNÇÕES AUXILIARES INTERNAS
% ======================================================================
% Processa a lista de autores adicionais
\newcommand{\@processauthorlist}[2]{%
	% #1 = autor principal, #2 = lista de autores adicionais
	% Imprime o autor principal
	\vspace{2.5cm}
	{\normalsize\bfseries #1\par}

	% Define o tratamento para cada autor adicional
	\def\do##1{%
		\vspace{0.2cm}% Espaçamento mínimo entre autores
		{\normalsize\bfseries ##1\par}%
	}

	% Processa a lista de autores adicionais (se houver)
	\docsvlist{#2}
}

% Função auxiliar para cabeçalho institucional
\newcommand{\@institutiontitleheader}[3]{%
	\vspace*{0.2cm}% Espaço um pouco reduzido do padrão
	\includegraphics[width=0.3\textwidth]{UFPE-Logo.png}\par
	{\Large\bfseries UNIVERSIDADE FEDERAL DE PERNAMBUCO\par}
	\vspace{0.4cm}
	{\large\bfseries #1\par}
	{\large\bfseries #2\par}
	{\large\bfseries #3\par}
}

% Função auxiliar para rodapé da página de título
\newcommand{\@titlefooter}[1]{%
	\vfill
	\vspace{0.3cm}
	{\large RECIFE\\
		#1 \par}
}

% ======================================================================
% COMANDOS E AMBIENTES PERSONALIZADOS
% ======================================================================

% ---------------------------------------------------------------------
% Comando para página de título
% #1: Lista de autores (opcional, separados por vírgula)
% #2: Título
% #3: Autor principal (legado)
% #4: Departamento
% #5: Graduação
% #6: Disciplina
% #7: Data
% ---------------------------------------------------------------------
\newcommand{\ufpetitle}[7][]{%
	% #1: Lista de autores (opcional), #2: Título, #3: Autor principal
	% #4: Departamento, #5: Graduação, #6: Disciplina, #7: Data

	% Verificações de parâmetros obrigatórios
	\ifx\relax#2\relax
		\PackageError{ufpe-article}{Título do trabalho não fornecido}%
		{O comando \protect\ufpetitle precisa de um título como segundo parâmetro.}%
	\fi

	\ifx\relax#3\relax
		\PackageError{ufpe-article}{Nome do autor principal não fornecido}%
		{O comando \protect\ufpetitle precisa do autor principal como terceiro parâmetro.}%
	\fi

	\ifx\relax#4\relax
		\PackageError{ufpe-article}{Departamento não fornecido}%
		{O comando \protect\ufpetitle precisa do departamento como quarto parâmetro.}%
	\fi

	\thispagestyle{empty}
	\title{#2}
	\author{#3}

	% Altera a geometria da página para o título
	\newgeometry{left=2cm, right=2cm, top=1cm, bottom=2cm}

	\begin{titlingpage}
		\begin{center}
			\@institutiontitleheader{#4}{#5}{#6}

			% Título centralizado - mais espaço entre cabeçalho e título
			\vspace{2.5cm}
			{\LARGE\bfseries\MakeUppercase{\thetitle}\par}

			\ifblank{#1}{%
				% Apenas autor principal
				\vspace{2.5cm}
				{\normalsize\bfseries\theauthor\par}
			}{%
				% Se há autores adicionais, processa a lista completa
				\@processauthorlist{\theauthor}{#1}
			}

			\@titlefooter{#7}
		\end{center}
	\end{titlingpage}

	% Retorna a geometria original
	\restoregeometry
}

% ---------------------------------------------------------------------
% Comando para resumo/abstract
% #1: Resumo em Português
% #2: Palavras-chave
% #3: Resumo em inglês
% #4: Palavras-chave em inglês
% ---------------------------------------------------------------------
\newcommand{\ufpeabstract}[4]{%
	\global\@abstractusedtrue % Marca que o abstract foi utilizado (global para afetar todo o documento)

	% Verificação apenas dos parâmetros fornecidos (não do uso do comando)
	\ifx\relax#1\relax
		\PackageWarning{ufpe-article}{Texto do resumo em português não fornecido}%
		{O comando \protect\ufpeabstract foi usado mas sem texto para o resumo.}%
	\fi

	\ifx\relax#3\relax
		\PackageWarning{ufpe-article}{Texto do abstract em inglês não fornecido}%
		{O comando \protect\ufpeabstract foi usado mas sem texto para o abstract.}%
	\fi

	\thispagestyle{empty}
	\section*{Resumo}
	#1

	\vspace{1cm}
	\noindent \textbf{Palavras-chave:} #2.

	\vspace{2cm}
	\section*{Abstract}
	#3

	\vspace{1cm}
	\noindent \textbf{Keywords:} #4.
	\clearpage
}

% ---------------------------------------------------------------------
% Comando para iniciar o conteúdo principal
% ---------------------------------------------------------------------
\newcommand{\ufpestartcontent}{%
	\if@tocgenerated
		% Sumário já foi gerado, tudo certo
	\else
		\PackageInfo{ufpe-article}{Sumário não foi gerado antes do conteúdo}%
		{Normalmente usa-se \protect\ufpetoc antes de \protect\ufpestartcontent.}%
		% Gera o sumário automaticamente
		\ufpetoc
	\fi

	% Verifica de forma informativa se o resumo foi incluído
	\if@abstractused
		% Abstract foi usado, tudo certo
	\else
		\PackageInfo{ufpe-article}{Resumo/abstract não foi incluído}%
		{Embora opcional, recomenda-se incluir resumo em trabalhos acadêmicos.}%
	\fi

	\pagestyle{abntheadings}
}

% ---------------------------------------------------------------------
% Comando para gerar o sumário
% ---------------------------------------------------------------------
\newcommand{\ufpetoc}{%
	%% \aliaspagestyle{tocheadings}{empty} % Make sure TOC uses empty style
	\pagestyle{empty}
	\begingroup
	\SingleSpacing
	\tableofcontents*
	\endgroup
	\thispagestyle{empty} % Força essa página a não ter cabeçalho
	\clearpage
	\global\@tocgeneratedtrue % Marca que o sumário foi gerado (global)
}

% ---------------------------------------------------------------------
% Comando para formatar as referências
% ---------------------------------------------------------------------
\newcommand{\ufpereferences}{%
	\renewcommand{\bibname}{REFERÊNCIAS}
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
		\PackageError{ufpe-article}{ufpequotation aninhada detectada}%
		{Não é permitido aninhar ambientes de citação.}%
	}%
	\def\@inquote{true}%

	% Verifica se algum texto foi digitado antes de abrir a citação
	\ifhmode
		\par
	\fi

	\par\vspace{0.5\baselineskip}% Adiciona espaço antes
	\begin{adjustwidth}{4cm}{0cm}% Recuo de 4cm da margem esquerda
		\setlength{\parindent}{0pt}% Sem recuo de primeira linha
		\begin{Spacing}{1.0}% Espaçamento simples entre linhas usando o ambiente
			\footnotesize% Tamanho de fonte 10pt
			}{%
		\end{Spacing}%
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

% ======================================================================
% DOCUMENTAÇÃO DE USO
% ======================================================================
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
% % IMPORTANTE: Formatação do Sumário (ABNT NBR 6027)
% % 1. Seções devem usar \section{TÍTULO EM MAIÚSCULAS}
% % 2. Subseções devem usar \subsection{Título com apenas primeira letra maiúscula}
% %    Exemplo correto: \subsection{Metodologia de pesquisa}
% %    Exemplo incorreto: \subsection{Metodologia De Pesquisa} ou \subsection{METODOLOGIA DE PESQUISA}
% % 3. Subsubseções seguem a mesma regra das subseções
% %    Exemplo correto: \subsubsection{Coleta de dados}
% %    Exemplo incorreto: \subsubsection{Coleta De Dados} ou \subsubsection{COLETA DE DADOS}
% % Esta formatação é necessária para que o Sumário siga as normas ABNT corretamente.
%
% \section{INTRODUÇÃO}
% Este é um texto de exemplo para a introdução...
%
% % More sections...
%
% % Add references
% \ufpereferences
%
% \end{document}
