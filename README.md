[![Build Status](https://travis-ci.org/MaryDomashneva/GildedRose-Refactoring-Kata.svg?branch=master)](https://travis-ci.org/MaryDomashneva/GildedRose-Refactoring-Kata)

Gilded Rose tech test
=================

## Gilded Rose Requirements Specification:


Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

## Result:

#### Technology used:

* Ruby 2.5.0
* Rspec
* Rubocop
* Simplecov

#### Run project:
* The easiest way to try project is in IRB: ```inside terminal irb -r./lib/gilded_rose.rb```

### Project description:

The app architecture has 3 levels:
##### I LEVEL Classes (responsible for creating Item and Item class):
1. ```Item``` - responsible for creating a new item
and all existed Item classes created with similar architecture:
2. ```AgedBrieItemQualityUpdater```
3. ```BackstagePassItemUpdater```
4. ```FastQualityLoserItemQualityUpdater```
5. ```NormalItemQualityUpdater```
If further, we need to add more items with a specific behavior, we will create a new class following the existed architecture.

##### II LEVEL Classes (responsible for or update quality and sell in days, of item class):
1. ```GildedRose``` - interface class, MainFactory called inside
2. ```MainFactory``` - responsible for update item sell in days and quality
3. ```ItemSellInUpdatersFactory``` - responsible for update item sell in days
4. ```ItemQualityUpdatersFactory``` - responsible for update quality

##### II Level Classes (2d level class helpers):
1. ```ItemCategory```
2. ```ItemCategorizer```
3. ```DefaultSellInItemUpdater```

### Example:

* Project folder ```feature_tests_output``` contains two files ```original_test_output.txt``` and ```after_refactoring_otput.txt``` and you can see that they are the same.
* To make sure, run tests: from folder spec run ```$ ruby texttest_fixture.rb``` and the number of days you want to see.
* In order to run tests, clone project, install ruby 2.5.0, install Rspec ```gem 'rspec'``` and ```rspec``` command in terminal.
