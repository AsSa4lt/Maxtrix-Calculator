//
//  SettingsView.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var Data: Design
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
            VStack{
                Text("Settings").foregroundColor(Color(Data.ColorText)).font(.largeTitle).padding(.bottom)
                Text("Color theme").foregroundColor(Color(Data.ColorText)).font(.title).padding(.top, 0.0)
                HStack{
                    VStack{
                        Text("Dark theme").foregroundColor(Color(Data.ColorText)).font(.title2).padding(.top, 0.0)
                        Image("theme1").resizable().frame(width: 100, height: 100)
                        Button("Set") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            Data.ColorBackgound = "back9"
                            Data.ColorText = "back7"
                            Data.ColorPanel = "back2"
                            Data.ColorMatrix = "back10"
                            Data.ColorButton = "back10"
                            Data.ColorTextButton = "back1"
                            Data.ColorTextPanel = "back1"
                        }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                    }
                    VStack{
                        Text("Light theme").foregroundColor(Color(Data.ColorText)).font(.title2).padding(.top, 0.0)
                        Image("theme2").resizable().frame(width: 100, height: 100)
                        Button("Set") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            Data.ColorBackgound = "back1"
                            Data.ColorText = "back9"
                            Data.ColorPanel = "back2"
                            Data.ColorMatrix = "back8"
                            Data.ColorButton = "back3"
                            Data.ColorTextButton = "back1"
                            Data.ColorTextPanel = "back1"
                        }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                    }
                }
                
                Button("If app crashes, click it") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    Result().data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
                    Result().rows = 3
                    Result().columns = 3
                    Result().lastOpeation = 0
                    Result().mistake = "ok"
                    MatrixA().data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
                    MatrixA().rows = 3
                    MatrixA().columns = 3
                    MatrixB().data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
                    MatrixB().rows = 3
                    MatrixB().columns = 3
                }.frame(width: UIScreen.main.bounds.size.width/2).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                
                Text("For all comments and suggestions, please contact the developer").foregroundColor(Color(Data.ColorText)).font(.title).multilineTextAlignment(.center).padding(.top, 10.0)
                Spacer()
            }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(Data: Design())
    }
}
