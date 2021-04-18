# ✍️ Latex Writing Templates

These are the files I have used as a base for all of my work in University, as
well as at work.
The templates are well suited for documents that make use of svg diagrams, code
snippets, and minimal styling.

## The inner workings of the template

The `.tex` files seen on the root of this repo are the different bases that
can be used.
`ucu-report.tex` and `ucu-brief.tex` are the two _writing_ base templates, both
oriented towards schoolwork at [my University](https://ucu.edu.uy).

In both of them you will see the space to fill in a few details:

- `\title{<++>}`, is the title of the document.
- `\newcommand{\thecurso}{<++>}`, is the course for which you are submitting
  this document.
- `\author{<++>}`, is the author or authors of the document.
- `\date{\today}`, should be the date of submission.

To use the template simply copy over the files to a new folder.

## How to use it

Feel free to modify the files as you see fit, as document
templates can (and should) vary wildly for different people and contexts.
There is nothing strange going on with how this is set-up and so adapting the
templates to your use case will be fairly straightforward.

Select what kind of document you will create (e.g. `ucu-report` or
`ucu-slides`), and copy that file over to your working directory.
Additionally, you must copy over the `prelude.sty` and `Makefile` files.
