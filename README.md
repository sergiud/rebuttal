# Structured Rebuttals in LaTeX

[![TeXLive](https://github.com/sergiud/rebuttal/actions/workflows/texlive.yml/badge.svg)](https://github.com/sergiud/rebuttal/actions/workflows/texlive.yml)

The rebuttal LaTeX package provides means for writing structured journal and
conference paper rebuttals.

## Features

* Creation of a master list of referee comments and the corresponding replies
* Support for cross-referencing the changes (i.e., additions, deletions, and
  changes) within the original manuscript and the rebuttal letter

## Getting Started

To use the package, simply load `rebuttal` in the document preamble as follows:

```latex
\usepackage{rebuttal}
```

Also make sure the `xcolor` package has been loaded using the following options:

* `dvipsnames`
* `svgnames`
* `x11names`

Afterwards, you can structure the rebuttal using (multiple) `rebuttal` environment(s).

The `rebuttal` environment can contain several blocks that refer to editor's or
specific reviewers' comments and your replies to referees' comments.
Specifically, the `rebuttal` environment is expected to contain a `comment` and
an `answer` environment. The general layout looks as follows:

```latex
\begin{rebuttal}[Editor's Comments]
  \begin{comment}
    % Reviewer's comment
  \end{comment}
  \begin{answer}
    % The reply
  \end{answer}
\end{rebuttal}
```

Within the manuscript, three main commands can be used to denote additions,
deletions, or changes. The corresponding commands are `\addition`, `\deletion`,
and `\change`. All three commands require specifying their labels for
referencing the modifications using the `label` option. Additionally, the `ref`
option back references the original reviewer comment. While `\addition` and
`\deletion` require a single argument. `\change` expects two arguments, where
the first one denotes the changed text, and the second one the new text.

Additionally to the provided markup commands, the package also defines
equivalent environments for annotation of multiple paragraphs:

```latex
\begin{additionenv}[label=a:par,ref=c:missing-motivations]
  \section{New Experiment}
  % new text
\end{additionenv}

\begin{changeenv}[label=ch:par,ref=c:missing-motivations]{old text}
  \section{Improved Experiment}
  % new text
\end{changeenv}

\begin{deletionenv}[label=d:par,ref=c:missing-motivations]
  \section{Useless Discussion}
  % old text
\end{deletionenv}
```

The `ref` option provided by markup commands may specify multiple labels:

```latex
\addition[label=a:new,ref={c:c1,c:c2}]{new text}.
```

## Limitations

* Rebuttal markup cannot be used within floating environments such as `figure`
  and `table`, and the `\caption` command.
