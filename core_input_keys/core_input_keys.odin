// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c

package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - keyboard input")

    ballPosition : rl.Vector2 = { (f32)(screenWidth / 2), (f32)(screenHeight / 2) }
    
    rl.SetTargetFPS(60)

    for (rl.WindowShouldClose() != true) {

        if rl.IsKeyDown(rl.KeyboardKey.RIGHT) { ballPosition.x += 2.0 }
        if rl.IsKeyDown(rl.KeyboardKey.LEFT) { ballPosition.x -= 2.0 }
        if rl.IsKeyDown(rl.KeyboardKey.UP) { ballPosition.y -= 2.0 }
        if rl.IsKeyDown(rl.KeyboardKey.DOWN) { ballPosition.y += 2.0 }

        rl.BeginDrawing()

        rl.ClearBackground(rl.RAYWHITE)

            rl.DrawText("move the ball with arrow keys", 10, 10, 20, rl.DARKGRAY)

            rl.DrawCircleV(ballPosition, 50, rl.MAROON)

        rl.EndDrawing()

    }

    rl.CloseWindow()

}