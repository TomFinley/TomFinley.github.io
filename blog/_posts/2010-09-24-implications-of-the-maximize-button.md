---
layout: post
title:  "The Implications of the Maximize Button"
date:   2010-09-24T23:20
---

The maximize button in the Microsoft Windows UI is interesting. While I had
obviously been aware that Windows had such an interface idiom, it was not until
I'd been required to use Windows in my daily work, used Windows programs day in
and day out, and seen the developer culture at Microsoft, that I began to
appreciate its profound impact on application design and developer psychology.
The fact that there is a button devoted to every window to allow it to take up
the entire screen very far from being the ancillary detail. In many respects its
presence (or absence) encapsulates the entire philosophy underlining application
design on the platform, as well as shape the behavior of users.

In the interest of presenting a counterpoint, I will contrast Windows against
the Mac OS interface. I choose Mac OS because it differs on this important
aspect. None of the Linux UIs are considered because this is a discussion of UI
philosophy; the design of Gnome and other desktop environments or window
managers was not really driven by any sort of cohesive unifying UI philosophy at
all, beyond "imitate Windows."

So, let's begin. Humans perform tasks best when free of distractions. A computer
interface should let a user focus solely on his workspace. This is an
uncontroversial statement everyone can agree with. The next step is the
branching step where there is disagreement: If we suppose "workspace" and
"window" are identical, then a maximization button makes sense; all other
content is extraneous ex hypothesi, and unused space is wasted space. If we
suppose a workspace can consist of multiple windows probably from multiple
applications, then a maximization button does not make sense; it is harmful
because it hides portions of the workspace.

The presence of such a button in turn informs much of application design. There
are practical and psychological consequences for maximizing, or not maximizing.

The consequence for maximizing: The mental cost of switching to another
application context is high, especially if that application is yet another
maximized application. There is nothing visually connecting one world to the
other. There is therefore pressure to engineer applications so that all tasks
related to a user's workflow can be accomplished within the context of a
**single application**. The workflow is **integrated**.

For not maximizing: When workflow is spread out among multiple applications,
there is not a pressure to make any individual program do everything, but there
is more pressure to make applications play well with each other. Completing
complex tasks requires not one application, but an **ensemble of applications**.
(This bears a strong resemblance to the Unix philosophy of small tools with
simple interfaces.) The workflow places value in **interoperable** applications.

Now, on Windows there are definitely small tools, and on Mac there are
definitely all in one applications (increasingly and especially those tools made
by Apple itself, the recent phenomenon of the so called Apple ecosystem) but
there is a definite idiomatic preference for one type of tool or the other.

I'm going to use making a presentation as an example. On Windows the favored
tool for making presentations is PowerPoint, and on the Mac it is Keynote.
Keynote embodies this "Mac" philosophy of interoperable applications very
clearly. Keynote's native diagraming tools are, to put it kindly, minimal; but
no matter, because one can simply insert diagrams made with
[OmniGraffle][omnigraffle]. Neither of these two tools tries to do what the
other does – at least not in any meaningful way – nor are they especially aware
of each other, but Keynote plays well with graphics produced by other programs.
The result is that you can easily produce excellent diagrams in an excellent
presentation, despite the fact that both of the involved tools are only
excellent at one of those tasks, and minimal or nonfunctional with respect to
the other task.

In contrast, PowerPoint, despite having superior native diagramming utilities,
plays very poorly with external content. For example, it insists on rasterizing
PDFs and other types of vector graphics. If I do the same exercise – copy and
paste an OmniGraffle vector graphic into Mac PowerPoint 2008 – it rasterizes the
diagram into a badly pixelated graphic with glaring compression artifacts. Why,
PowerPoint, why? Windows PowerPoint plays well with Visio, but only on account
of special effort between the two programs specifically, as they are part of the
same "Office" platform and significant special effort was spent towards making
those two programs interoperable between themselves, but without increasing
their general interoperability.

On the other hand, often the integrated way has some really strong benefits. As
someone whose work involves a fair amount of mathematics, my presentations are
rather heavy on equations. Keynote has no equation editing capabilities. The
preferred solution is to use a third party utility like [LaTeXiT][latexit].
However, as good as that program is (and it is quite excellent considering the
constraints in which it is forced to operate), the overall experience is
painfully awkward. Equations don't even reflow in Keynote, because they're
considered floating graphics; if you have some equations "inline" with your
text, you have to put spaces in the text and put the equation in the gap. If you
add some text anywhere that moves your existing text, you have to readjust the
equations. Further, because they're simply graphics, they don't change with,
say, themes. (Not that I like themes, for those that do, but it would be nice if
resetting the theme was at least possible without having to reset each and every
equation, like these are the old days of the letterpress where we are dealing
with movable type or something.) The whole experience is pretty awful. The
method can't really compare in ease of use to the general Office (including
PowerPoint's) method of hitting Win-Equals, typing your equation, and being done
with it.

