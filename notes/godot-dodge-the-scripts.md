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

#### Player Animation

- Click on player A and add (control A) a child node AnimatedSprite2D.
    - Will handle the appearance and animations for our player.
    - Wil have a warning because it requires SpriteFrames
    -SpriteFrames is a list of the animatiosn it can display.
- To add sprite frames, use inspector and locate sprite frames. Should click empty -> New Sprite Frames
- Click on newly created sprite frames and a window should appear on the bottom
- Rename default to walk
- Cntrl n for create a new animation -> name it to up
- Cntrl o to add frames to file
- Change the scale to 0.5,0.5 in the inspector of AnimatedSprite2D's Node2D

#### Collision shape
- Add a CollisionShape2D as a child of Player
    - will determine the player's hitbox 
    - For this specific sprite, we are goign to use CapsuleShape2D
    - hitbox was nice to play around with in the workspace

#### Coding the Player
- Click on player in the left menu and click on attach the script
- Use @export like 
    ```export var speed = 400``` to allow us to set its value in the inspector 
    - handy for values you want to be able to adjust like a node's built in properties.
- player.gd starts with _ready() and _process() 
- _ready() is called when a node enters the scene tree
_process() is called every frame 
----
- Adding input 
    - Project -> Project Sttings -> Input Map tab
- search move_right and add
- Add event to assign a key to this action

![Alt text](https://docs.godotengine.org/en/stable/_images/input-mapping-completed.webp)