// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c

package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window")
    
    rl.SetTargetFPS(60)

    for (rl.WindowShouldClose() != true) {

        rl.BeginDrawing()

            rl.ClearBackground(rl.RAYWHITE)

            rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LIGHTGRAY)

        rl.EndDrawing()

    }

    rl.CloseWindow()

}