That said, the Keynote-LaTeXiT approach does have one very important advantage.
Long hard-won experience has made my ability to type LaTeX equations reflexive.
For example, in my numerical analysis course in grad school, I typed notes
involving some fairly aggressive and visually complex equations as quickly as
the professor was able to write them on the board. A LaTeX based solution allows
me to draw upon substantial experience to perform a novel task. Moreover, I
could use the same macros and special style I had developed for my academic
papers in my presentations. The integrated equation editor in PowerPoint, while
it does happen to respect a subset of LaTeX syntax for simple symbols, is
otherwise a totally unfamiliar environment.

There is a larger point: the integrated solution has the flaw that identical
subtasks within different containing tasks are often accomplished in completely
different and unfamiliar ways. So, if your workflow involves various
combinations of <var>n</var> subtasks, you might not have to learn <var>n</var>
different ways of doing things as in the interoperable world, but rather as many
as 2<sup><var>n</var></sup> or <var>n</var>!, depending on how tolerant the
applications are of reordering of subtasks.

The dual of this from the developer's perspective is that large chunks of
development effort are bent towards simply duplicating functionality that exists
elsewhere. This is inefficient; that effort could be spent making the core
functionality of the program's special functionality really efficient and
excellently engineered. This pressure on the developer is increased by users of
the platform, who are used to integrated solutions and demand them.

To phrase the argument slightly differently, the integrated approach, with its
expectation that an application handle not only one task, but all tasks
ancillary to that task, leads to lousy software. A single developers will do
different things with varying competence and enthusiasm. For example, there are
few languages (programming or formatting) that are content in their Windows
distributions to be mere languages; they typically feel the need to bundle a
specialized editor with them. I am thinking particularly of LaTeX distributions
(which nearly always bundle an editor and viewer), and some programming
languages (Python's bundling of IDLE, the so-called Python IDE, far more
prominent on Windows than on any other platform). Of course, the effort spent
towards making an entirely brand new editor was effort that could have been
spent towards improving the support of existing familiar general-purpose editors
for that particular language.

Naturally, the counter argument is there is some functionality would have been
difficult or impossible to achieve in existing editors, and can be accomplished
by starting fresh with an integrated special purpose editor. However, for the
user of these tools, they use these specialized advances at the cost of using an
editor which is lousy at its primary function. It is rare that it is worth
giving up the ability to actually edit stuff properly only on the strength of
one or two clever gimmicks.

In the integrated world, because tasks are expected to take place within a
single program or application, there is less pressure to make applications
interoperable. This bias towards not allowing interoperability occurs even in
places where it would be a really fantastic idea, and not hard at all to
integrate.

For example, in OS X when you drag a file into a save dialog in any other
application (e.g., I drag a file from the Finder, or from the icon in the title
bar of a Window), the save dialog moves to the corresponding folder. Very
simple, and very useful; often the place you want to save a file is exactly the
folder where you are working in some other application. On a related note, if
you drag a file to the Terminal, then you get the path of that file; this is
fantastically useful as well. Also, there is the near non-existence of modal
dialog boxes on the Mac, compared to Windows where modal dialog boxes are the
norm – preventing a user from moving on to other tasks is far more poisonous and
annoying in an interoperable environment than an integrated environment. These
are really tiny petty things, but a truckload of tiny petty things adds up.

What is somewhat interesting is that the Mac platform is changing. Apple has in
the last decade or so taken to making "integrated" applications. Consider iMovie
and iPhoto, which support the entire workflow of viewing, categorizing, editing,
exporting, and publishing either movies or photos, respectively. Perhaps this is
a symptom of their growing success; as a developer grows more popular, the
temptation to control every aspect of a task must become overwhelming.
Naturally, in these applications, the "zoom" button (the green plus) acts like a
maximize button.

[latexit]:     http://pierre.chachatelier.fr/programmation/latexit_en.php
[omnigraffle]: http://en.wikipedia.org/wiki/OmniGraffle
