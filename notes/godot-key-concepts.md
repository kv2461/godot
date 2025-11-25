# Godot Key Concepts

## Game

A Game is a tree of nodes that you group together into scenes

You can wire these nodes so they can communicate using signals

### Scenes

- Games break down to reusable scenes
- A scene can be a character, a weapon, a menu in the user interface, a single house, an entire level, or anything you can think of.
- You can nest scenes.
- A scene is composed of one or more nodes.

### Nodes

- Your game's smallest building blocks that you arrange into trees.
  - Player
    - Camera2D
    - Sprite2D
    - CollisionShape2D
- Structure above illustrated a character's nodes.
  Made of a CharacterBody2D node named "player, a Camera2d, a Sprite2D and a CollisionShape2D.
- Nodes and scenes look the same in editor. When you save a tree of nodes as a scene, it then shows a single node, with its internal structure hidden in the editor.

### The Scene Tree

- Tree of scenes
- Since scenes are trees of nodes, the scene tree also is a tree of nodes.
- But easier to think of your game in terms of scenes, as they can represent charactersm weapons, doors, or your user interface.
  - Scene
    - Level01
      - BackgroundLayer
        - TextureRect
      - InterfaceLayer
        - UserInterface
      - TileMap
      - CharacterBody2D
        - Camera2D
        - Sprite2D
        - CollisionShape2D
      - Portal2d
      - Coins
      - Enemies


### Signals