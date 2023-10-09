// Source: https://github.com/raysan5/raylib/blob/master/examples/core/core_input_gamepad.c

package main

import rl "vendor:raylib"

XBOX360_LEGACY_NAME_ID :: "Xbox Controller"
XBOX360_NAME_ID :: "Xbox 360 Controller"
PS3_NAME_ID :: "PLAYSTATION(R)3 Controller"

main :: proc() {

    screenWidth :: 800
    screenHeight :: 450

    rl.SetConfigFlags({.MSAA_4X_HINT})

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - gamepad input")

    texPs3Pad : rl.Texture2D = rl.LoadTexture("resources/ps3.png")

    texXboxPad : rl.Texture2D = rl.LoadTexture("resources/xbox.png")

    rl.SetTargetFPS(60)

    gamepad : i32 = 0

    for rl.WindowShouldClose() != true {
        
        rl.BeginDrawing()

            rl.ClearBackground(rl.RAYWHITE)

            if rl.IsKeyPressed(rl.KeyboardKey.LEFT) && gamepad > 0 {
                gamepad = gamepad - 1
            }
            if rl.IsKeyPressed(rl.KeyboardKey.RIGHT) {
                gamepad = gamepad + 1
            }

            if rl.IsGamepadAvailable(gamepad) {

                rl.DrawText(rl.TextFormat("GP%d: %s", gamepad, rl.GetGamepadName(gamepad)), 10, 10, 10, rl.BLACK)

                if true {

                    rl.DrawTexture(texXboxPad, 0, 0, rl.DARKGRAY)

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.MIDDLE) {
                        rl.DrawCircle(394, 89, 19, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.MIDDLE_RIGHT) {
                        rl.DrawCircle(436, 150, 9, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.MIDDLE_LEFT) {
                        rl.DrawCircle(352, 150, 9, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_LEFT) {
                        rl.DrawCircle(501, 151, 15, rl.BLUE)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_DOWN) {
                        rl.DrawCircle(536, 187, 15, rl.LIME)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_RIGHT) {
                        rl.DrawCircle(572, 151, 15, rl.MAROON)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_UP) {
                        rl.DrawCircle(536, 115, 15, rl.GOLD)
                    }

                    rl.DrawRectangle(317, 202, 19, 71, rl.BLACK)

                    rl.DrawRectangle(293, 228, 69, 19, rl.BLACK)

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_UP) {
                        rl.DrawRectangle(317, 202, 19, 26, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_DOWN) {
                        rl.DrawRectangle(317, 202 + 45, 19, 26, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_LEFT) {
                        rl.DrawRectangle(292, 228, 25, 19, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_RIGHT) {
                        rl.DrawRectangle(292 + 44, 228, 26, 19, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_TRIGGER_1) {
                        rl.DrawCircle(259, 61, 20, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_TRIGGER_1) {
                        rl.DrawCircle(536, 61, 20, rl.RED)
                    }

                    leftGamepadColor : rl.Color = rl.BLACK

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_THUMB) {
                        leftGamepadColor = rl.RED
                    }

                    rl.DrawCircle(259, 152, 39, rl.BLACK)

                    rl.DrawCircle(259, 152, 34, rl.LIGHTGRAY)

                    rl.DrawCircle(259 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.LEFT_X)*20), 152 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.LEFT_Y)*20), 25, leftGamepadColor)

                    rightGamepadColor : rl.Color = rl.BLACK

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_THUMB) {
                        rightGamepadColor = rl.RED
                    }

                    rl.DrawCircle(461, 237, 38, rl.BLACK)

                    rl.DrawCircle(461, 237, 33, rl.LIGHTGRAY)

                    rl.DrawCircle(461 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.RIGHT_X)*20), 237 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.RIGHT_Y)*20), 25, rightGamepadColor)

                    rl.DrawRectangle(170, 30, 15, 70, rl.GRAY)

                    rl.DrawRectangle(604, 30, 15, 70, rl.GRAY)

                    rl.DrawRectangle(170, 30, 15, (i32)(((1 + rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.LEFT_TRIGGER))/2)*70), rl.RED)

                    rl.DrawRectangle(604, 30, 15, (i32)(((1 + rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.RIGHT_TRIGGER))/2)*70), rl.RED)

                } else if rl.TextIsEqual(rl.GetGamepadName(gamepad), PS3_NAME_ID) {

                    rl.DrawTexture(texPs3Pad, 0, 0, rl.DARKGRAY)

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.MIDDLE) {
                        
                        rl.DrawCircle(396, 222, 13, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.MIDDLE_LEFT) {
                        rl.DrawRectangle(328, 170, 32, 13, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.MIDDLE_RIGHT) {
                        rl.DrawTriangle((rl.Vector2){ 436, 168 }, (rl.Vector2){ 436, 185 }, (rl.Vector2){ 464, 177 }, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_UP) {
                        rl.DrawCircle(557, 144, 13, rl.LIME)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_RIGHT) {
                        rl.DrawCircle(586, 173, 13, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_DOWN) {
                        rl.DrawCircle(557, 203, 13, rl.VIOLET)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_FACE_LEFT) {
                        rl.DrawCircle(527, 173, 13, rl.PINK)
                    }

                    rl.DrawRectangle(225, 132, 24, 84, rl.BLACK)

                    rl.DrawRectangle(195, 161, 84, 25, rl.BLACK)

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_UP) {
                        rl.DrawRectangle(225, 132, 24, 29, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_DOWN) {
                        rl.DrawRectangle(225, 132 + 54, 24, 30, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_LEFT) {
                        rl.DrawRectangle(195, 161, 30, 25, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_FACE_RIGHT) {
                        rl.DrawRectangle(195 + 54, 161, 30, 25, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_TRIGGER_1) {
                        rl.DrawCircle(239, 82, 20, rl.RED)
                    }

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_TRIGGER_1) {
                        rl.DrawCircle(557, 82, 20, rl.RED)
                    }

                    leftGamepadColor : rl.Color = rl.BLACK

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.LEFT_THUMB) {
                        leftGamepadColor = rl.RED
                    }

                    rl.DrawCircle(319, 255, 35, leftGamepadColor)

                    rl.DrawCircle(319, 255, 31, rl.LIGHTGRAY)

                    rl.DrawCircle(319 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.LEFT_X) * 20), 255 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.LEFT_Y) * 20), 25, leftGamepadColor)

                    rightGamepadColor : rl.Color = rl.BLACK

                    if rl.IsGamepadButtonDown(gamepad, rl.GamepadButton.RIGHT_THUMB) {
                        rightGamepadColor = rl.RED
                    }

                    rl.DrawCircle(475, 255, 35, rl.BLACK)

                    rl.DrawCircle(475, 255, 31, rl.LIGHTGRAY)

                    rl.DrawCircle(475 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.RIGHT_X) * 20), 255 + (i32)(rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.RIGHT_Y) * 20), 25, rightGamepadColor)

                    rl.DrawRectangle(169, 48, 15, 70, rl.GRAY)

                    rl.DrawRectangle(611, 48, 15, 70, rl.GRAY)

                    rl.DrawRectangle(169, 48, 15, (i32)(((1 - rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.LEFT_TRIGGER)) / 2) * 70), rl.RED)

                    rl.DrawRectangle(611, 48, 15, (i32)(((1 - rl.GetGamepadAxisMovement(gamepad, rl.GamepadAxis.RIGHT_TRIGGER)) / 2) * 70), rl.RED)
                
                } else {

                    rl.DrawText("- GENERIC GAMEPAD -", 280, 180, 20, rl.GRAY)

                }

                rl.DrawText(rl.TextFormat("DETECTED AXIS [%i]:", rl.GetGamepadAxisCount(0)), 10, 50, 10, rl.MAROON)

                for i : i32 = 0; i < rl.GetGamepadAxisCount(0); i = i + 1 {

                    rl.DrawText(rl.TextFormat("AXIS %i: %.02f", i, rl.GetGamepadAxisMovement(0, auto_cast i)), 20, 70 + 20 * i, 10, rl.DARKGRAY)

                }

                if rl.GetGamepadButtonPressed() != rl.GamepadButton.UNKNOWN {
                    
                    rl.DrawText(rl.TextFormat("DETECTED BUTTON: %i", rl.GetGamepadButtonPressed()), 10, 430, 10, rl.RED)

                } else {

                    rl.DrawText("DETECTED BUTTON: NONE", 10, 430, 10, rl.GRAY)

                }

                

            } 
            else 
            {

                rl.DrawText(rl.TextFormat("GP%d: NOT DETECTED", gamepad), 10, 10, 10, rl.GRAY)

                rl.DrawTexture(texXboxPad, 0, 0, rl.LIGHTGRAY)

            }

        rl.EndDrawing()
       
    
}

    rl.UnloadTexture(texPs3Pad)
    rl.UnloadTexture(texXboxPad)


    rl.CloseWindow()
    

}