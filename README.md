# The Game of Life, but in reverse !

## Can we go back in time with the Game of life ?
The response is yes, but with sweat and blood.

Joke apart, the [Game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) is a mathematical amusement sufficiently well known to avoid me to write a story about it. Long story short, it's fully deterministic in a forward way with ultra simple rules, but guessing a configuration in backward is surprisingly difficult as those same simple rules destroy information at each step. It is of course possible to try any previous combination of dead and living cells until the next step matches the configuration you wish (aka stupid brute force method).

Mathematics are however ruthless and the configuration space becomes rapidely impossible to explore if the map size and/or the number of backward steps is big enough. The problem is higly discrete, with a huge number of dimensions, but fairly simple from an algorithm point of view. This is a perfect problem for a class of algorithm that eats dimensions for the breakfast and break any discrete problem without pain (or near): the [genetic algorithms](https://en.wikipedia.org/wiki/Genetic_algorithm).

The game here is simple: start from a binary image (configuration in the future) and guess what could be the starting configuration back in time that can lead to this. Genetic algorithms works like daddy and mommy during [meiosis](https://en.wikipedia.org/wiki/Meiosis): the problem is transformed in DNA strands with genes (here 0 and 1 of the past configuration), these strands (in fact vectors but who cares) are crossed and mutated to produce the DNA of children, the phenotype of these children is expressed as a fitness in the present (here, do the obtained final configuration matches the image input after some steps of Game of Life), and finally the most performing children are allowed to contribute to the next generations like in real life. The less performing ones are of course allowed to play Overwatch or become Discord moderators, we are not beasts after all.

As genetic algorithm and the Game of Life are bioinspired, it's a bit like a Game of Life within the Game of life, sadly the concept has [already been taken](https://www.youtube.com/watch?v=xP5-iIeKXE8). In the other hand, to my knowledge, coupling Genetic Algorithm with Game of Life was never tried.

## Requirements
- Matlab R2023b with Parallel Computing toolbox or higher
- GNU Octave 9.2.0 or higher

Both softwares can run the code natively. GNU Octave is however slow as shit compared to Matlab for this problem.

## How does it works ?
- draw the future configuration in binary with paint for example, set the number of backward steps and run the code;
- see the magic happening. You can take a walk outside and see some friends, it's long to converge. The more the present shape to mimic is close to Game of Life usual patterns, the better it will work. The end solution could even be exact in some cases (real present), but generally only an alternative present is found;
- run the script to animate all that shit and impress your virtual friends on Reddit with the work of others. Don't be shy, attribute this to yourself, I don't care.

It's all that simple ! The code is stupidely short and simple but should noticeably contribute to global warming thanks to its sluggish convergence. It is also quite a reliable way to produce entropy, like the Bitcoin, but without the crumbs at the end.

## Example of result (with 25 steps backward in time)

**Present configuration to guess from the past**

![](/Images/Target_big.png)

**Algorithm convergence during around 1500 steps**

![](/Images/Topology.gif)

**Best configuration found in the past**

![](/Images/Best_start.png)

**From past to alternative present**

![](/Images/Animation.gif)

**Best alternative present found**

![](/Images/Best_end.png)

Inverting the Game of Life is quite an unexplored territory but I can guess that not any present configuration can be obtained from the past, though I'm far too stupid to demontrate this (despite Game of Life being a Turing machine in principle). I also feel like the more steps in backward, the more difficult the problem becomes. As I said, it is also fairly easy to trace back [known patterns](https://conwaylife.com/wiki/Category:Patterns) compared to random topologies.
