%==============================================================================
% Identificações Internas
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eadmatUFRB}[2020/10/02 v1.61
   'Modelo de Atividade Avaliativa para Ensino Remoto na Pandemia']
\DeclareOption*{\PassOptionsToCLass{\CurrentOptions}{exam}}
 \ProcessOptions\relax
 \LoadClass[a4paper,twoside]{exam}
%==============================================================================

%==============================================================================
% Pacotes da Classe
%==============================================================================
\RequirePackage{gfsartemisia-euler}
%\RequirePackage{emerald} % Implementar com fontspec
\RequirePackage{fontspec}
   \setmainfont{GFS Artemisia}
	% \newfontfamily\ECFIntimacy{emerald}
\RequirePackage{polyglossia}
   \setdefaultlanguage[variant = brazilian]{portuguese}
\RequirePackage{lipsum}
\RequirePackage{graphicx}
	 \graphicspath{{./figs/}}
\RequirePackage[a4paper,
                top    = 1cm,
								bottom = 1.5cm,
								outer  = 1.5cm,
								inner  = 1.5cm]{geometry}
\RequirePackage[explicit]{titlesec}
\RequirePackage{amsmath, amsthm, amsfonts, amssymb, amscd}
\RequirePackage{mathtools}
%\RequirePackage{systeme} % Caso use, compilar apenas com XeLaTeX (conflito com LuaTeX)
\RequirePackage{esint}
\RequirePackage{array}
   \setcounter{MaxMatrixCols}{20}
\RequirePackage{esvect}
\RequirePackage{booktabs}
\RequirePackage{enumerate}
\RequirePackage[table]{xcolor}
\RequirePackage{fancybox}
\RequirePackage{setspace}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage[labelfont = bf, 
                font      = small]{caption}
\RequirePackage{hyperref}
   \hypersetup
	 {%
	   colorlinks  = true,
	   linkcolor   = blue,
	   citecolor   = blue,
	   filecolor   = blue,
	   urlcolor    = blue,
	   pdfproducer = {pdfTeX},
	   pdfcreator  = {LaTeX},
	   pdfauthor   = {Ícaro Vidal Freire (autor da classe eadmatUFRB.cls)},
	   pdfsubject  = {Template para Atividades Avaliativas}, 
	   pdfkeywords = {Atividade Avaliativa, LaTeX, Modelo de Atividade Avaliativa, Matemática, Física, Química, EaD}
	 }
%==============================================================================

%==============================================================================
% Definições Internas
%==============================================================================
\def\TituloDaLista#1{\gdef\@TituloDaLista{#1}}
\def\NumeroDaLista#1{\gdef\@NumeroDaLista{#1}}
\def\Aluno#1{\gdef\@Aluno{#1}}
\def\DataDia#1{\gdef\@DataDia{#1}}
\def\DataMes#1{\gdef\@DataMes{#1}}
%==============================================================================

%==============================================================================
% Cabeçalho
%==============================================================================
\newcommand{\titulo}{\noindent
	\begin{minipage}[t][2.5cm]{1\textwidth}%
		\begin{minipage}{0.25\linewidth}%
			\centering{\includegraphics[width=3.5cm]{ufrb}}
		\end{minipage}
		\hfill
		\begin{minipage}{0.74\linewidth}%
			\ovalbox{%
				\begin{minipage}{0.99\linewidth}%
					$\blacktriangleright$\hspace{\stretch{1}}\textbf{\large{\@TituloDaLista}}\hspace{\stretch{1}$\blacktriangleleft$}
				\end{minipage}
			}\\
			\par\vspace{-0.1cm}
			\ovalbox{%
				\begin{minipage}{0.99\linewidth}%
					\textbf{Professor:} Ícaro Vidal Freire \hfill \textbf{Disciplina:} \textsc{simplex (2020)}\, 
				\end{minipage}
			}
			\par\vspace{0.1cm}
			\ovalbox{%
				\begin{minipage}{0.99\linewidth}%
					\rule{0pt}{9pt} \textbf{Curso:} {Licenciatura em Matemática} \hfill ${8}^{\circ}$ semestre \,
				\end{minipage}
			}
		\end{minipage}
		\vfill
		\ovalbox{%
			\begin{minipage}{0.995\linewidth}%
				\textbf{Aluno (a):} \emph{\@Aluno} \hfill \textbf{Data: }\@DataDia/\@DataMes/2020 \,
			\end{minipage}
		}
	\end{minipage}
	\par
	\vspace{0.2cm}

	\begin{center}
		\begin{minipage}{\textwidth}%
			\centering
				\rule[0.8ex]{7.5cm}{0.8pt}\\
				  \LARGE
					{
					 \bfseries
					  {
						  Atividade Avaliativa \@NumeroDaLista % Lembrar de modificar
						}
					}\\
				\rule[0.2cm]{7.5cm}{2pt}\\
				\vspace{-0.85cm}
				\rule{7.5cm}{0.8pt}\\
				\vspace{0.2cm} 
		\end{minipage}
	\end{center}
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
\newcommand{\vazio}{\varnothing}%-----------------------------------------------> Símbolo do Vazio
\newcommand{\dd}{\,\mathrm{d}}%-------------------------------------------------> texto romano para o ``d'' das derivadas 
\newcommand{\intc}{\varointctrclockwise}%-----------------------------> Integral para curva fechada do sentido anti-horário
\newcommand{\Resp}[1]{\hfill {\footnotesize\textbf{Resp.}:\;\,#1}}%-------------> Coloca ``Resposta'' no final de cada item.
\newcommand{\versor}[1]{\cdot\vec{\textbf{#1}}}%--------------------------------> vetor em negrito
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
\SolutionEmphasis{\itshape\small}%----------------------------------------------> Texto pequeno e em itálico na solução
\shadedsolutions%---------------------------------------------------------------> Mostra sombra na solução
\definecolor{SolutionColor}{rgb}{.95,.95,.95}%----------------------------------> Cor do ``fundo'' em soluções
% Para Configurar Anotações na Margem__________________________________________
\pagestyle{headandfoot}
\runningfootrule
\firstpagefooter{}{\thepage}{}
\runningfooter{}{\thepage}{}
%______________________________________________________________________________
%==============================================================================