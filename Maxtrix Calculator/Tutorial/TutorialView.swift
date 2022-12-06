//
//  TutorialView.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

struct TutorialView: View {
    @StateObject var Data = Design()
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
            ScrollView{
                VStack{
                    Text("Tutorial").foregroundColor(Color(Data.ColorText)).font(.largeTitle)
                    Group{
                        Text("Type of Matrices").foregroundColor(Color(Data.ColorText)).font(.title).padding(.top, 0.0)
                        Text("It is allowed to use two types of matrices:").foregroundColor(Color(Data.ColorText)).font(.title2).multilineTextAlignment(.center)
                        Text("1. Common matrices, that can use all rational numbers").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                        Text("2. Modular matrices, with modular Arithmetic over a Matrix that can only numbers from 1 to n-1, where n is a modulo").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                    }
                    .padding(.top, 0.0)
                    Group{
                        Text("Operations with Matrices").foregroundColor(Color(Data.ColorText)).font(.title).padding(.top)
                        Text("You can use all operations with both types of matrices:").foregroundColor(Color(Data.ColorText)).font(.title2).multilineTextAlignment(.center)
                        Group{
                            Text("1. Transpose").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("2. Addition").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("3. Subtraction").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("4. Multiplication").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("5. Inverse operation").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("6. Find a commutator of two matrices").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("7. Swap matrices").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("8. Use result for next steps of solution").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                            Text("9. Clear one of matrices").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                        }
                    }
                    Group{
                        Text("Step-by-step solution").foregroundColor(Color(Data.ColorText)).font(.title).padding(.top)
                        Text("For every operation you can take a look for a step-by-step solution, if you don't understand how the result was obtained").foregroundColor(Color(Data.ColorText)).font(.headline).multilineTextAlignment(.center)
                    }
                }
            }
        )
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
