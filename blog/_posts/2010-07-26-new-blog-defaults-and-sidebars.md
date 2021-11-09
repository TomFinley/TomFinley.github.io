---
layout: post
title:  "New Blog: Defaults and Sidebars"
date:   2010-07-26T22:58
latex:  true
---

This is my new blog site.

When my homepage was booted from the Cornell CS department web-servers and
forced to make its own way in the world, I quickly gave it a home with a web
hosting company. Their most basic plan offers far more capacity and features
than I would probably ever use. My website is not terribly spectacular or
sophisticated: it's a motley collection of PHP and HTML I had thrown together to
document the artifacts of my graduate career, an intentionally minimalist work
mostly describing myself and my formal projects as briefly as I thought would
do.

Nonetheless, with shiny new features and capabilities comes the temptation to
use them. I may as well; I'm paying for it. So, I set up a blog using one of my
ten allowed databases and one of my ten allowed subdomains. I already [had a
blog][firstblog] I started in May, but I wanted to maintain it all myself.
However, my reasons for wanting to do it myself were rooted in technical
interest, totally divorced from any practical considerations. Among these
practical considerations:

* I don't have time. I work and then come home to help my wife take care of a
  baby. On a good day I have one hour of strained leisure time.

* I am not really the blogging type. Many years ago while in undergrad when
  "blog" was still a novel term, I set one up only to discover I didn't have
  anything I particularly wanted to say to the world. This hasn't changed much.

* Blog software is largely database driven; this makes backups irritating to the
  point where, frankly, I probably won't bother. I'm going to regret this later
  when inevitably my webhost loses all my data. Also, given that I do not give
  much care for the "dynamic" features of a blog – comments, tracebacks, etc. –
  why not just have a series of static HTML files?

On the other hand, if one wishes to have the fun of toying with a lightweight
database driven web application, a personal blog is a fairly ideal choice:
there's minimal cost to get to something working, and it requires neither a
cohesive master plan, nor participating third parties.

Like everyone else and their dog I used WordPress, fortuitous timing as
[WordPress 3.0][wordpress] just came out. I have no idea what that means and the
release notes referenced features that meant nothing to me, but heck, 3.0 just
looks prettier than 2.9. I wanted to use WordPress primarily because I read it
was the software that integrated most easily with $\LaTeX$, good for
mathematical content. Setup is easy; their claims of a ["famous five-minute
installation"][install] are pretty much spot on. I spent more time randomly
generating passwords than I did actually installing the thing. I had only four
posts in my other blog, so transfer wasn't difficult, images being the main
annoyance.

The real problem though, and where I spent nearly all my effort, is
personalization of appearance. Sticking with the default theme seemed kind of
lame and lazy, but the [free themes][themes] available either: violated my
minimal aesthetic (though some were [quite beautiful][motion-theme]), were
poorly implemented, or shockingly wasteful of screen real estate. The sad thing
is, I really *like* the [TwentyTen default theme][twentyten-theme]. It's the
best theme by far. So, I decided to not replace it, but adapt it. (I discovered
after I had finished my adaptation that best practice requires the use of child
themes; I may refactor my changes later in my copious spare time.)

Adaptation involved a pleasing amount of futzing about in PHP files of the theme
– I say pleasing because my primary motivation was technical interest and a
desire to learn, and as I futzed about I found myself repeatedly pleasantly
surprised at WordPress's elegance and customizability. I didn't have to touch
anything outside of the theme directory.

I started with a number of modest changes: I changed the date/byline information
under each title ("Posted on July 23, 2010 by John Doe") to just contain the
date and time. Clarifying that I'm the author on every post is clearly
unnecessary. The "leave a comment" was changed to "no comments." I did not
intend to ever allow comments, so inviting them seemed odd. "Proudly powered by
WordPress" in the footer seemed a bit much, so I took out the "Proudly," though
I do think it only fair to acknowledge WordPress.

Next I made the title and description inside the image, rather than simply above
it – basically the title and description are now in a DIV with my header image
as the background, rather than having the header image be in an `img` tag. I
reproduced that leading black divider at the top of the image since I think it
looks pretty sharp.

Getting rid of the right sidebar was a priority for me. The right sidebar is a
ubiquitous feature in blogs, but I have always had a strong dislike of them. I
always found them distracting. I especially never liked how space continued to
be reserved for them below the navigational content, so space was wasted and
your content was forever oddly off center, even when the reason for that wastage
had long since been scrolled past. Also, simply wrapping around the associated
`div` produced lines which were uncomfortably long.

This took the most work, not because removing it was the problem – though
frankly it was far more trouble than it rightly should have been – but
duplicating what functionality and content I wished to present to end users
posted some small design challenges. For this I abused the header's navigational
bar. While this element is intended for the sole use of a main menu, with some
light modifications, one can continue to use the left of the bar for the menu,
and the right for some special elements, like the search box and the RSS feed.
This also gave me a chance to customize the search box, which I did by putting
the search button inside the form element a la Wikipedia or Bing. I also omitted
the login and comment RSS feeds; these were totally extraneous for my purpose.

Archives and recent posts are typically in the right sidebar, and these are
things I would like. I don't need or want a monthly archive though. I don't
actually intend to write anything most months, and I need a monthly archive,
somehow? My current solution is to just put a link to my posts under "Archive."
I'm ambivalent on this. "Recent posts" and "archive" both provide immediate
means for people to easily see what is present beyond that first post. At best,
I've moved that one click away. I'm unsure how I'll solve this, but I
emphatically do not want a right sidebar.

[firstblog]: http://pkingzombiespy.blogspot.com
[wordpress]: http://wordpress.org/
[install]: http://codex.wordpress.org/Installing_WordPress
[themes]: http://wordpress.org/extend/themes/
[motion-theme]: http://85ideas.com/public-releases/wordpress-theme-motion/
[twentyten-theme]: http://wordpress.org/extend/themes/twentyten
