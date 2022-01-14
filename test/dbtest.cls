\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{dbtest}
  {2022-01-14}{1.0}{test suite for dbshow}
\LoadClass{article}
\RequirePackage{../dbshow}

\begingroup
  \makeatletter
  \@makeother\^^1b
\@firstofone{\endgroup
  \newcommand*\cl[1]{^^1b[38;5;#1m}%
  \newcommand*\bl{^^1b[38;5;255m}%
}

\msg_new:nnn { dbtest } { color } { \cl{#1} }
\def\setc#1{\msg_term:nnn { dbtest } { color } {#1}}

% #1 counter
\msg_new:nnn { dbtest } { pass } {
  \cl{10}====~Test~#1~PASS~====\bl
}
\cs_new_protected:Nn \__dbtest_pass:N {
  \msg_term:nnx { dbtest } { pass }
    { \int_use:N #1 }
}
\cs_generate_variant:Nn \__dbtest_pass:N { c }

% #1 counter
\msg_new:nnn { dbtest } { fail } {
  \cl{9}====~Test~#1~FAIL~====\\
  #2~is~required~to~be~#3~\msg_line_context:,~but~got:
}
% #1 counter #2 variable #3 value #4 show cs
\cs_new_protected:Nn \__dbtest_fail:NNnN {
  \msg_term:nnxxx { dbtest } { fail }
    { \int_use:N #1 } { \tl_to_str:n {#2} } {#3}
  #4#2\setc{255}
}
\cs_generate_variant:Nn \__dbtest_fail:NNnN { ccnc, NNxN, ccxc }

% #1 counter
\msg_new:nnn { dbtest } { test-begin } {
  \cl{11}Start~test~for~#1\bl
}
\cs_new_protected:Nn \__dbtest_begin_info:n {
  \msg_term:nnx { dbtest } { test-begin }
    { \tl_to_str:n {#1} }
}

\cs_new_protected:Nn \__dbtest_eq_int:Nn {
  \int_compare:nNnTF {#1} = {#2}
    { \__dbtest_pass:N \l__dbtest_int }
    { \__dbtest_fail:NNnN \l__dbtest_int #1 {#2} \int_show:N }
}

\cs_new_protected:Nn \__dbtest_eq_tl:Nn {
  \tl_if_eq:NnTF #1 {#2}
    { \__dbtest_pass:N \l__dbtest_int }
    { \__dbtest_fail:NNnN \l__dbtest_int #1 {#2} \tl_show:N }
}

\cs_new_protected:Nn \__dbtest_eq_str:Nn {
  \str_if_eq:VnTF #1 {#2}
    { \__dbtest_pass:N \l__dbtest_int }
    { \__dbtest_fail:NNnN \l__dbtest_int #1 {#2} \tl_show:N }
}

% #1 type #2 var #3 value
\cs_new_protected:Nn \__dbtest_eq:nNn {
  \int_incr:N \l__dbtest_int
  \use:c { __dbtest_eq_#1:Nn } #2 {#3}
}
\cs_generate_variant:Nn \__dbtest_eq:nNn { nNx }

\NewDocumentEnvironment { dbtest } { m } {
  \int_zero_new:N \l__dbtest_int
  \__dbtest_begin_info:n {#1}
  % ##1 type ##2 var ##3 value
  \DeclareDocumentCommand \dbeq { s m m m } {
    \IfValueTF {#1}
    { \__dbtest_eq:nNx {##2} ##3 {##4} }
    { \__dbtest_eq:nNn {##2} ##3 {##4} }
  }
} {}
