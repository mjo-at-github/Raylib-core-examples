// Source: https://github.com/raysan5/raylib/blob/master/examples/models/models_heightmap.c

package main

import rl "vendor:raylib"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.InitWindow(screenWidth, screenHeight, "raylib [models] example - heightmap loading and drawing")

    camera : rl.Camera = { }
    camera.position = (rl.Vector3){ 18.0, 21.0, 18.0 }
    camera.target = (rl.Vector3){ 0.0, 0.0, 0.0 }
    camera.up = (rl.Vector3){ 0.0, 1.0, 0.0 }
    camera.fovy = 45.0
    camera.projection = rl.CameraProjection.PERSPECTIVE

    image : rl.Image = rl.LoadImage("resources/heightmap.png")

    texture : rl.Texture2D = rl.LoadTextureFromImage(image)

    mesh : rl.Mesh = rl.GenMeshHeightmap(image, (rl.Vector3){ 16, 8, 16 })

    model : rl.Model = rl.LoadModelFromMesh(mesh)

    model.materials[0].maps[rl.MaterialMapIndex.ALBEDO].texture = texture

    mapPosition : rl.Vector3 = { -8.0, 0.0, -8.0 }

    rl.UnloadImage(image)

    rl.SetTargetFPS(60)

    for rl.WindowShouldClose() != true {

        rl.UpdateCamera(&camera, rl.CameraMode.ORBITAL)
       
        rl.BeginDrawing()

            rl.ClearBackground(rl.RAYWHITE)

            rl.BeginMode3D(camera)

                rl.DrawModel(model, mapPosition, 1.0, rl.RED)

                rl.DrawGrid(20, 1.0)

            rl.EndMode3D()

            rl.DrawTexture(texture, screenWidth - texture.width - 20, 20, rl.WHITE)
            rl.DrawRectangleLines(screenWidth - texture.width - 20, 20, texture.width, texture.height, rl.GREEN)

            rl.DrawFPS(10, 10)

        rl.EndDrawing()

    }

    rl.UnloadTexture(texture)

    rl.UnloadModel(model)

    rl.CloseWindow()
}