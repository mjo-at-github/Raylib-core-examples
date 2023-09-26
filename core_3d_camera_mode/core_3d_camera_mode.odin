// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_mode.c

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