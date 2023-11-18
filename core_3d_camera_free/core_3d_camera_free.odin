// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_free.c

package main

import rl "vendor:raylib"

main :: proc(){

screenWidth :: 800
screenHeight :: 450

rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera free")
 
camera : rl.Camera3D = { }
camera.position = (rl.Vector3){ 10.0, 10.0, 10.0 }
camera.target = (rl.Vector3){ 0.0, 0.0, 0.0 }     
camera.up = (rl.Vector3){ 0.0, 1.0, 0.0 }         
camera.fovy = 45.0                           
camera.projection = rl.CameraProjection.PERSPECTIVE   

cubePosition : rl.Vector3 = { 0.0, 0.0, 0.0 }

rl.DisableCursor()                

rl.SetTargetFPS(60)               

for (rl.WindowShouldClose() != true ){

    rl.UpdateCamera(&camera, rl.CameraMode.FREE)

    if rl.IsKeyPressed(rl.KeyboardKey.Z){

        camera.target = (rl.Vector3){ 0.0, 0.0, 0.0 }

    }
       
    rl.BeginDrawing()

        rl.ClearBackground(rl.RAYWHITE)

        rl.BeginMode3D(camera)

            rl.DrawCube(cubePosition, 2.0, 2.0, 2.0, rl.RED)

            rl.DrawCubeWires(cubePosition, 2.0, 2.0, 2.0, rl.MAROON)

            rl.DrawGrid(10, 1.0)

        rl.EndMode3D();

            rl.DrawRectangle( 10, 10, 320, 93, rl.Fade(rl.SKYBLUE, 0.5))

            rl.DrawRectangleLines( 10, 10, 320, 93, rl.BLUE)

            rl.DrawText("Free camera default controls:", 20, 20, 10, rl.BLACK)

            rl.DrawText("- Mouse Wheel to Zoom in-out", 40, 40, 10, rl.DARKGRAY)

            rl.DrawText("- Mouse Wheel Pressed to Pan", 40, 60, 10, rl.DARKGRAY)

            rl.DrawText("- Z to zoom to (0, 0, 0)", 40, 80, 10, rl.DARKGRAY)

    rl.EndDrawing()

}
    
    rl.CloseWindow()     

} 
