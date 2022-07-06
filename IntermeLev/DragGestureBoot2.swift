//
//  DragGestureBoot2.swift
//  IntermeLev
//
//  Created by MacBook on 06.07.2022.
//

import SwiftUI

struct DragGestureBoot2: View {
    // variable the value of offseted value screen width/height
    @State private var startingOffset: CGFloat = UIScreen.main.bounds.height * 0.8
    
    @State var currentDragOffset: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            MySubView()
                .offset(y: startingOffset)
                .offset(y: currentDragOffset)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffset = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if currentDragOffset < -150 {
                                    endingOffsetY = -startingOffset
                                }
                                else if endingOffsetY != 0 && currentDragOffset > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffset = 0
                            }
                        }
                )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DragGestureBoot2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBoot2()
    }
}

struct MySubView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "arrowtriangle.up.fill")
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
            //                        .padding(.top)
            
            Text("Sign up")
                .foregroundColor(.black)
                .font(.title)
                .bold()
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 70, height: 90)
                .foregroundColor(.red)
            Text("Some examples of descriptive text include: The sunset filled the entire sky with the deep color of rubies, setting the clouds ablaze. The waves crashed and danced along the shore, moving up and down in a graceful and gentle rhythm like they were dancing.")
                .padding()
            Text("Create an account".uppercased())
                .font(.title2)
                .bold()
                .padding()
                .background(.blue)
                .cornerRadius(20)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
