---
layout: page
title: Projects
---

This describes my recent major (or minor and beloved) projects, and software
that I have released for wider use.  Note that when I say "winter" I am
referring to the first three months of the year, so Winter 2005 cannot mean
December 2005.

## SVM<sup>*python*</sup> version 2

Wrote [SVM<sup>*python*</sup> version 2][svmpy] ([GitHub][svmpy-gh]), a
re-implementation of my original SVM<sup>*python*</sup>. SVM<sup>*python*</sup>
is a Python embedded version of [SVM<sup>*struct*</sup>][svm-struct]. One
applies SVM<sup>*struct*</sup> by modifying the `svm_struct_api.c` file and
recompiling. SVM<sup>*python*</sup> allows one to write these functions in
Python instead: one applies SVM<sup>*python*</sup> by creating a Python module
(commonly just a `.py` file) with the appropriate methods.  This module is
loaded and specific methods called at runtime to support the structural learning
algorithm.

One advantage of this Python embedding is this obviates many of the tedious
non-learning-related maintenance procedures, allowing one to focus purely on the
learning problem.  The two most conspicuous examples are memory management, and
reading and writing models to files (accomplished with [Pickling][pickle]).  The
primary disadvantage to using SVM<sup>*python*</sup> is that it is slower than
equivalent C code.  
*Spring 2007*

[svmpy]:      https://tomfinley-archive.github.io/SVM-Python/
[svmpy-gh]:   https://github.com/TomFinley-archive/SVM-Python/
[svm-struct]: http://svmlight.joachims.org/svm_struct.html
[pickle]:     http://docs.python.org/lib/module-pickle.html

## PyGLPK

Wrote [PyGLPK][pyglpk] ([GitHub][pyglpk-gh]), a [Python][python] module that
encapsulates the functionality of the [GNU Linear Programming Kit][glpk] (GLPK).
The GLPK allows one to specify linear programs (LPs) and mixed integer programs
(MIPs), and to solve them with either simplex, interior-point, or
branch-and-bound algorithms.  The goal of PyGLPK is to give one access to all
documented functionality of GLPK within a Pythonic (that is, non-SWIG) Python
module.  
*Spring 2007*

[pyglpk]:      https://tomfinley-archive.github.io/PyGLPK/
[pyglpk-gh]:   https://github.com/TomFinley-archive/PyGLPK/
[glpk]:        http://www.gnu.org/software/glpk/
[python]:      http://www.python.org/

## PyGraphcut

Wrote [PyGraphcut][pygraphcut] ([GitHub][pygraphcut-gh]), a [Python][python]
module that encapsulates the functionality of some of the [graph cut
code][vnk-software] from [Vladimir Kolmogorov][vnk]'s page.  My goal in writing
the code is to support my own research, which required as a sub-component an
engine to solve quadratic pseudo-Boolean optimization problems, but it may be
useful for other things.  This software is less developed than PyGLPK.  
*Spring 2007*

[pygraphcut]:    https://tomfinley-archive.github.io/PyGraphcut/
[pygraphcut-gh]: https://github.com/TomFinley-archive/PyGraphcut/
[vnk]:           https://pub.ist.ac.at/~vnk/software.html
[vnk-software]:  https://pub.ist.ac.at/~vnk/software.html

## Nexus War Pathfinder

Wrote the [Nexus War Pathfinder][nwpf], a tool for finding the shortest distance
between two points within the game [Nexus War][nw], a free browser based
massively multipler game with which I was briefly obsessed in 2006.  This game
is played on a map, and often one wants to find the shortest path between two
points.

This is, in some sense, an interesting instance of a serverless AJAX-like page,
where instead of communicating with a remote server, the page communicates with
a Java applet in page.  Unfortunately browser support for this is somewhat
"twitchy," so it only works in certain browsers.  
*Summer 2006*

[nwpf]: http://pallaspallas.googlepages.com/nwpf.html
[nw]:   http://nexuswar.com/

## SVM<sup>*latte*</sup>, A Super Secret Project

This project is so secretive I can't even talk about it.  Either that or I can't
be bothered to put anything sensible up yet.  One of the two, that's for sure.  
*Fall 2005-present*

## SVM<sup>*cluster*</sup>, Supervised Clustering with Support Vector Machines (SVMs)

