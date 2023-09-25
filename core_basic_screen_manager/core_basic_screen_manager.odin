// Note gesture detection requires implementation

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

/*

/*******************************************************************************************
*
*   raylib [core] examples - basic screen manager
*
*   NOTE: This example illustrates a very simple screen manager based on a states machines
*
*   Example originally created with raylib 4.0, last time updated with raylib 4.0
*
*   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
*   BSD-like license that allows static linking with closed source software
*
*   Copyright (c) 2021-2023 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#include "raylib.h"

//------------------------------------------------------------------------------------------
// Types and Structures Definition
//------------------------------------------------------------------------------------------
typedef enum GameScreen { LOGO = 0, TITLE, GAMEPLAY, ENDING } GameScreen;

//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
int main(void)
{
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "raylib [core] example - basic screen manager");

    GameScreen currentScreen = LOGO;

    // TODO: Initialize all required variables and load all required data here!

    int framesCounter = 0;          // Useful to count frames

    SetTargetFPS(60);               // Set desired framerate (frames-per-second)
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!WindowShouldClose())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        switch(currentScreen)
        {
            case LOGO:
            {
                // TODO: Update LOGO screen variables here!

                framesCounter++;    // Count frames

                // Wait for 2 seconds (120 frames) before jumping to TITLE screen
                if (framesCounter > 120)
                {
                    currentScreen = TITLE;
                }
            } break;
            case TITLE:
            {
                // TODO: Update TITLE screen variables here!

                // Press enter to change to GAMEPLAY screen
                if (IsKeyPressed(KEY_ENTER) || IsGestureDetected(GESTURE_TAP))
                {
                    currentScreen = GAMEPLAY;
                }
            } break;
            case GAMEPLAY:
            {
                // TODO: Update GAMEPLAY screen variables here!

                // Press enter to change to ENDING screen
                if (IsKeyPressed(KEY_ENTER) || IsGestureDetected(GESTURE_TAP))
                {
                    currentScreen = ENDING;
                }
            } break;
            case ENDING:
            {
                // TODO: Update ENDING screen variables here!

                // Press enter to return to TITLE screen
                if (IsKeyPressed(KEY_ENTER) || IsGestureDetected(GESTURE_TAP))
                {
                    currentScreen = TITLE;
                }
            } break;
            default: break;
        }
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        BeginDrawing();

            ClearBackground(RAYWHITE);

            switch(currentScreen)
            {
                case LOGO:
                {
                    // TODO: Draw LOGO screen here!
                    DrawText("LOGO SCREEN", 20, 20, 40, LIGHTGRAY);
                    DrawText("WAIT for 2 SECONDS...", 290, 220, 20, GRAY);

                } break;
                case TITLE:
                {
                    // TODO: Draw TITLE screen here!
                    DrawRectangle(0, 0, screenWidth, screenHeight, GREEN);
                    DrawText("TITLE SCREEN", 20, 20, 40, DARKGREEN);
                    DrawText("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, DARKGREEN);

                } break;
                case GAMEPLAY:
                {
                    // TODO: Draw GAMEPLAY screen here!
                    DrawRectangle(0, 0, screenWidth, screenHeight, PURPLE);
                    DrawText("GAMEPLAY SCREEN", 20, 20, 40, MAROON);
                    DrawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, MAROON);

                } break;
                case ENDING:
                {
                    // TODO: Draw ENDING screen here!
                    DrawRectangle(0, 0, screenWidth, screenHeight, BLUE);
                    DrawText("ENDING SCREEN", 20, 20, 40, DARKBLUE);
                    DrawText("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, DARKBLUE);

                } break;
                default: break;
            }

        EndDrawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------

    // TODO: Unload all loaded data (textures, fonts, audio) here!

    CloseWindow();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}
*/
