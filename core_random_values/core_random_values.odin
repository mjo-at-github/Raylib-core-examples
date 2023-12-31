// Source: https://raw.githubusercontent.com/raysan5/raylib/master/examples/core/core_random_values.c

package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - generate random values")

    randValue := rl.GetRandomValue(-8, 5)
    
    framesCounter := 0
    
    rl.SetTargetFPS(60)    

    for rl.WindowShouldClose() != true {

        framesCounter = framesCounter + 1
        
        if (((framesCounter/120)%2) == 1) {

            randValue = rl.GetRandomValue(-8, 5)

            framesCounter = 0
        }
        
        rl.BeginDrawing()

        rl.ClearBackground(rl.RAYWHITE)

        rl.DrawText("Every 2 seconds a new random value is generated:", 130, 100, 20, rl.MAROON)

        rl.DrawText(rl.TextFormat("%i", randValue), 360, 180, 80, rl.LIGHTGRAY)

        rl.EndDrawing()
        
    }
    
    rl.CloseWindow()

}