//
//  LongPressGestureBoot.swift
//  IntermeLev
//
//  Created by MacBook on 05.07.2022.
//

import SwiftUI

struct LongPressGestureBoot: View {
    @State private var isCompleted: Bool = false
    @State private var isSucess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill()
                .frame(height: 55)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.green)
            
            HStack {
                Text("Add")
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(.green)
                    .cornerRadius(20)
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50) { (isPressing) in
                            if isPressing {
                                withAnimation(.easeInOut(duration: 2)) {
                                    isCompleted = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSucess {
                                        withAnimation(.easeInOut) {
                                            isCompleted = false
                                        }
                                    }
                                }
                            }
                        } perform: {
                            withAnimation(.easeInOut) {
                                isSucess = true
                            }
            }
                
                Text("Minus")
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(.red)
                    .cornerRadius(20)
            }
            
        }
        
        //        Text(isCompleted ? "Completed" : "Not Completed")
        //            .padding()
        //            .padding(.horizontal)
        //            .background(isCompleted ? .green : .red)
        //            .cornerRadius(20)
        ////            .onTapGesture {
        ////                isCompleted.toggle()
        ////            }
        ////            .onLongPressGesture(perform: { isCompleted.toggle() })
        //            .onLongPressGesture(
        //                minimumDuration: 3.0,
        //                maximumDistance: 1){
        //                    isCompleted.toggle()
        //                }
    }
}

struct LongPressGestureBoot_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBoot()
    }
}
