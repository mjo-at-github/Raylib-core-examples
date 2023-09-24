package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera mode")

    camera : rl.Camera3D = { }
    camera.position = (rl.Vector3){ 0.0, 10.0, 10.0 }
    camera.target = (rl.Vector3){ 0.0, 0.0, 0.0 }
    camera.up = (rl.Vector3){ 0.0, 1.0, 0.0 }
    camera.fovy = 45.0
    camera.projection = rl.CameraProjection.PERSPECTIVE

    cubePosition : rl.Vector3 = { 0.0, 0.0, 0.0 }
    
    rl.SetTargetFPS(60)

    for (rl.WindowShouldClose() != true) {

        rl.BeginDrawing()

            rl.ClearBackground(rl.RAYWHITE)

            rl.BeginMode3D(camera)

                rl.DrawCube(cubePosition, 2.0, 2.0, 2.0, rl.RED)
                rl.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, rl.MAROON)

                rl.DrawGrid(10, 1.0)

            rl.EndMode3D();

            rl.DrawText("Welcome to the third dimension!", 10, 40, 20, rl.DARKGRAY);

            rl.DrawFPS(10, 10);

        rl.EndDrawing();

    }

    rl.CloseWindow()

}

/*

/*******************************************************************************************
*
*   raylib [core] example - Initialize 3d camera mode
*
*   Example originally created with raylib 1.0, last time updated with raylib 1.0
*
*   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
*   BSD-like license that allows static linking with closed source software
*
*   Copyright (c) 2014-2023 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

#include "raylib.h"

//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
int main(void)
{
    // Initialization
    //--------------------------------------------------------------------------------------
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera mode");

    // Define the camera to look into our 3d world
    Camera3D camera = { 0 };
    camera.position = (Vector3){ 0.0f, 10.0f, 10.0f };  // Camera position
    camera.target = (Vector3){ 0.0f, 0.0f, 0.0f };      // Camera looking at point
    camera.up = (Vector3){ 0.0f, 1.0f, 0.0f };          // Camera up vector (rotation towards target)
    camera.fovy = 45.0f;                                // Camera field-of-view Y
    camera.projection = CAMERA_PERSPECTIVE;             // Camera mode type

    Vector3 cubePosition = { 0.0f, 0.0f, 0.0f };

    SetTargetFPS(60);               // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!WindowShouldClose())    // Detect window close button or ESC key
    {
        // Update
        //----------------------------------------------------------------------------------
        // TODO: Update your variables here
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        BeginDrawing();

            ClearBackground(RAYWHITE);

            BeginMode3D(camera);

                DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, RED);
                DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, MAROON);

                DrawGrid(10, 1.0f);

            EndMode3D();

            DrawText("Welcome to the third dimension!", 10, 40, 20, DARKGRAY);

            DrawFPS(10, 10);

        EndDrawing();
        //----------------------------------------------------------------------------------
    }

    // De-Initialization
    //--------------------------------------------------------------------------------------
    CloseWindow();        // Close window and OpenGL context
    //--------------------------------------------------------------------------------------

    return 0;
}

*/