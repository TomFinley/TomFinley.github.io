---
title:  "Move Steam Installed EVE on Disk on Windows"
---
Steam *generally* makes it pretty easy to move games from one location to
another. However, the story is a bit different for games that come with their
own launcher, where Steam does not give the option to "Move Install Folder." EVE
Online is one of these. I could find no guides on how to do it, so I decided to
just write up what I did.

With some modifications these steps might be applicable to other games of this
sort that Steam itself cannot move, though the step where you move the files
managed by the game itself will differ.

That out of the way, let's get to the moving procedure:

First, if you haven't already set up a library folder on the desired disk, you
can do so in Steam via "Settings &rarr; Downloads &rarr; Content Libraries
&rarr; Steam Library Folders." You have probably already done this if you're
even considering moving your folder.

From there:

1. Locate the Steam library folders in both the old location (which here we'll
   call `%OLD%`), and the desired new location (call this `%NEW%`).

2. Quit out of Steam, that is, right click on it and choose to "Exit." (Merely
   closing the Steam window won't do it, as the process is still active.)

3. You should see a file `%OLD%\steamapps\appmanifest_8500.acf`. EVE has a Steam
   app ID of `8500`. In general it is the presence or absence of these
   `appmanifest` files that controls where Steam *thinks* an application
   resides. Move that file to `%NEW%\steamapps`, and delete the old copy.

4. Copy the folder `%OLD%\steamapps\common\Eve Online` to
   `%NEW%\steamapps\common\Eve Online`. **Keep the old location where it is. We
   will delete it later.**

5. Restart Steam. If you happen to look in the game's Steam properties, under
   "Local Files" you should see it is now in the new location.

6. Start the EVE Launcher. In the EVE launcher, in the upper right corner, there
   should be a gear "Settings" icon. In the settings window, select "Tools
   /Cache", and the first entry should be for "Shared Cache" an option to
   "Move." Select that.

7. The existing shared cache location will be something like
   `%OLD%\steamapps\common\Eve Online\SharedCache`. Point it to the the
   corresponding location in `%NEW%\steamapps\common\Eve Online\SharedCache`.

8. Since we have changed both Steam and EVE's option as to the location of
   resources, it is now safe to delete `%OLD%\steamapps\common\Eve Online`.
