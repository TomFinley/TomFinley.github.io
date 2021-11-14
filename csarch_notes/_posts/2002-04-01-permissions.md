---
layout: post
title:  "Setting AFS File Permissions"
date:   2002-04-01
---

Suppose you want a TA to access your private directories.  Note that we don't
have any special permissions to access your private directories.  As users on
the acpub system we're no different from you.  If we're to have access you must
explicitly give it.

The people at OIT, in one of their brief episodes of semi-competence, installed
the Andrew file system.  This means you don't use the usual `chmod` stuff to set
read permissions, you use `fs setacl ...` etc.  For example, to give me (twf)
access to the directory `happyDirectory`, one would type:

```shell
fs setacl happyDirectory twf read
```

Note that setting access on that directory will only give me access to
`happyDirectory`, but none of its subdirectories created prior to setting access
(i.e., Any directories created within `happyDirectory` *after* access is set
will inherit access settings, but those created before shall not inherit
access).

In order to set permissions recursively through directories, one can utilize the
find command.  This, for example, will give me access to read the directory
`~/cps104` (the directory named `cps104` within your home directory) and all of
its subdirectories.

```shell
find ~/cps104 -type d -exec fs setacl {} twf read \;
```

Note that the `\;` is important... otherwise find gets confused.

In case you're one of those people that likes to know what's going on, what that
command does is the following: find recurses through a directory (in this case
`~/cps104`), and looks for files/directories that satisfy certain criteria.  In
this case, I specified only one criterion, `-type d`, which means that the file
found has to be a directory: if you leave off everything after `-type d`, what
that will do is print out every directory in `~/cps104`.  What the `-exec` flag
does is put that output to use by executing a command with each directory as an
argument: the `{}` is replaced by each satisfying file find, eh, finds.

## Notes

1. You can use `-ok` instead of `-exec`.  The `-ok` flag is just like `-exec`,
   except it prompts you for yes/no confirmation on each file before running the
   command.
2. If you want to withdraw access for a user, replace `read` with `none`.
3. Naturally, if you want to give another user access, you'd replace "twf" with
   that person's login.
4. If you named your directory something other than cps104 or put it somewhere
   other than your home directory, change `~/cps104` as is appropriate in your
   situation.

For more information on AFS on the acpub system [click here](oit). **NB: Link
broken.**

[oit]: http://www.oit.duke.edu/unix-manual/6.html
