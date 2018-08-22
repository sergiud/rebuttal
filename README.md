# The Rebuttal Package

This LaTeX package provides means for writing journal and conference paper
rebuttals in a structured manner. The packages allows to create a master list of
referee comments and the corresponding replies, and to additionally
cross-reference the changes (i.e., additions, deletions, and changes) within the
original manuscript and the actual rebuttal letter.

## Getting Started

To use the package, simply load `rebuttal` in the document preamble as follows:

```latex
\usepackage{rebuttal}
```

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
