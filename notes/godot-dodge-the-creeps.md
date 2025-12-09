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
  `export var speed = 400` to allow us to set its value in the inspector
  - handy for values you want to be able to adjust like a node's built in properties.
- player.gd starts with \_ready() and \_process()
- \_ready() is called when a node enters the scene tree
  \_process() is called every frame

---

- Adding input
  - Project -> Project Sttings -> Input Map tab
- search move_right and add
- Add event to assign a key to this action

![Alt text](https://docs.godotengine.org/en/stable/_images/input-mapping-completed.webp)

- $ is shorthand for get_node()
  `$AnimatedSprite2D.play()` is the same as `get_node("AnimatedSprite2D").play()`
- In GDScript, $ returns the node at the relative path from the current path from the current node, or returns null if the node is not found. Since AnimatedSprite2D is a child of the current node, we can use $AnimatedSprite2D.

---

- ran into issues and realized for F6 when runnign current scenes Input needs to be selected at the top to Allow Game input

---

- hide() to hide the player when the game starts

---

- Add signal called hit
  - Player will emit hit when it collides with an enemy
  - Right side menu for node it should be show up under Node
- Using the Godot UI, right click on body_entered(body:Node2D)
  - right click to connect and connect a signal to the player
  - know it works if you see a new function \_on_body_entered in the player script
  - hit.emit() gets called in that function - not entirely sure but makes sense
    - because emit is a signal that the player hits, the signal function i added called "body_entered" probably happens if another body collides with the player's body
    - Emitted when the received body enters this area. body can be a PhysicsBody2D or a TileMap. TileMaps are detected if their TileSet has collision shapes configured. Requires monitoring to be set to true.
    - so it is a built in signal for the specific class Area2D

#### Adding Mob

- Mobs will spawn randomly at the edges of the screen, choose a random dirction, and move in a straight line.
- Create a Mob scene, which we can then instance to create to create anu number of independent mobs in the game.
- Made a rigidBody2D scene for mobs with children nodes AnimatedSprite2D, CollisionShape2D, and VisibleOnScreenNotifier2D
- Set its RigidBody2D's gravity scale to 0 to prevent the mob from falling downwards
- Unchecked its CollisionObject2D's Mask-1 so that mobs do not collide with each other
  - Layers and masks work together
    - Layer "I am on layer X"
    - Mask "I collide with things on layers X, Y, Z
    - If a mob is on Layer 1 and has Mask 1 checked, it collides with other things on Layer 1(including other mobs)
    - By unchecking Mask 1, we're saying "don't collide with anything on Layer 1" so mobs ignore each other
- Connect screen_exited() signal from VisibleOnScreenNotifier2D to Mob to add code func \_on_bisible_on_screen_notifier_2d_screen_exited()
  - queue_free() functio is called so that it deletes the node at the end of the frame when they leave the screen

#### Adding Main Game Scene

- Created a new scene called "main", using the node Node
  - Not Node2D because it doesn't have to have 2D functionality itself, it is a container for game logic
- Instantiated child scene "player" inside "main"
- Added child node MobTimer to control how often mobs spawn
- Added child node ScoreTimer to add score based on time passed
- Added child node StartTimer to give delay before starting the game
  - Set oneshot property on (so that it happens only once)
- Added child node StarterPosition of node Marker2D to indicate player's start position
- Added child node MobPath of node 2DPath for mob spawn location
  - We want them to appear in a random location at the edge of the screen
  - Use "Add Path" of 2D path and click in clockwise formation so mobs spawn inward and not outward
  - Tutorial suggested using smart snap and snap grid but only used smart snap
  - Clicked on close curve to exit adding points to curve
- Add child node to 2DPath called MobSpawnLocation of node type PathFollow2D
  - Node will automatically rotate and follow the path
  - We can use it to select a random position and direction along the path

#### Coding Main Game Scene

- @export var mob_scene: PackedScene
  - Mob Scene appeared in inspector for main node and added mob.tscn as Mob Scene
  - Allows us to choose the mob scene we want to instance
- Connected Player scene's signal hit to main with function game_over

#### Heads Up Display

- UI for Score, "game over" message, and a restart button
  - Score changed by ScoreTimer
  - A message, such as "Game Over" or "Get Ready"
  - A "Start" button to begin the game
- New scene using CanvasLayer node named HUD
  - CanvasLayer node lets us draw our UI elements on a layer above the rest of the game
    - so that the information it displays isn't covered up by any game elements like the player or mobs
- Basic node for UI elements is Control
  - To create our UI, we'll use two types of Control nodes: Label and Button
    - ScoreLabel = Label node
    - Message = Label node
    - StartButton = Button node
    - MessageTimer = Timer node
- Default font for Control nodes is small and doesn't scale well.
  - Used a font file included in tutorial game assets called "Xolonium-Regular.ttf"
  - Score Label Inspector > Theme Overrides > Fonts, choose Load and select the ttf file
- Control nodes have a position and size, but they also have anchors.
  - Anchors define the origin- the reference point for the edges of the node

##### Understanding the Code so far

- So far I like the built in IDE for Godot - its helpful with the docs built in and having the inputs be recognized as things i can use
- `position` is a built-in property that comes from the Node2D class which Area2D inherits from.
  - position is a Vector2 that represents the node's local coordinates relative to its parent
  - position += velocity \* delta directly modifies where the node is in 2d space.
- Observation - there is a \_ready() and \_process() function when I created player.gd
  - Equivalent to pico 8 seems like \_ready() ~= \_init() and \_process() seems to have both **udpate() and **draw()
- Difference between Player scene's parent node being Area2D and Mob scene's parent node being RigidBody2D
  - This is different from Area2D player scene
  - According to Claude, the parent node type determines the physics behavior
    - Area2D
      - Detects overlaps/collisions but doesn't interact physically
      - Doesn't move from physics (you can control it manually with position +=)
      - Perfect for player-controlled characters
      - Can detect when mobs enter/exit its area with signals like body_entered
    - RigidBody2D (Mob)
      - Has actual physics simulation (gravity, momentum, bouncing)
      - Moves automati
      - can collide with other physics bodies and bounce off
      - perfect for enemies that move independently with physics
    - Tutorial uses this because
      - Player needs precise, direct control (you set position directly)
      - Mobs need to bounce around naturally with physics simulation
      - When a mob hits the player, the Area2D detects it without the player getting pushes around
  - The parent determines how these collisions behave
    - Area2D: "Tell me when something touches me" (sensor)
    - RigidBody2D: "Physically react when something hits me" (physics object)
- I've grouped parent nodes and its children node everytime so far (just twice but still)
