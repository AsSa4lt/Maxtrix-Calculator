//
//  ContentView.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @StateObject var Data = Design()
    var body: some View {
        
        NavigationView{
            Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
                VStack{
                    Color(Data.ColorPanel).overlay(NavigationLink(destination: CommonMatrices(matrixA: MatrixA(), matrixB: MatrixB(), result: Result())) {
                        HStack{
                            Text("Common Matrices").foregroundColor(Color(Data.ColorTextPanel)).font(.largeTitle).padding(.leading, 10.0)
                        }
                        .padding(.trailing)
                    }).frame(width: UIScreen.main.bounds.size.width/1.1, height: 100.0).cornerRadius(10)
                    
                    Color(Data.ColorPanel).overlay(NavigationLink(destination: ModularMatrices(matrixA: MatrixAModular(), matrixB: MatrixBModular(), result: ResultModular())) {
                        HStack{
                            Text("Modular Matrices").foregroundColor(Color(Data.ColorTextPanel)).font(.largeTitle).padding(.leading, 10.0)
                        }
                        .padding(.trailing)
                    }).frame(width: UIScreen.main.bounds.size.width/1.1, height: 100.0).cornerRadius(10)
                    
                    Color(Data.ColorPanel).overlay(NavigationLink(destination: TutorialView()) {
                        HStack{
                            Text("Tutorial").foregroundColor(Color(Data.ColorTextPanel)).font(.largeTitle).padding(.leading, 10.0)
                        }
                        .padding(.trailing)
                    }).frame(width: UIScreen.main.bounds.size.width/1.1, height: 100.0).cornerRadius(10)
                    
                    
                    Color(Data.ColorPanel).overlay(NavigationLink(destination: SettingsView(Data: Data)) {
                        HStack{
                            Text("Settings").foregroundColor(Color(Data.ColorTextPanel)).font(.largeTitle).padding(.leading, 10.0)
                            Image("3").resizable()
                                .frame(width: 70, height: 70)
                        }
                        .padding(.trailing)
                    }).frame(width: UIScreen.main.bounds.size.width/1.1, height: 100.0).cornerRadius(10)
                    
                }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