Worked with [Thorsten Joachims][tj] on a supervised clustering algorithm trains
over partitionings of sets to learn a similarity measure.  This utilizes an
existing framework [SVM<sup>*struct*</sup>][svm-struct], which learn functions
with complex output spaces with SVMs.  The algorithm learn to map a set of items
to a partitioning over that set.  Our current applications include document
noun-phrase co-reference, and clustering of related news stories.  A [paper
describing this work][sc-paper] appeared at ICML 2005 and won one of the
distinguished student paper awards at that conference.

Clustering is often applied to problems where the user has a notion of the
"correct" partitioning of a set.  For example, in noun-phrase co-reference, the
goal is to group noun phrases so that the phrases that refer to the same entity
are clustered together.  This means that the user would like the clustering to
reflect an equivalence relation with a particular semantic. Among all possible
ways of partitioning a set of noun phrases (e.g. by morphological origin, genus,
etc.), a successful clustering algorithm should find clusterings that follow the
user intended semantic.

Given training examples of sets (e.g. noun phrases) and their desired
clusterings, the goal is to learn a function that predicts the clustering for
new sets. Most previous approaches reduce this problem to a learning task over
pairs of points. The idea is to learn a pair-wise similarity measure that
induces the desired clustering. However, this approach decouples learning and
clustering so that the learned similarity measure does not necessarily optimize
to clustering effectiveness. We overcome this problem by directly optimizing to
clustering effectiveness.  
*Winter 2004-Spring 2005*

[tj]: http://www.cs.cornell.edu/people/tj/
[sc-paper]: http://www.cs.cornell.edu/people/tj/publications/finley_joachims_05a.pdf

## SVM<sup>*python*</sup>

Wrote SVM<sup>*python*</sup> ([GitHub for v1][svmpy1-gh]), an extension to the
existing [SVM<sup>*struct*</sup>][svm-struct] package.  SVM<sup>*struct*</sup>
allows users to write interface functions in C to enable machine learning of
functions with complex outputs.  SVM<sup>*python*</sup> embeds [Python][python],
allowing users to write the functions in Python instead of C.  This enables more
rapid prototyping of new ideas for structured learning.

The [primary advantages][python-es] are that Python tends to be easier and
faster to code than C, less resistant to change and code reorganization, tends
to be *many* times more compact, there's no explicit memory management, and
Python's object oriented-ness means that some tedious tasks in
SVM<sup>*struct*</sup> can be easily replaced with default built in behavior.

My favorite example of this last point is that, since Python objects can be
assigned any attribute, and since many Python objects are easily serializable
with the [`pickle`][pickle] module, adding a field to the struct-model in Python
code consists of a simple assignment like `sm.foo = 5` at some point, and that's
it.  Using SVM<sup>*struct*</sup> in C, one would add a field to the relevant
struct, add an assignment, add code to write it to a model file, add code to
parse it from a model file, and then test it to make sure all these little
changes work well with each other.

The primary disadvantage to using SVM<sup>*python*</sup> is that it is slower
than equivalent C code.  For example, considering the time ***outside of SVM
optimization***, the Python implementation of multiclass classification takes 9
times the time of [SVM<sup>*multiclass*][svm-mc].  However, on this task the SVM
optimization takes about 99.5% of the time anyway, so the nine-fold increase in
that 0.5% is negligible.  Of course, other problems may have different
performance characteristics.  
*Winter 2005-Summer 2005*

[svmpy1-gh]: https://github.com/TomFinley-archive/SVM-Python/tree/v1.0.0
[python-es]: https://www.python.org/doc/essays/blurb/
[svm-mc]:    http://svmlight.joachims.org/svm_multiclass.html

## Ornithology Data Mining

Performing data mining on data from the [Project FeederWatch ornithology
survey][project-fw].  This project is a collaboration between the [Lab of
Ornithology][bird-lab] and the [CS department][cornell-cs].  In this survey,
many thousands of biologists and citizen volunteers collect bird abundance data
from all around the US and Canada.  The high-level goal of the project is to
take this raw data and to transform it into something readily accessible and
understandable by everyone to explore changes in bird abundance.  This project
is for the birds!

