// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c

package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - mouse input")

    ballPosition : rl.Vector2 = { -100.0, -100.0 }

    ballColor : rl.Color = rl.DARKBLUE

    rl.SetTargetFPS(60)            
    
    for rl.WindowShouldClose() != true {
        
        ballPosition = rl.GetMousePosition()

        if rl.IsMouseButtonPressed(rl.MouseButton.LEFT) { 
            ballColor = rl.MAROON 
        }
        else if rl.IsMouseButtonPressed(rl.MouseButton.MIDDLE) { 
            ballColor = rl.LIME 
        }
        else if rl.IsMouseButtonPressed(rl.MouseButton.RIGHT) {
             ballColor = rl.DARKBLUE 
            }
        else if rl.IsMouseButtonPressed(rl.MouseButton.SIDE) {
             ballColor = rl.PURPLE 
            }
        else if rl.IsMouseButtonPressed(rl.MouseButton.EXTRA) {
             ballColor = rl.YELLOW 
            }
        else if rl.IsMouseButtonPressed(rl.MouseButton.FORWARD) {
             ballColor = rl.ORANGE 
            }
        else if rl.IsMouseButtonPressed(rl.MouseButton.BACK) {
             ballColor = rl.BEIGE 
            }
       
        rl.BeginDrawing()

            rl.ClearBackground(rl.RAYWHITE)

            rl.DrawCircleV(ballPosition, 40, ballColor)

            rl.DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, rl.DARKGRAY)

        rl.EndDrawing()
       
    }

    rl.CloseWindow()

}