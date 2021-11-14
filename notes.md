---
layout: page
title: Notes
---

These are some notes I compiled mostly in my academic career, often relevant to
courses I have taken or TAed. Mostly this is slightly more mature material than
my general notes.

### [Duke CPS 104, Computer Architecture][csarch]

These are potentially useful notes for those in an introductory computer
architecture course. I compiled this while as an undergraduate TA for the Duke
course. This is actually reasonably polished.

### [Cornell CS 421, Numerical Analysis, Fall 2004][na-ugrad-notes]

These are my notes for CS 421. I am certain that these notes are *not* polished;
it seems every time I read over them, I find a few more typos, so don't expect
too much. Missing are notes from September 6 and November 12. Notes are in
LaTeX.

### [Cornell CS 421, Numerical Analysis, Cheat Sheet][na-cheat] ([GitHub][na-cheat-github])

A "cheat sheet" providing the highlights of the course on a single two-sided
sheet of paper. I also provide a source for those wishing to adapt this
document. For personal use and references, feel free to use the "cheat sheet" as
you like. However, I make no guarantees as to its accuracy. Further, it may be
helpful to come up with your own sheet rather than relying on this sheet, since
a good side effect of putting together such a sheet is that building one is an
effective way to study. In this way, it may be that the LaTeX source and its
little tricks of fitting in so much in such a small space winds up being more
helpful than the actual contents of the sheet itself!

### [Python & BLAS/LAPACK on Broken Linux][blas]

Many Linux distributions ship with faulty dynamic BLAS/LAPACK libraries. This
document describes how to fix this, from the point of view of someone using
Python so that it is able to call LAPACK routines, on a Linux distribution with
broken existing BLAS and LAPACK dynamic libraries, all from the point of view of
a non-administrative user.

{% comment %}

### [Cornell CS 478, Intro Machine Learning][ml-ugrad-notes]

I audited CS 478 in Spring 2004. I only took notes on my computer after March.
Notes are in `tex` format. These are likely in an extremely bad state.

### [Cornell CS 678, Topics in Machine Learning (Clustering)][ml-grad-notes]

I took CS 678 in Spring 2004 when the special topic was clustering. I only took
notes on my computer after March. These notes are somewhat sparse: I don't take
such detailed notes on days with prepared slides due to the faster pace. Notes
are in `tex` format.

{% endcomment %}

[csarch]:          {% link csarch_notes.md %}
[na-ugrad-notes]:  /assets/notes/cs421-notes.tar.bz2
[ml-ugrad-notes]:  /assets/notes/cs478.tar.bz2
[ml-grad-notes]:   /assets/notes/cs678.tar.bz2
[na-cheat]:        /assets/notes/cs421-cheat-sheet4.pdf
[na-cheat-github]: https://github.com/TomFinley-scratch/Cheatsheets
[blas]:            {% link notes/blas-lapack.md %}
