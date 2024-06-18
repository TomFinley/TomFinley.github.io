---
title: "Temperature and the Hobbit on Llama 3 8B"
---

So, I installed Hugging Face with Llama 3 8B on a fresh pipeline. My goal was to
demonstrate the effect of temperature and sampling, and the potential for
copyrighted works to be reproduced under the appropriate conditions. The idea is
to use the `text-generation` type of pipeline, with a small snippet of
well-known text, another of less well known text.

The pipeline is to complete up to 100 tokens, with varying notes on
sampling/temperature.

Since we may as well, we'll choose The Hobbit. The two snippets were chosen for
contrast in terms of how well known they are:

1. "In a hole, in the ground, there lived" and
2. "With such gloomy thoughts, followed ever by croaking crows"

That first sentence is very well known and widely written about, whereas I doubt
without context most people would even be able to identify it as being from The
Hobbit at all.

### No Sampling

First we try not sampling at all:

> In a hole, in the ground, there lived a hobbit. Not a nasty, dirty, wet hole,
> filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy
> hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and
> that means comfort. It had a perfectly round door like a porthole, painted
> green, with a shiny yellow brass knob in the exact middle. The door opened on
> to a

Excepting the omission of a paragraph break after "comfort," this is a precise
recreation of the opening of The Hobbit. Meanwhile, we reach a very different
fate:

> With such gloomy thoughts, followed ever by croaking crows, the day passed.
> The evening came, and the night, and the morning, and the day, and the night,
> and the morning, and the day, and the night, and the morning, and the day, and
> the night, and the morning, and the day, and the night, and the morning, and
> the day, and the night, and the morning, and the day, and the night, and the

This instead falls into the degenerate state where the model just loops.

Note that with sampling on and temperature at 0.001, the results were identical.

### Temperature 0.6

With a somewhat intermediate temperature, the "famous" line remains the same,
but I got this charming bit of "psalm-y" goodness. I love how it begins the fall
into the loop of "The Lord," before the temperature and sampling breaks it out.

> With such gloomy thoughts, followed ever by croaking crows,\
> And such as, with the wind, would make my heart to bow,\
> I am come to the house of the Lord, to the house of prayer;\
> I am come to the house of the Lord, to the house of prayer.\
> The Lord, the Lord, the Lord, is my Shepherd; I shall not want,\
> He maketh me to lie down in green pastures; He leadeth me beside the still
> waters;

### Temperature 1.0

So now, we finally break free of verbatim repetition. It certainly does not
represent an improvement, but it is at least new.

> In a hole, in the ground, there lived a hobbit.
>
> Not a bad little hobbit. He was clean, tidy, and always made sure he paid his
> taxes. Hobbits live by the code of the burrow, they don't usually go out, and
> never on the weekends. As part of the burrow-code, hobbits always have an
> escape plan in case of emergencies, be them dragon-induced or just your
> average every day tax audit, and a little money saved for such

> With such gloomy thoughts, followed ever by croaking crows, my attention was
> attracted in the evening to my window by the chirp and twitter of a group of
> sparrows at the end of the gutter, just below the height at which I stood, who
> were chattering their little quarrels in a more animated manner than I'd heard
> them do for some time. For a short time I watched them, though the dark was
> setting in; and I was struck with the change that had taken