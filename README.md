# The Game of Life, but in reverse !

## Can we go back in time with the Game of life ?
The response is yes, but probably not in a single piece and with an infinite amount of energy, so not exactly like in Star Trek.

Joke apart, the [Game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) is a mathematical amusement sufficiently well known to avoid me to write a story about it. Long story short, it's fully deterministic in a forward way with ultra simple rules, but guessing a configuration in backward is nearly impossible as those simple rules destroy information at each algorithm step. Or nearly, as it is always possible to try any previous combination of dead and living cells until the next step is the configuration you wish (aka stupid brute force method).

Mathematics are however ruthless and the configuration space becomes rapidely impossible to explore if the map size and/or the number of backward steps is big enough. The problem is higly discrete, with a huge number of dimensions, but fairly simple from an algorithm point of view. This is a perfect problem for a class of algorithm that eats dimensions for the breakfast and break any discrete problem without pain (or near): the [genetic algorithms](https://en.wikipedia.org/wiki/Genetic_algorithm).

The game here is simple: start from a binary image (configuration in the future) and guess what could be the starting configuration back in time that can lead to this. Genetic algorithms works like daddy and mommy during [meiosis](https://en.wikipedia.org/wiki/Meiosis): the problem is transform in DNA strands with genes (here 0 and 1), these strands are crossed and mutated to produce the DNA of children, the phenotype of these children is expressed as a fitness (here, do the desired configuration appears after some steps of Game of Life), and finally the most performing children are allowed to contribute to the next generations. The less performing ones are of course allowed to do politics or become Discord moderators, we are not beasts after all.

As genetic algorithm and the Game of Life are bioinspired, it's a bit like a Game of Life within the Game of life, sadly the concept has [already been taken](https://www.youtube.com/watch?v=xP5-iIeKXE8). To my knowledge, this approach was never tried.

## How does it works ?
- draw the future configuration in binary with paint for example, set the number of backward steps and run the code;
- see the magic happening. You can take a walk outside, it's long to converge;
- run the script to animate all that shit and impress your friends on Reddit with the work of others.

It's all that simple ! The code is stupidely short and simple but should noticeably contribute to global warming thanks to its sluggish convergence. It is a quite reliable way to produce entropy, like the Bitcoin, but without the crumbs.

## Example of result (with 25 steps backward in time)

**Starting configuration to guess**


**Algorithm convergence***


**End result**
