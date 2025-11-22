# Getting started with DOCS

### GDScript

- Installed godot-tools
- [https://gdquest.github.io/learn-gdscript/?ref=godot-docs](GDScript tutorial)

#### Functions covered in Tutorial

- print()
- show and hide()
- rotate(x) #wgere sprite turns by x radians
- move_local_x(x) # move sprite to its left and right
- move_local_y(y) # move sprite up and down

#### Functions

    ```
        func name():
            instruction_1
            instruction_2
    ```

    ```
        func function_name(parameter_name1, parameter_name2):
    ```

#### Variables

    ```
        var health = 100
    ```

    -member variables and sub-member variables - looks like classes a little bit in Pico8
    ```
        func run():
            position.x = 200
            position.y = 250
    ```

#### The Game Loop

- Godot has special functions we can customize or add to
- \_process()

  ```
      func _process(delta):
          rotate(0.05)
  ```

  - Process function gets its name because it does calculations or calcualte actions
  - Godot will automatically run this function every frame
  - When Godot draws on the screen we call that a frame
  - Similar to Pico8's \_\_update()

### Tips

- Something about nodes and signals being important
- Make scenes for everything (like health bars) so you can practice DRY
- If you duplicate something, make sure to make it unique
