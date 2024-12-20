# The Game of Life, but backward in time !

## But first, can we go back in time with the Game of life ?
The response is yes, but with sweat and blood. And the result is not (and can't be) perfect most of the time.

The [Game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) is a mathematical amusement sufficiently well known to avoid me to write a story about it. Long story short, it's fully deterministic in a forward way with ultra simple rules, but guessing a configuration in backward is surprisingly difficult as those same simple rules destroy information at each step. It is of course always possible to go back in time by trying randomly any possible combination of dead and living cells until the next step matches the configuration you wish, method known as dumb brute force method (or Monté Carlo if you want to sound more sophisticated).

Mathematics are however ruthless and the configuration space is incredibly vaste to explore if the map size and/or the number of backward steps is large enough. The problem is higly discrete, with a huge number of dimensions, but fairly simple from an algorithm point of view. This is a perfect problem for a class of algorithm that solves high dimensions / discrete problems without pain (or near): the [genetic algorithms](https://en.wikipedia.org/wiki/Genetic_algorithm).

The game here is simple: try to match a binary image (configuration in the future) with starting binary configurations from the past, but the smart ass way. We will not explore all possibilities in brute force but mimick Mother Nature and the laws of evolution with sexual reproduction. Genetic algorithms works like daddy and mommy during [meiosis](https://en.wikipedia.org/wiki/Meiosis): each binary starting configuration is turned into DNA strands with genes (here 0 and 1 of the configuration in the past), these strands (in fact vectors but who cares) are crossed and mutated to produce the DNA of children, the phenotype of these children is expressed as a fitness in the present (here, do the obtained final configuration matches the target image after some pre-defined steps of Game of Life), and finally the most performing children are allowed to contribute to the pool of DNA of the next generations, like in real life. The less performing individuals will become MMORPG players or Discord moderators, ensuring they will have no descendance.

As genetic algorithm and the Game of Life are bioinspired, it's a bit like a Game of Life within the Game of life, sadly the concept has [already been taken](https://www.youtube.com/watch?v=xP5-iIeKXE8). In the other hand, to my knowledge, coupling Genetic Algorithm with Game of Life was never tried with success.

## Requirements
- Matlab R2023b with Parallel Computing toolbox or higher

GNU Octave is just not able to handle that problem (it stays busy at the first step), sorry if you can't afford the Matlab licence.

## How does it works ?
- draw a future configuration in binary with MS paint for example (it has to be a high tech drawing software), set the number of backward steps and run the code;
- see the magic happening. You can take a walk outside and see some friends if you have some, it's long to converge. The more the present shape to mimic is close to Game of Life usual patterns, the better it will work. The end solution could even be exact in some cases (real present), but generally only an alternative present is found;
- run the post processing script to animate all that shit and impress your virtual friends on Reddit with the work of others. Don't be shy, attribute this to yourself, I won't harass you online.

It's all that simple ! The code is stupidely short and simple but should noticeably contribute to global warming thanks to its sluggish convergence. It is also quite a reliable way to produce entropy, like the Bitcoin, but without the crumbs at the end. I voluntarily used the kind of aggresive Matlab syntax that solves enormous matrix-based problems within a single line of code because I like to impress people. Of course the code is not commented to stay as cryptic as possible as 99% of stuff on Github.

## Example of result (with 25 steps backward in time)

**Present configuration to target from the past**

![](/Images/Target_big.png)

**Genetic Algorithm convergence during around 100,000 steps**

![](/Images/Topology.gif)

**Best initial configuration found in the past**

![](/Images/Best_start.png)

The best initial configuration is surprisingly boring and random. Most of the cells will die immediately...

**Animation from past to alternative present and future**

![](/Images/Animation.gif)

It looks like the most successfull path consists in destroying most cells from the beginning, just keeping some seeds and let them evolve. I don't know if it's just an algorithm artifact or some interesting discovery.

**Best alternative present found**

![](/Images/Best_end.png)

Inverting the Game of Life is quite a wild territory at the moment but I can guess that not any present configuration can be obtained from the past, though I'm far too stupid to demontrate this (despite Game of Life being a Turing machine in principle). Maybe with an infinite computational time... I also feel like the more steps in backward, the more difficult the problem becomes. As I said, it is also fairly easy to trace back [known patterns](https://conwaylife.com/wiki/Category:Patterns) compared to random topologies.
