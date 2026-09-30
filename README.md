<!--
SPDX-FileCopyrightText: 2026 Sergiu Deitsch
SPDX-License-Identifier: LPPL-1.3c+
-->

# Structured Rebuttals in LaTeX

[![TeXLive](https://github.com/sergiud/rebuttal/actions/workflows/texlive.yml/badge.svg)](https://github.com/sergiud/rebuttal/actions/workflows/texlive.yml)

The `rebuttal` LaTeX package provides markup for writing structured rebuttals to
journal and conference paper reviews.

## Features

* Creation of a master list of referee comments and the corresponding replies
* Cross-referencing of additions, deletions, and changes between the revised
  manuscript and the rebuttal letter

## Getting Started

To use the package, simply load `rebuttal` in the document preamble as follows:

```latex
\usepackage{rebuttal}
```

Please refer to the
[letter](https://github.com/sergiud/rebuttal/blob/2e8839440c55e23de8dd05a7c0a0cef6f15ce23e/examples/letter.tex#L1)
example for the necessary preamble setup.

Afterwards, structure the rebuttal using one or more `rebuttal` environments.

## Usage

A well-structured rebuttal typically consists of the following parts:

1. a master list of referee comments and the authors' replies, and
2. clearly highlighted changes to the manuscript that stem from reviewers'
   comments.

The following sections provide an overview of the package's functionality,
which helps authors produce the above content consistently.

### Structuring the Rebuttal

The `rebuttal` environment can contain several blocks that refer to comments by
the editor or by specific reviewers along with the corresponding replies. The
environment accepts an optional title and is expected to contain pairs of
`comment` and `answer` environments. The general layout is as follows:

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

### Annotating Changes to the Manuscript

Within the manuscript, three commands denote additions, deletions, and changes:
`\addition`, `\deletion`, and `\change`. While `\addition` and `\deletion`
expect a single argument, `\change` expects two arguments. The first one denotes
the original text and the second one the new text.

The optional `label` option assigns a label to the annotation for referencing
it. The `ref` option refers back to the original reviewer comment.

### Annotating Floats, Captions, and Titles

Annotations can be used in figures, tables, their captions, table cells,
minipages, footnotes, and section titles. Since margin notes are not available
within floats and boxes, the annotation label is typeset inline right after the
annotated text instead:

```latex
\begin{figure}
  \centering
  \includegraphics{result}
  \caption{Reconstruction \addition[ref=c:c1]{of the phantom}.}
\end{figure}
```

The `inline` option forces inline labels everywhere.

### Annotating Multiple Paragraphs

In addition to the markup commands, the package defines equivalent environments
for annotating multiple paragraphs:

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

### Referencing Multiple Changes

The `ref` option of the markup commands may specify multiple labels:

```latex
\addition[label=a:new,ref={c:c1,c:c2}]{new text}.
```

## License

The `rebuttal` package is distributed under the [LaTeX Project Public
License 1.3c](https://ctan.org/license/lppl1.3c) or later.
