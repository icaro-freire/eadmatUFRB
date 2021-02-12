%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% eadmatUFRB.cls                                                             %
%% Copyright 2020 Ícaro Vidal Freire                                         %%
%%---------------------------------------------------------------------------%%
%% 				            Este trabalho está licenciado com a                       %%
%%        Creative Commons Attribution-NonCommercial 4.0 (CC BY-NC)					     %%
%%---------------------------------------------------------------------------%%
%% Você é livre para  =======================================================%%
%%	* Compartilhar. Copie e redistribua o material em qualquer                %%
%%                 meio ou formato 															                           %%
%%	* Adaptar. Remixe, transforme e desenvolva o material.									           %%
%% Sob os seguintes termos ==================================================%%
%%  * Atribuição. Você deve dar o crédito apropriado , fornecer um link para %%
%%                a licença e indicar se foram feitas alterações . Você pode %%
%%                fazê-lo de qualquer maneira razoável, mas não de maneira   %%
%%                que	sugira que o licenciante endossa você ou seu uso.			   %%
%%	* Não Comercial. Você não pode usar o material para fins comerciais.		    %%
%%---------------------------------------------------------------------------%%
%%										Para o texto completo da licença veja:								                   %%
%%					https://creativecommons.org/licenses/by-nc/4.0/legalcode				          %%
%%---------------------------------------------------------------------------%%
%% Essa classe consiste no arquivo 'eadmatUFRB.cls' que é derivado da classe %%
%% 'exam.cls'. Diz respeito a uma classe para confecção de atividades        %%
%% avaliativas, extra-oficial, da UFRB,com cabeçalho estilizado, para o      %%
%% curso de Licenciatura em Matemática do CFP no período da Pandemia da      %%
%% COVID-19.                                																                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%==============================================================================
% Identificações Internas
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eadmatUFRB}[2021/02/11 v1.618
  'Modelo de Atividade Avaliativa para Ensino Remoto na Pandemia']
\DeclareOption*{\PassOptionsToCLass{\CurrentOptions}{exam}}
 \ProcessOptions\relax
 \LoadClass[a4paper,twoside]{exam}
%==============================================================================

%==============================================================================
% Pacotes da Classe
%==============================================================================
\RequirePackage{iftex}
  \ifPDFTeX
   \PackageError{\jobname}{Precisa de XeLaTeX}{Use XeLaTeX}
  \fi
\RequirePackage{fontspec}
  \setmainfont
  [
	  Path        = fonts/recursive/,
   Extension   = .ttf,
	  Ligatures   = TeX,
   UprightFont = *-Light,
   BoldFont    = *-SemiBold
  ]{Recursive} % _Monospace
  \newfontfamily{\intimacy}[Path = fonts/intimacy/]{intimacy}
\RequirePackage{polyglossia}
 	\setdefaultlanguage[variant = brazilian]{portuguese}
	 \setotherlanguages{english}
\RequirePackage{lipsum}
\RequirePackage{graphicx}
	 \graphicspath{{./figs/}}
\RequirePackage
  [a4paper,
   top    = 1cm,
			bottom = 1.5cm,
			outer  = 1.5cm,
			inner  = 1.5cm
  ]{geometry}
\RequirePackage[explicit]{titlesec}
\RequirePackage{amsmath, amsthm, amssymb, amscd}
  \allowdisplaybreaks
\RequirePackage{mathtools}
\RequirePackage{systeme} 
\RequirePackage{esint}
\RequirePackage{array}
  \setcounter{MaxMatrixCols}{20}
\RequirePackage{esvect}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{enumerate}
\RequirePackage[table]{xcolor}
\RequirePackage{fancybox}
\RequirePackage{setspace}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage[labelfont = bf,font = small]{caption}
\RequirePackage{units}
\RequirePackage{hyperref}
  \hypersetup
	 {%
	  colorlinks  = true,
	  linkcolor   = blue,
	  citecolor   = blue,
	  filecolor   = blue,
	  urlcolor    = blue,
	  pdfproducer = {LaTeX},
	  pdfcreator  = {XeLaTeX},
	  pdfauthor   = {Ícaro Vidal Freire (autor da classe eadmatUFRB.cls)},
	  pdfsubject  = {Template para Atividades Avaliativas}, 
	  pdfkeywords = {Atividade Avaliativa, LaTeX, Modelo de Atividade Avaliativa, Matemática, Física, Química, EaD}
	 }
%==============================================================================

%==============================================================================
% Definições Internas
%==============================================================================
\def\tituloDaLista#1{\gdef\@tituloDaLista{#1}}
\def\numeroDaLista#1{\gdef\@numeroDaLista{#1}}
\def\aluno#1{\gdef\@aluno{#1}}
\def\dataDia#1{\gdef\@dataDia{#1}}
\def\dataMes#1{\gdef\@dataMes{#1}}
%==============================================================================

