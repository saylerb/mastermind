---
layout: page
title: Mastermind
---

Welcome to Mastermind!

Computer is the CODEMAKER!
You are the CODEBREAKER!

Your task is to break the code. The code is made of four Colors: Red, Green,
Blue and Yellow. You will be able to guess as many times as you want, and each
time you guess, the computer will process your guess and give you 2 statements
of feedback on the correctness of your guess:

1) The computer will tell you how many *distinct* colors in your guess are in
the secret code, which will be labeled "Colors Correct."  This number will not
reflect repeats in colors in the secret code.

**Example 1**:  If you guess 'RRGB' and the secret code is 'RRRR', the feedback will be: 'You have 1 color correct.'

**Example 2**:  If you guess 'RRGB' and the secret code is 'RGBY', the feedback will be: 'You have 3 colors correct.'

2) The computer will tell you how many colors AND positions are correct in
your previous guess.

Example 1:  If you guess 'RRGB' and the secret code is 'RRRR',
            the feedback will be: 'You have 2 in the correct position.'

Example 2:  If you guess 'RRGB' and the secret code is 'RGBY',
            the feedback will be: 'You have 1 in the correct position.'

You can make as many guesses as you want.  At any time, you can press 'q' to quit the game
and stop running the program. At any time, you can press 'c' to cheat
and the secret code will instantly be guessed for you.

Good luck!

### Starting a Game

* The player starts the game by running `ruby mastermind.rb`

```
Welcome to MASTERMIND

Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>
```

```
I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?
```

### Playing the Game

They can then enter a guess in the form `rgyb`. The guess history will be printed after each guess, and let you know how many colors and positions were guessed correctly.

```
--------------------------------------------
| Guess  |  Guess  |  Colors  |  Positions |
| Number |         |  Correct |   Correct  |
--------------------------------------------
|   1    |  RGYG   |    3     |     1      |
|   2    |  RBRY   |    3     |     1      |
--------------------------------------------
```