I am working on this project with [Mohamed Elhawary[cornell-moham] and [Daria
Sorokina][cornell-daria], under the supervision of [Mirek
Riedewald][cornell-mirek] and [Rich Caruana][cornell-richc].  The birds are
counting on us!  
*Winter 2005-Spring 2005*

[project-fw]:    http://birds.cornell.edu/pfw/
[bird-lab]:      http://birds.cornell.edu/
[cornell-cs]:    http://www.cs.cornell.edu/
[cornell-moham]: http://www.cs.cornell.edu/~hawary/
[cornell-daria]: http://www.cs.cornell.edu/~daria/
[cornell-mirek]: http://www.cs.cornell.edu/~mirek/
[cornell-richc]: http://www.cs.cornell.edu/~caruana/

## Fob

Developed [Fob][fob-gh] under the name Leaky Puppy Software.  Fob is freeware
software for Mac OS X that lets one set countdown timers.  The purpose was to
teach myself [Objective-C][objc] and the [Cocoa API][cocoa].  I was extremely
gratified when Fob [received three-and-a-half mice][macworld-gems] (July 2004)
and a later version [received four mice][macworld-gems2] (November 2004) from
[Macworld][macworld]!

The presence of presets is Fob's main gimmick for decreasing the effort required
to start a timer, and seems to be what people like most about it.  To draw an
analogy to web browsers, they are a kind of time bookmark for commonly used
timers.  For example, I may define a six minute preset to let tea steep.
Thence, I need only choose "Tea" from my preset list, and I never need deal with
a neglected lukewarm cup in my microwave again.  Starting a preset timer
requires only a single double click rather than many clicks and typing.  
*Winter-Summer 2003, minor dev. in 2004*

[fob-gh]:         https://github.com/TomFinley-archive/Fob
[objc]:           https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjectiveC/Introduction/introObjectiveC.html
[cocoa]:          https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CocoaFundamentals/Introduction/Introduction.html#//apple_ref/doc/uid/TP40002974-CH1-SW1
[macworld-gems]:  https://www.macworld.com/article/170713/julymacgems.html
[macworld-gems2]: https://www.macworld.com/article/173279/updates1.html
[macworld]:       https://www.macworld.com/

## JFLAP 4.0

Developed [JFLAP 4.0][jflap4], a new version of a visual interactive software
tool for teaching automata theory.  JFLAP lets users create structures related
to complexity theory (automata, regular expressions, grammars, L-systems) and
perform guided procedures on structures that correct mistakes students make.
JFLAP is another project of [Susan Rodger][rodger]'s.

Currently at well over 50,000 lines of beautiful code, JFLAP has the ability to
create automata (FA, NPDA, TM), grammars (context-free and unrestricted),
regular expressions, and L-systems (normal and contextual).  Once these
structures are created, one can simulate input on these structures; this
includes simulating input on automata, building LL(1) and SLR(1) parse trees for
grammars and parsing input with these trees, brute force parsing of input on
even an unrestricted grammar, and rendering L-systems.  One can also determine
various properties of structures, like if two FA are equivalent.  There is also
a suite of conversion operations like converting an NFA to a DFA, minimizing a
DFA, converting an FA or PDA to a grammar, converting an FA to an RE, converting
an RE to an NFA, converting context-free grammars to NPDA (either LR and LL),
converting a right linear grammar to an FA, and converting grammars to CNF.

One of my favorite abilities of JFLAP is the ability to "print" structures, not
so much because I like to hang them on my wall, but because by saving it as a
PDF, you can have a very pretty vector graphic of either an automata or an
L-system rendering.

For archival purposes I put my versions on [GitHub][jflap4-gh].  
*Summer 2002-Summer 2003, minor dev. to present*

[jflap4]:    http://www.cs.duke.edu/~rodger/tools/jflap/
[rodger]:    http://www.cs.duke.edu/~rodger/
[jflap4-gh]: https://github.com/TomFinley-archive/JFLAP

## JFLAP User Manual

Coauthored a [user manual][jflap-book] for [JFLAP 4.0][jflap4] with [Susan
Rodger][rodger].  I wrote 6 of the 11 chapters, including the introductory
chapters on finite automata, regular grammars, regular expressions, Turing
machines, unrestricted and context-sensitive grammars, and L-systems. Originally
published by Jones & Bartlett.  
*Spring-Fall 2003, revision through Fall 2005*

[jflap-book]: https://jflap.org/jflapbook/

## JAWAA 2.0 Editor

Developed a [JAWAA editor][jawaa-ed] for easily defining [JAWAA
animations][jwaa] in a GUI.  JAWAA (Java And Web based Algorithm Animation) is
an animation language invented by [Susan Rodger][rodger], and can be used to
visualize algorithms or just make fun animations.

For the life of me, I *cannot* figure out how to get the JAWAA applet to play
any `.anim` file once it has been defined.  
*Summer 2001*

[jawaa-ed]: https://www2.cs.duke.edu/csed/jawaa2/jawaaeditor/jawaa/DOCS/overview.html
[jawaa]:    http://www.cs.duke.edu/csed/jawaa2/
