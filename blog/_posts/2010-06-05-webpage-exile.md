---
layout: post
title:  "Webpage Exile"
date:   2010-06-05T00:30
---
About one month ago, I received an unwelcome notification from Cornell's CS
department that they intended to close my account and delete the associated
data.  This was something I had expected for some time: I had defended and
graduated a year and a half prior, and I didn't expect the department to host my
account indefinitely. I'm surprised they kept on as long as they did. However,
it did present a practical problem, as Cornell still hosted my personal webpage.
A personal webpage is de rigueur for computer science graduate students, both
current and former. It's a bit weird if someone doesn't have one. Further, I do
publish some software dating from my student days which some people actually
use, so a stable website is desirable. Unfortunately the notification came at an
astonishingly bad time, as my child had been born three hours prior to the
notification (!?), so my schedule was not exactly clear. Nonetheless, I felt
obligated to move the site.

Making a new website was something I should have done earlier. I had
procrastinated partly because of the effort and cost, but actually more because
of I could not choose a hosting company. They are a vast legion of largely
indistinguishable anonymous entities. The number of services with their slight
variations in their services is bewildering, and there are so many suspicious
looking review sites to the point where objective information is hard to call
out, and nearly everyone has something bad to say about everyone. How could one
tell the good hosters from the bad? Making an informed choice seemed impossible
to the point where I did not want to decide at all.

My needs are few and my traffic quite light, but I did have some criteria: I
wanted databases, Python, Ruby, Ruby on Rails, PHP, and a hoster that did not
offer "unlimited" plans. (Seriously, who's kidding whom with that "unlimited"
nonsense?) In the end, I went with a host a friend and colleague of mine used
for his own site and recommended as reliable.

Hence, [tfinley.net][tfinley]. Owing to the aforementioned birth of my child, my
ambitions were limited: it's basically my Cornell site with the verbs attached
to my graduate student career put in the past tense, and the URLs updated. Of
course, between the parade of feedings and diaper changes, even these modest
changes took me a couple days to finalize.

## Subdomain on Localhost

When developing the site, I found it helpful to host a site on my local web
server, to make writing and debugging my site more efficient. However, I could
not work in the root directory of localhost, as I was already using this to host
some resources for my home LAN. I initially worked in a subdirectory, but this
becomes really irritating as absolute paths do not work. An <code>&lt;a
href="/page.php"&gt;</code> would mean entirely separate things locally and on
the actual website.

My solution was to add a subdomain to localhost. The address `http://localhost`
would point to my existing web server, but I added a subdomain to localhost so
that `http://tfinleynet.localhost` pointed to the directory where I was
developing the website. This allowed absolute paths to work properly. The
requisite steps are not difficult, but they are sufficiently non-obvious to the
point where others may benefit from my research. The steps are for a Mac OS X
machine.</p>

1. Add a line resembling the following to `/etc/hosts`, of course replacing
   `foo` with your desired subdomain:

   ```text
   127.0.0.1 foo.localhost
   ```

2. In `/private/etc/apache2/httpd.conf`, uncomment (remove the preceding `#`
   from) the line:

   ```text
   Include /private/etc/apache2/extra/httpd-vhosts.conf
   ```

3. Edit the file `/private/etc/apache2/extra/httpd-vhosts.conf` whose inclusion
   you just uncommented, so that the uncommented lines read as follows, again
   with `foo` replaced with your desired subdomain, and the `DocumentRoot` set
   to the desired directory.

   ```text
   NameVirtualHost *:80
   <VirtualHost *:80>
      DocumentRoot "/Library/WebServer/Documents"
      ServerName localhost
   </VirtualHost>
   <VirtualHost *:80>
       DocumentRoot "/path/to/local/development/directory"
       ServerName foo.localhost
       ErrorLog "/private/var/log/apache2/foo-error_log"
       CustomLog "/private/var/log/apache2/foo-access_log" com$
   </VirtualHost>
   ```

4. Restart Apache, most easily accomplished by unchecking and checking "web
   sharing" in the Sharing pane of system preferences.

5. Point your browser to `http://foo.localhost`, and observe the mighty
   workings.

## Favicons and Robots

Technically, [`favicon.ico`][favicon] and [`robots.txt`][robots] are optional
for a website. However, a few days with an error log containing a megabyte or so
of lines upon lines of `File does not exist: /foo/bar/biz/httpdocs/favicon.ico`
and the like are strong motivators to create them, optional or not. I am on a
shared server so I cannot reconfigure the website to [just return 404 errors for
these files][404], so I just bit the bullet and created them.

The favicon made me nervous. Sure, I was creating it just to get my error log to
shut up, but any visitor would assume I did so because I thought what I had done
was better than nothing. It's not like I'm an artist that can create something
beautiful in a sparse 256 pixels, nor yet a corporation or university with some
universally recognizable brand or logo. Nonetheless, I think I acquitted myself
adequately: I fired up the [GIMP][gimp], put a gradient in a circle, some
alpha-heavy black in an ellipse under that, and my initials in white. Boom.
Instant favicon.

For robots, I'm not too picky, so I allow everything with the following
`robots.txt` file.

```text
<pre>User-agent: *
Disallow:</pre>
```

[tfinley]: http://tfinley.net/
[favicon]: http://en.wikipedia.org/wiki/Favicon
[robots]: http://en.wikipedia.org/wiki/Robots_exclusion_standard
[gimp]: http://www.gimp.org/
[404]: http://www.trilithium.com/johan/2005/02/no-favicon/
