Package dbshow
==============

Introduction
------------

The package provides four core functions:

1. data storage
2. data filtering
3. data sorting
4. data display

All data is saved once and then you can display these data with custom filters,
orders and styles. The package can be used, for example, to record and
display something you'd like to review, maybe the question you always answered
incorrectly or some forgettable knowledge. But obviously, the package is much
more powerful and extensible for more interesting tasks depending on the
individual.

Install
-------

If you are using TeX Live, install `dbshow` by `tlmgr` package manager

    tlmgr update --self --all
    tlmgr install dbshow

You can also download the zip file from
[CTAN](https://ctan.org/pkg/dbshow) or
[GitHub](https://github.com/ZhiyuanLck/dbshow/releases/latest).

The zip file should contain the file `dbshow.dtx`, and you can extract
`dbshow.sty` from it by

    tex dbshow.dtx

Compile Document
----------------

Use following commands to compile the document:

    git clone https://github.com/ZhiyuanLck/dbshow.git
    cd dbshow
    latexmk dbshow.dtx

Copyright and License
---------------------

    Copyright (C) 2022- by Changkai Li <lichangkai225@qq.com>
    --------------------------------------------------------------------------

    This work may be distributed and/or modified under the
    conditions of the LaTeX Project Public License, either
    version 1.3c of this license or (at your option) any later
    version. This version of this license is in
       http://www.latex-project.org/lppl/lppl-1-3c.txt
    and the latest version of this license is in
       http://www.latex-project.org/lppl.txt
    and version 1.3 or later is part of all distributions of
    LaTeX version 2005/12/01 or later.

    This work has the LPPL maintenance status "maintained".

    The Current Maintainer of this work is Changkai Li.

    This package consists of the file  dbshow.dtx,
                 and the derived files dbshow.pdf,
                                       dbshow.sty,
                                       dbshow.ins and
                                       README.md (this file).
