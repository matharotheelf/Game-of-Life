# Game-of-Life

This is a repository for the Game of Life technical test. The test models an infinite two-dimensional grid inhabited by "cells". Every cell interacts with its eight neighbours, which are the cells horizontally, vertically or diagonally adjacent. After each iteration livecells are born or killed depending on a set of rules. These rules can be described by the following set of scenarios: 

Scenario 0: No interactions

Given a game of life 

When there are no live cells 

Then on the next step there are still no live cells

Scenario 1: Underpopulation 
Given a game of life 
When a live cell has fewer than two neighbours 
Then this cell dies

Scenario 2: Overcrowding 
Given a game of life 
When a live cell has more than three neighbours 
Then this cell dies

Scenario 3: Survival 
Given a game of life 
When a live cell has two or three neighbours 
Then this cell stays alive

Scenario 4: Creation of Life 
Given a game of life 
When an empty position has exactly three neighbouring cells 
Then a cell is created in this position

## Getting Started

To run the progamme first create an object of the class "Game":

game = Game.new

Then you can create a grid of livecells! First you must create a "Grid" object:

grid = Grid.new

Then you can seed this grid with livecells by running:

grid.add_livecell(xcoordinate, ycoordinate)

Where "xcoordinate" and "ycoordinate" are the coordinates of the newly seeded livecell in the grid.

Then to find the next iteration's grid you must run on the game object with the current grid as a parameter:

newgrid = game.iterate(grid)

This command returns the newly created grid so remember to save it to a variable. Then, to discover the positions of livecells in the new grid you can run:

newgrid.livecells_array[i].coordinate

Where i is the position of the livecell in the array storing the livecells.


### Prerequisites

To run the software you must have installed Ruby version 2.5.1p57 and to run the tests RSpec version 3.8.0.

### Installing

If you have installed bundler (https://bundler.io) you can quickly insall all the gems used in this project. To install the gems run "bundle install" in the command line.

## Running the tests

To run the tests run "rspec" in the command line. The tests cover all the features of the program. There are also two feature tests written which run through two scenarios one with a grid with no live cells and one with a grid seeded with live cells.

## Built With

* [Ruby version 2.5.1p57](http://www.dropwizard.io/1.0.2/docs/) - Language used
* [RSpec version 3.8.0](http://rspec.info) - Testing framework

## Authors

* **Thomas Lawrence**

Challenged create by BBC

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Thanks to the BBC for creating this challenge
