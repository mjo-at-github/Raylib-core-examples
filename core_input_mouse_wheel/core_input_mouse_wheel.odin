// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse_wheel.c

package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - input mouse wheel")

    boxPositionY : i32 = screenHeight / 2 - 40

    scrollSpeed : i32 = 4        

    rl.SetTargetFPS(60)              
   
    for rl.WindowShouldClose() != true {

        boxPositionY -= auto_cast (rl.GetMouseWheelMove() * auto_cast scrollSpeed)
        
        rl.BeginDrawing()

            rl.ClearBackground(rl.RAYWHITE)

            rl.DrawRectangle(screenWidth / 2 - 40, boxPositionY, 80, 80, rl.MAROON)

            rl.DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, rl.GRAY)

            rl.DrawText(rl.TextFormat("Box position Y: %03i", boxPositionY), 10, 40, 20, rl.LIGHTGRAY)


        rl.EndDrawing()
    }
    
    rl.CloseWindow()

}