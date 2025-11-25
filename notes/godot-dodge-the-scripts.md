# Dodge the Creeps tutorial

### Initializing Project
- Downloaded assets from tutorial
- Create Project and changed Project Settings so that its viewport width is 480 and height is 720.
- Did Stretch for canvas_items and aspect keep
    - Apparently this ensures the game scales consistently on different sized screens

### Overview
- In this project we will make 3 independent scenes 
    - Player
    - Mob
    - HUD
- which we will then combine into the game's Main scene

### Player
- Made player by selecting Other Node > Area2D
- Renamed player through double clicking
- Warning is ok to ignore because we're starting with sprites 
- Before we add any children to the Player node, we want to make sure we don't accidentally move or resize them by clicking on them. 
    - know it is applied when the tool used (icon is diagonal 8) is next to the warning symbol on the left menu
- Save scene as player.tcsn.