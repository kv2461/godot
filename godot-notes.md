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
- lerp()
  -short for linear interpolate, calculates and returns a weighted average between to values

  - 3 arguments (2 values to average and a value between 0.0 and 1.0 to skew the result.)
  - used to animate things moving towards a target with a single line of code

  ```
      func _process(delta):
          position = lerp(position, get_local_mouse_position(), 2*delta)
  ```

- array.append() and array.pop_front()

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

#### Conditions

    ```
        func heal(amount):
            health += amount
            if health > 100:
                health = 100
    ```

    ```
        if health > 100: # If health is greater than 100
            pass
        if health < 50: # If health is less than 50
            pass
        if health == 25: # If health is equal to 25
            pass
        if health != 7: # If health is not equal to 7
            pass
    ```

    ```
        func run():
            var speed = 120
            if speed < 100:
                print("You're slow!")
            else:
                print("You're fast!")
    ```

#### Vectors

    - Context: increasing in size as we level up
    ```
    func level_up():
        scale.x += 0.2
        scale.y += 0.2

    ```
    ```
    func level up():
        scale += Vector2(0.2, 0.2)
    ```
        -the scale variable has two sub-variables to it: x and y
        -scale is a Vector2, which stands for two-dimensional vector.
    - A Vector2 represents 2D coordinates.
    - A vector, in physics, is a quantity with a magnitude and direction.
        -For example, a force applied to some object, the velocity(speed and direction) of a character, and so on.
    - Often represented with an arrow
    -In Godot, 2D vectors are a common value type named Vector2
    -Unlike plain numbers, they store two decimbal numbers: one for the X coordinate and one for the Y coordinate.
    -Position and scale can be Vector2
    -Essential in video games
    -Allows you to represent a character's movement speed and direction, calculate the distance to a target, and more. with a little code.

#### While Loops

    ```
        var number = 0
        while number < 4:
            print(number)
            number += 1
    ```

    ```
        func move_to_end():
            while cell.x < board_size.x - 1:
                cell.x += 1
    ```

    - Can be dangerous if the while condition never becomes false, resulting in the function running infinitely

#### For Loops

    ```
        for number in range(3):
            cell += Vector2(1,1)
    ```

    ```
        func move_to_end():
            for number in range(board_size.x - 1):
                cell.x += 1
    ```

    -helper function range()
        - range(n) creates a list of numbers from 0 to n - 1.
        - range(3) # output: [0,1,2]
        - range(5) # output: [0,1,2,3,4,5]

#### Arrays

        ```
            func run():
                for number in range(3):
                    print(number)
        ```

        ```
            func run():
                for element in [0,1,2]:
                    print(element)
        ```

        ```
            func run():
                var array = [0,1,2]
                var element

                element = array[0]
                print(element)

                element = array[1]
                print(element)

                element = array[2]
                print(element)
        ```

        ```
            var units = []
            var selected_units = []

            func select_units(cells):
                for cell in cells:
                    if cell in units:
                        selected_units.append(cell)
                update()
        ```

        - In a condition, the in key word allows you to check if a value exists in an array
        - Array's append() function appends a new value at the end of the array

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
  - The process function's delta parameter
    - Delta represents a time difference
    - It is the time passed since the previous frame, in seconds.
    - We can use it to ensure that the changes between frames don't make the game's behavior unreliable
    - This is because different computers run differently, so a fast computer will have more FPS than a slow computer.
    - If we ignore delta, the game experience will vary, depending on the computer. Delta helps with consistency
    - To apply delta, you need to multiply your speed values by it
    ```
        func _process(delta):
            rotate(3.0 * delta)
    ```
    - When multiplying delta, you make motion time-dependent rather than frame-dependent

### Tips

- Something about nodes and signals being important
- Make scenes for everything (like health bars) so you can practice DRY
- If you duplicate something, make sure to make it unique
