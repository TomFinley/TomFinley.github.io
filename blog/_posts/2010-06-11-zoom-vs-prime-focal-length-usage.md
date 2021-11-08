---
layout: post
title:  "Zoom vs. Prime: Focal Length Usage"
date:   2010-06-11T23:40
---

I recently observed an online discussion of camera lenses. People were debating
the merits of [zoom][zoom-lens] vs. [prime][prime-lens] lenses, falling into the
predictable points of flexibility vs. performance. One of those defending the
merits of prime lenses posited that if one were to plot the usage of focal
length with respect to number of photographs taken, the tendency would be for
photographs to cluster around the extremes of the focal lengths.

Since I was curious about how I would fall into this range, and decided to run
the experiment for myself. As a bit of background, I have a Digital Rebel XT
with which I use four lenses:

* [EF 28-135mm IS USM][dp-28-135] is my midrange general purpose lens. I have
  this lens mostly because when I got it in 2005, the passable EF-S midrange
  lenses did not exist yet. I believe it was the right choice for the time, but
  I can't pretend that I'd even consider it today. The 28mm is still way too
  long in a crop sensor.

* [EF 70-300mm DO US USM][dp-70-300] is my telephoto zoom. For roughly the same
  price I could have bought the [EF 100-400mm L IS USM][dp-100-400], but that
  thing is huge and conspicuous, and I wanted something I could carry everywhere
  and use without feeling self-conscious, as I'm kind of a shy guy.

* [EF-S 10-22mm USM][dp-10-22] is my wide angle. If you have a crop sensor and
  want a wide angle, it's this or nothing.

* [EF 50mm f/1.4 USM][dp-50] is my only prime. I got this a relatively short
  time ago when my baby girl was born, and I found my 28-135 utterly inadequate
  in low light. However, because it is so new, and because the purpose of this
  analysis is to see which focal lengths I used (in a prime, there's no
  choice!), it is not covered in this analysis.

With the help of a small Python script to and [EXIF.py][exifpy], I was able to
read and aggregate all of the focal lengths and lens types for a period a couple
weeks after I got the 10-22 wide lens, up until the day my daughter was born.
Naturally my photographic habits changed with both events, but between these two
events my behavior may have been stable. This covered a period of roughly two
years, with 1366 photographs. Naturally, these are just the photographs that I
did not delete.

In the following plots I give focal length on the horizontal axis, and the
number of photographs in the Y-axis in a [cumulative histogram][cumulative]. So,
pay less attention to the value of the vertical axis, and more to the size of
the jumps.

![28-135](/assets/blog/lens-28-135.png){: width=400 height=300}

We lead off with my general purpose lens. Unsurprisingly, I do have a tendency
to use the entire range of this lens. I have a slight tendency to "top off" at
around 80-100mm or so, before having a strong tendency to shoot at the maximum
135mm. The most notable and obvious trend, though, is my heavy usage of the 28mm
focal length, perhaps reflecting my frustration with the lens being too long for
its own good for my camera body.

![70-300](/assets/blog/lens-70-300.png){: width=400 height=300}

![10-22](/assets/blog/lens-10-22.png){: width=400 height=300}

Next we have the telephoto and wide angle zooms, in that order. My behavior with
these is quite different from my general purpose lens. Indeed, as posited, there
is a strong tendency to use the extreme endpoints. I like my longs long and my
wides wide, clearly. Nonetheless, I do shoot a substantial amount along the
range of both, and I do exhibit a slight tendency to shoot with my telephoto
wide (probably because I'm too lazy to swap in the general purpose lens in many
circumstances), so clearly I get substantial benefit from the zoom.

I find this quite interesting, not only for the sake of this isolated analysis,
but because it seems like there's a tremendous amount of interesting data we
could mine regarding people's photographic habits if we could just collect
everyone's EXIF tags. What do good photographers do that bad photographers
don't, or vice versa? If we multiplied aperture times ISO times shutter speed,
would the resultant value tend to decrease in summer, and increase in winter?
What if we could somehow limit the analysis to "good" photographs? It's unclear
whether any of this could be put to any practical worth, but it's still
interesting.

[zoom-lens]: http://en.wikipedia.org/wiki/Zoom_lens
[prime-lens]: http://en.wikipedia.org/wiki/Prime_lens
[dp-28-135]: http://www.the-digital-picture.com/Reviews/Canon-EF-28-135mm-f-3.5-5.6-IS-USM-Lens-Review.aspx
[dp-70-300]: http://www.the-digital-picture.com/Reviews/Canon-EF-70-300mm-f-4.5-5.6-DO-IS-USM-Lens-Review.aspx
[dp-100-400]: http://www.the-digital-picture.com/Reviews/Canon-EF-100-400mm-f-4.5-5.6-L-IS-USM-Lens-Review.aspx
[dp-10-22]: http://www.the-digital-picture.com/Reviews/Canon-EF-S-10-22mm-f-3.5-4.5-USM-Lens-Review.aspx
[dp-50]: http://www.the-digital-picture.com/Reviews/Canon-EF-50mm-f-1.4-USM-Lens-Review.aspx
[exifpy]: http://sourceforge.net/projects/exif-py/
[cumulative]: http://en.wikipedia.org/wiki/Histogram#Cumulative_histogram
