//
//  SorrySheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import SwiftUI

struct SorrySheet: View {
    @StateObject var Data = Design()
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
            Text("Sorry, but now it is impossible to get step by step inverze matrix bigger than 6\u{00D7}6").multilineTextAlignment(.center)).foregroundColor(Color(Data.ColorText)).font(.title)
    }
}

struct SorrySheet_Previews: PreviewProvider {
    static var previews: some View {
        SorrySheet()
    }
}
