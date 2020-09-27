# Life on Mars
![mars](assets/mars-olive.png)  
After changing the way we life our lives on Earth, Freska has decided to expand and reach for the stars.   
We want to be the ones providing perfect living conditions on Mars, so it's ready for the first crew of pioneers to settle there.
After some months of research, our attempts of terraforming Mars has hit a dead end after one of our Bio-engineers was eaten by the latest generation of gen manipulated pine trees.  
This is where you come in: **Help us simulate terraforming scenarios!**

## Requirements
You should have ruby 2.6 or later installed on your machine.  
Run your experiments like this:
```bash
$ bin/run PLANT_NAME NUMBER_OF_DAYS
```

We have prepared some code for you to get you started. Change anything you want. If you don't like what you see, feel free to start from scratch!  
**Don't forget, besides having fun, this is about writing easy to read and maintain code**

## The Scenarios
We have a few different plants, ready to be shipped to the red planet. All of them have different advantages and weaknesses based on the genes we implanted.
For each scenario, some plants of the same type will be shipped to the red planet. They will land safely somewhere on a previously selected terrain and start growing.
The terrain is split into planting slots, to make it easier for the satellites to monitor the situation.   
We made sure they grow fast, so you will be able to see something change after each mars day/iteration. After plants die, they remain dead for the coming day and disappear the day after.

### Hoppus Major
Grows fast, grows big, doesn't like neighbors.

- 5 plants fit in the rocket
- Each slot next to an existing plant has a 50% chance to grow offspring
- Each plant with more then 3 neighboring plants dies
- Lives no longer then 5 mars days

### Taraxacum Vulgaris
tiny, Spread via seeds, needs neighbors

- 10 plants fit in the rocket
- Each plant seeds 5 children somewhere on the terrain every other day
- Plants only die with more then 6 neighbors
- Dead plants are reanimated if they have at least 2 neighbors
- Dies after 15 days

### Solanum Vodkorium
lives long, needs little space, grows slow

- 15 plants fit in the rocket
- Lives up to 2 days
- Each neighboring slot has a 20% chance of growing offspring
- Plants with more then 4 neighbors die

### Laurus Nobilis
lives short, spreads like crazy, hates neighbors

- 7 plants fit in the rocket
- lives up to 2 days
- Each plant seeds 10 children somewhere on the terrain every day
- Each neighboring slot has a 30% chance of growing offspring
- All plants with more then 2 neighbors die

### Agavoideae Ordinaris
very hardy, grows slow, easy to revive

- 10 plants fit in the rocket
- Dead plants with at least 1 neighbor are revived
- Each neighboring slot has a 10% chance of growing offspring
- Lives up to 5 days

## Even more to do
If you are bored and want to show us more of what you can do, here are some ideas for extensions:

- Allow your app to write the results of your experiments to text or html files
- Enable us to persist the current state so experiments can be interrupted and continues at at later point of time
- Allow your experiments to be live streamed to viewers on other machines (on other planets)
