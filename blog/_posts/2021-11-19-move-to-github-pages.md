---
layout: post
title:  "Move to GitHub Pages"
---

I am shifting my site onto [GitHub Pages][gh-pages] using Jekyll, as opposed to
a PHP-based site which I'd done for almost twenty years. At the same time, I am
taking advantage of this to shift the content and tone a bit, basically bringing
my 2010 site into 2021.

The site in its old form had the same structure and tone as it did when I was a
grad student, because I performed the [transition in 2010][old-move] hastily to
meet an unexpected and impending deadline to "move it or lose it," so so speak.
I made only minimal edits at the time, and while I did somewhat update my
biographical information, the major body of content was not touched.

## Migration from Old to New

My first goal was to get a version of my existing site building in GitHub Pages,
and stored in Git. This would not be the finished site, but it would allow me to
track all changes I did going forward.

First I migrated my software artifacts to Git. While in grad school I had kept
code artifacts in downloadable `.tgz` and `.tar.bz2.` files. I'd begun some
years ago to move some of them to Git repos and GitHub, but completed this on
the remainder by moving them into my [archive organization][archive]. The idea
of using personal organizations in this fashion I owe to [the advice of one
Andrei Cioara][org-advice].

Since my goal was to use GitHub pages, remaining web content itself I also kept
in a Git repository, first on my local machine and NAS, and then later adding
[my GitHub personal pages][tf-pages-repo], where I had the opportunity to learn
about all the nasty little ways Jekyll bundled and served locally differs from
the more restrictive page build steps performed by GitHub Pages.

On the subject of that content, I "Markdown-ified" content remaining on the
site, even the stuff I didn't intend to keep, so I could through Git commits
observe how, going forward, my site changes.

## Edits and Pruning Content

The next step once this "modern recreation" of my grad school site was created,
was to do the necessary pruning and editing to make it more modern. Basically,
since nowadays most of what I do isn't public anyway, and what little is can be
viewed on GitHub, this involves a lot of cutting or at least de-emphasizing.

That said, a fair amount could stay. My publication list just needed a few
additions. The most popular page on my site, by far, is an article I wrote when
I was a teenager on [two's complement][arch-twoscomp]. (By metrics from my old
webhost, that and another article on floating point saw more traffic than the
reset of my site combined.) My little auto-biographical blurb could be cut down
a lot, and moved to the main page.

Another thing I'll keep is this little blog. I have from time to time wanted to
talk about some technical subject I discovered that I think few people know
about or appreciate, and with this new setup that becomes a lot easier to do.
(To be honest, I don't even remember how to log into my old little blogging
site.) I do write a fair amount; I just have nowhere to put my little random
thoughts.

Obviously, I doubt anyone really cares. Do people care about my perspective on
the differences between Factorio, Satisfactory, and Dyson Sphere Program? No. Do
I still enjoy writing about it? Yes.

Going forward, who knows. I probably won't deal much with my little site here.
Since changing the site is literally quite as simple as writing a Markdown
document and pushing to GitHub, which I do all the time, there will certainly be
far less of a barrier.

## Customizing

While I used the [Minima][minima] theme, as time went on there were many
customizations (though usually based off that root scheme).

* The top navigation bar I changed so that instead of just always taking the
  `title` property, it could also take the `nav_title` property if present,
  since sometimes a full title is a bit too verbose for such a tiny space.

* Speaking of which, I added space between those navigation elements, since
  Minima just ran them altogether, resulting in a poor experience for text-only
  rendering of the site, and for screen readers.

* While you can have skins that are `dark` or `classic` (light) alongside some
  others, I added a skin that changes according to a user's system preferences,
  per [this guide on dark mode][complete-dark]. The [Minima][minima] theme made
  this quite difficult, so I basically had to reproduce their entire SCSS scheme
  to use CSS4 variables for the colors. The default mode is `classic`, but my
  hope is that it renders equally well in `dark`. (Indeed, since that is what I
  use myself, it should if anything be better.)

* My site is, understandably, not very popular or visited, with two exceptions:
  my notes pages on [two's complement][arch-twoscomp] and the [IEEE 754
  floating-point standard][arch-float]. In fact there are some direct links to
  the old locations, so I used [this advice to set up client-side
  redirects][https://superdevresources.com/redirects-jekyll-github-pages/].

* Post-list pages now have the ability to have "pinned" posts via a `priority`
  tag which, if set, can "override" the standard date ordering of posts. I also
  made it add a little 📌 icon in the case where that is used.

* Made the footer content a lot less voluminous.

## The Old Hosting Company

Speaking of which, let's talk about my old hosting company, because I think it's
kind of funny. They've been around since 1997, and it's pretty clear their
heart's no longer in it, exactly. I'm not dissatisfied with them, per se. Given
that I have no real needs I have no cause for complaints. However, given that
I'm doing a major shift anyway and no longer need anything with PHP or
databases, I decided to drop them. That said, I will describe them, because I
think it's kind of funny.

Their technology is just a touch outdated. Let's put it like this. First, let's
suppose you *try* to open the Plesk hosting control panel, version 9.2 from
2009, just to set the stage. You must first bypass a browser warning that the
SSL certificate has expired years ago. From there, operations on files involve
using a web interface that would not feel out of place in the year 2000. Each
operation is one file at a time, obviously. There is an in-browser SSH option if
you want something more sophisticated, but this is present in a frameset, which
itself contains an `applet` tag for the SSH option, which I could not get to
work even with full compatibility settings on an ancient version of Internet
Explorer. Access through FTP (not SCP, to be clear) is possible, if you pay for
a static IP address. There are, obviously, no secure options -- not even the
ability to *pay* for one, so far as I see.

This very advanced hosting, applets and all, cost $100 a year, and the domain
registration $35 per year -- these items had steadily increased over time. That
said, the cost was of secondary concerns. I certainly didn't do this work to
save $130 a year. Still, I would not say the high cost *helped*.

[gh-pages]:      https://pages.github.com/
[archive]:       https://github.com/TomFinley-archive
[org-advice]:    https://andreicioara.com/how-i-organize-my-github-repositories-ce877db2e8b6
[tf-pages-repo]: https://github.com/TomFinley/TomFinley.github.io
[minima]:        https://github.com/jekyll/minima
[complete-dark]: https://css-tricks.com/a-complete-guide-to-dark-mode-on-the-web/
[redirect]:      https://superdevresources.com/redirects-jekyll-github-pages/
[old-move]:      {% post_url /blog/2010-06-05-webpage-exile %}
[arch-twoscomp]: {% post_url /csarch-notes/2000-04-01-twoscomp %}
[arch-float]:    {% post_url /csarch-notes/2000-04-01-floating %}
