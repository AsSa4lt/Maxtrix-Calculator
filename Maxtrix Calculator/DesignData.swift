//
//  DesignData.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import Foundation
import SwiftUI
class Design: ObservableObject {
    @AppStorage("background") var ColorBackgound: String = "back1"
    @AppStorage("text") var ColorText: String = "back9"
    @AppStorage("colorPanel") var ColorPanel: String = "back2"
    @AppStorage("colorMatrix") var ColorMatrix: String = "back8"
    @AppStorage("settings") var SettingImage: String = "1"
    @AppStorage("colorButton") var ColorButton: String = "back3"
    @AppStorage("colorTextButton") var ColorTextButton: String = "back1"
    @AppStorage("colorOverlayRectangle") var ColorOverlayRectangle: String = "back3"
    @AppStorage("colorTextPanel") var ColorTextPanel: String = "back1"
}
