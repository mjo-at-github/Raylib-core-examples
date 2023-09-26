// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_screen_manager.c

// Please note gesture detection still requires implementation

package main

import rl "vendor:raylib"

GameScreen :: enum { 
    LOGO = 0, 
    TITLE, 
    GAMEPLAY, 
    ENDING 
}

main :: proc(){

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic screen manager")

    currentScreen : GameScreen = .LOGO

    framesCounter : i32 = 0

    rl.SetTargetFPS(60)

    for rl.WindowShouldClose() != true {

        switch(currentScreen){

            case .LOGO:

            {
                framesCounter += 1

                if framesCounter > 120 {

                    currentScreen = .TITLE

                }

            } break

            case .TITLE:

            {
                if rl.IsKeyPressed(rl.KeyboardKey.ENTER) /*|| rl.IsGestureDetected(rl.Gesture.TAP)*/ {

                    currentScreen = .GAMEPLAY

                }

            } break

            case .GAMEPLAY:

            {
                
                if rl.IsKeyPressed(rl.KeyboardKey.ENTER) /*|| rl.IsGestureDetected(rl.Gesture.TAP)*/ {

                    currentScreen = .ENDING

                }

            } break

            case .ENDING:

            {
                
                if rl.IsKeyPressed(rl.KeyboardKey.ENTER) /*|| rl.IsGestureDetected(rl.Gesture.TAP)*/ {

                    currentScreen = .TITLE

                }

            } break

        }

        rl.BeginDrawing()

        rl.ClearBackground(rl.RAYWHITE)

        switch(currentScreen) {

                case .LOGO:

                {
                    
                    rl.DrawText("LOGO SCREEN", 20, 20, 40, rl.LIGHTGRAY)

                    rl.DrawText("WAIT for 2 SECONDS...", 290, 220, 20, rl.GRAY)

                }

                case .TITLE:

                {
                   
                    rl.DrawRectangle(0, 0, screenWidth, screenHeight, rl.GREEN)

                    rl.DrawText("TITLE SCREEN", 20, 20, 40, rl.DARKGREEN)

                    rl.DrawText("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, rl.DARKGREEN)

                }

                case .GAMEPLAY:

                {
                    
                    rl.DrawRectangle(0, 0, screenWidth, screenHeight, rl.PURPLE)

                    rl.DrawText("GAMEPLAY SCREEN", 20, 20, 40, rl.MAROON)

                    rl.DrawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, rl.MAROON)

                }

                case .ENDING:

                {
                    
                    rl.DrawRectangle(0, 0, screenWidth, screenHeight, rl.BLUE)

                    rl.DrawText("ENDING SCREEN", 20, 20, 40, rl.DARKBLUE)

                    rl.DrawText("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, rl.DARKBLUE)

                }

                
            }

            rl.EndDrawing()

        }

        rl.CloseWindow()

}