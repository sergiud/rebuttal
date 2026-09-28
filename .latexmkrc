# SPDX-FileCopyrightText: 2026 Sergiu Deitsch
# SPDX-License-Identifier: LPPL-1.3c+
#
# The index and the change history of the documentation require the styles of
# the doc package.
$makeindex = 'makeindex -s gind.ist %O -o %D %S';

add_cus_dep('glo', 'gls', 0, 'makeglossary');

sub makeglossary {
    return system("makeindex -s gglo.ist -t \"$_[0].glg\" -o \"$_[0].gls\" "
        . "\"$_[0].glo\"");
}

$clean_ext .= ' glg glo gls hd';

# vim: set ft=perl
