---
layout: post
title:  "Polaris and Epsilon Gruis"
date:   2013-04-25T21:59
---

One of my job responsibilities is [interviewing][ms-inverview] candidates.
Finding talent is a high priority so I take it seriously, but I also enjoy it
since it also gives me a chance to think about fun puzzles and problems
(algorithmic, or otherwise). However, interesting problems are by themselves not
good interview questions. Good interview questions must achieve a very delicate
and complex balance. They have to be simple enough for a person to have thoughts
within a few seconds, but multifarious enough that you get a good "image" of a
candidate's capabilities, and thought process. A question which is good or
clever might ultimately be a bad question to ask during an interview. I'm going
to write about one such problem which I rejected as it was a poor interview
question, but which I still find very interesting.

The question is this: Consider the star Polaris, the North Star. Its prominent
cultural significance notwithstanding, [Polaris ranks only 48 in apparent
brightness to us][ranking], compared with other stars. Of course, in a universe
with billions upon billions of stars, many more must seem to us less bright.
Let's consider one, incidentally named Epsilon Gruis, which just so happens to
appear only *one-fourth* as luminous as Polaris. Can you estimate for me,
please, where Epsilon Gruis ranks on that list of brightest stars?

Some may note I am using "apparent brightness" rather than "apparent magnitude."
Though the latter term is more common, my choice is deliberate since I could
hardly expect most people to be conversant on astronomical terminology, and
[apparent magnitude][apparent] seems so perverse to the uninitiated: A higher
magnitude indicates lesser brightness! Further, it is logarithmically scaled so
that if one object has magnitude one higher than a second object, the second
object appears <sup>5</sup>&radic;100 times more luminous than the first. This
definition evolved for historical and not practical reasons. When I "tested"
this on my workmates, I found we spent more time clarifying this metric, which
they as a rule quite understandably found absurd. By constructing this story
about Polaris and Epsilon Gruis (which do in fact have the properties I
describe), I remove that difficulty while retaining the essential feature of the
problem. Apparent brightness is very easy to explain, as being the amount of
energy reaching a certain area on account of that object.

So, let's see about solving it. The "one-fourth brightness" is itself a hint.
Imagine two identical bright objects. If one were twice as far away from us, we
would consider that it has brightness roughly one fourth as bright. This can be
readily apprehended by imagining an enclosing sphere. The amount of energy
(which I express as "brightness") passing out of that sphere cannot change
depending on radius, via the laws of thermodynamics. However, if we double the
radius of the enclosing sphere, we quadruple its surface area, and
correspondingly cut in one fourth the expected number of photons which would
reach a certain area of fixed size on either sphere. (In this case the "fixed
size" is a pupil, and the amount of energy reaching that pupil can be thought of
as brightness.) You can imagine degenerate cases, e.g., light is emitted with
zero beam divergence along some dimension, but it's impossible to imagine a star
would obey that.

Not all stars are identical, and have wildly varying intrinsic brightness. The
preceding "sphere" argument however posited two identical objects. The
applicability of the preceding to this situation seems questionable, but we can
abstract this away by imagining the stated problem as being composed of an
infinite number of sub-problems, where each sub-problem is identical to the full
problem, with the exception that it does not consider all stars, but only the
stars with equal intrinsic brightnesses. Obviously, with identical intrinsic
brightness for the stars in each one of these sub-problems, "distance" and
"brightness" become easily relatable once again. The original problem is just an
integration over those sub-problems. So, this detail can be safely ignored.

We only must believe that for each intrinsic brightness in these sub-problems
the local region of space is not special. This is of course taking isotropy a
bit too far &ndash; or I guess I should say a bit too close? &ndash; but this is
probably true enough for a toy problem. If we lived in the middle of a cluster
or something, more care may be required.

So, we merely have to consider the number of stars in one sphere, versus a
sphere with a radius twice as large. A radius twice as large, implies a volume
eight times as large. If we suppose stars are generally distributed in
three-dimensional space, then we'd expect there to be eight times as many stars.
Therefore we'd expect the rank of Epsilon Gruis to be 48&times;8=384.

However, while I said I resigned myself so isotropy, I lied. As anyone who has
finished grade school knows, our sun is a star in a spiral galaxy named the
Milky Way, which is easily visible in the night sky, at least, outside of
cities. So, there is a distribution in a plane rather than uniformly filling a
three dimensional space. If all observable stars (including our own) were
co-planar, the stars would not be distributed through volume, but instead across
area, as we increase radius. So, we would expect four time as many stars when we
double the radius, so the rank of Epislon Gruis would be 48&times;4=192.

Of course neither of these extremes is true; the true fractal geometry is
somewhere between two and three. If it were two we would see stars as one
brilliant line across the sky and perfect blackness elsewhere, and if it were
three there would be no obvious clumping. So what is a happy middle ground?
Because I am human, in the face of uncertainty I have a strong, nearly
overwhelming bias in favor of uniform priors, and because I am foolish I think
the average is the only summary statistic. 🙂 So, my guess is the average of 192
and 384 is 288, or 48&times;6=288. The real answer is 285. I am only three off.
🙂

That's it. I never posed this question to anyone aside from (1) coworkers, (2) a
couple interviewees that had passed the vanilla questions "early" and were keen
to hear what I described as as interesting problem, and (3) my father-in-law.
All were flummoxed even to the point of being unable to begin. The first is
especially concerning, since obviously any interview question that would lead
you to reject colleagues you value is obviously unacceptable.

[ms-interview]: http://en.wikipedia.org/wiki/Microsoft_interview
[ranking]:      http://www.atlasoftheuniverse.com/stars.html
[apparent]:     http://en.wikipedia.org/wiki/Apparent_magnitude