%==============================================================================
% Cabeçalho
%==============================================================================
\newcommand{\titulo}
{
  \noindent
  \begin{minipage}[t][2.5cm]{1\textwidth}
   \begin{minipage}{0.26\linewidth}
    \centering
    {
     \includegraphics[width = 3.5cm]{ufrb}
    }
   \end{minipage}\hfill
   \begin{minipage}{0.74\linewidth}
    \ovalbox
    {
     \begin{minipage}{0.99\linewidth}
      $ \blacktriangleright $
      \hspace{\stretch{1}}
      \textbf 
      {
       \@tituloDaLista \phantom{/} % --------------------------> Título da Lista
      }
      \hspace{\stretch{1}}
      $ \blacktriangleleft $ 
     \end{minipage}
    } \\
    \par\vspace{-0.1cm}
    \ovalbox
    {
     \begin{minipage}{0.99\linewidth}
      \textbf{Professor: } Ícaro Vidal Freire
      \hfill 
      \textbf{Disciplina:} Variável Complexa
      \phantom{/}
     \end{minipage}
    }
    \par\vspace{.1cm}
    \ovalbox
    {
     \begin{minipage}{0.99\linewidth}
      \textbf{Curso:} Licenciatura em Matemática
      \hfill 
       8º semestre
      \phantom{/}
     \end{minipage}
    }
   \end{minipage}
   \vfill
   \ovalbox
   {
    \begin{minipage}{0.995\linewidth}
     \textbf{Aluno (a):} \@aluno \hfill \textbf{Data:}\,\@dataDia/\@dataMes/2021
    \end{minipage}
   }
  \end{minipage}
  \par
  \vspace{0.5cm}
  \begin{center}
   \begin{minipage}{\textwidth}
    \centering
    \rule[2ex]{7cm}{0.8pt}\\%
     {\Large \intimacy Atividade Avaliativa \@numeroDaLista}\\ %---> nº da lista
    \rule{7cm}{2pt}\\
    \vspace{-0.35cm}
    \rule{7cm}{0.8pt} 
   \end{minipage}
  \end{center}
  \vspace{-0.2cm}
}
%==============================================================================

%==============================================================================
% Operadores
%==============================================================================
\DeclareMathOperator{\sen}{sen}
\DeclareMathOperator{\tg}{tg}
\DeclareMathOperator{\cossec}{cossec}
\DeclareMathOperator{\cotg}{cotg}
\DeclareMathOperator{\arcsen}{arcsen}
\DeclareMathOperator{\arctg}{arctg}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\Ln}{Ln}
\DeclareMathOperator{\Arg}{Arg}
\DeclareMathOperator{\cis}{cis}
%==============================================================================

%==============================================================================
% Simbolos e Atalhos Úteis
%==============================================================================
\newcommand{\vazio}{\varnothing}%----------------------------------------------> Símbolo do Vazio
\newcommand{\dd}{\,\mathrm{d}}%------------------------------------------------> texto romano para o ``d'' das derivadas 
\newcommand{\intc}{\varointctrclockwise}%--------------------------------------> Integral para curva fechada do sentido anti-horário
\newcommand{\versor}[1]{\cdot\vec{\textbf{#1}}}%-------------------------------> vetor em negrito
\newcommand{\Cis}[1]{\cos{#1} + i\,\sen{#1}}%----------------------------------> fómula de Euler: uma outra notação
%==============================================================================

%==============================================================================
% Modificando a Classe Exam
%==============================================================================
\pointpoints{\,ponto}{\,pontos}%------------------------------------------------> muda o nome dos pontos: singular e 
%                                                                                 plural, respectivamente
\pointformat{{\bfseries\boldmath(\thepoints)}}%---------------------------------> formatação do nome ``pontos''
\qformat{\ovalbox{\bfseries Questão \thequestion}\; ({\bfseries\boldmath\thepoints})\hfill}%-----> o hfill ``quebra'' a
%                                                                                                  linha
\renewcommand{\solutiontitle}{\noindent\textbf{Solução:}\enspace}%--------------> Nome solução em ``soluções''
\SolutionEmphasis{\small}%------------------------------------------------------> Texto pequeno e em itálico na solução
\shadedsolutions%---------------------------------------------------------------> Mostra sombra na solução
\definecolor{SolutionColor}{rgb}{.95,.95,.95}%----------------------------------> Cor do ``fundo'' em soluções
% Para Configurar Anotações na Margem__________________________________________
\pagestyle{headandfoot}
\runningfootrule
\firstpagefooter{}{\thepage}{}
\runningfooter{}{\thepage}{}
%______________________________________________________________________________
%==============================================================================

%==============================================================================
% Histórico da Classe
%------------------------------------------------------------------------------
% 2020-10-02 ---> * Passei a usar `fontspec` e `poliglossia`;
%                 * Tenho preferido usar LuaLaTeX, mas está em conflito com o
%                   pacote `systeme` (para sistemas lineares). Com XeLaTeX 
%                   funciona normalmente. Ainda não descobri a razão;
%                 * Não consegui usar a variante \ECFIntimacy do pacote 
%                   `emerald`. Preciso conhecer mais o `fontspec`.
%
% 2020-10-02 ---> * Retirei o pacote `fontspec`;
%                 * Retirei o pacote `poliglossia`;
%                 * Voltei a compilar com XeLaTeX;
%                 * Com tudo isso não houve conflito com pacotes e está sem 
%                   erros;
%                 * Usei o pacote `iftex` para reconhecer apenas o XeLaTeX.
% 
% 2020-02-12 ---> * Modifiquei o `iftex` (só compilar com XeLaTeX ou LuaLaTex);
%                 * Troquei a fonte do texto para monoespaçada;
%                 * Retirei o pacote `amsfonts`;
%                 * Acrescentei o pacote `longtable`;
%                 * Acrescentei o comando \allowdisplaybreaks;
%                 * Retirei o itálido do ambiente de `soluções`;
%                 * Modifiquei o cabeçalho para melhor harmonização dos espaços.
%==============================================================================
