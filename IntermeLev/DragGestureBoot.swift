//
//  DragGestureBoot.swift
//  IntermeLev
//
//  Created by MacBook on 06.07.2022.
//

import SwiftUI

struct DragGestureBoot: View {
    
    @State var offset: CGSize = .zero // equal to CGSize(heigth:0, width: 0)
    
    var body: some View {
        ZStack {
            VStack {
                Text("offset: \(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width:300, height: 500)
                .foregroundColor(.green)
                .offset(offset)
                .scaleEffect(getScaleEffectAmount())
                .rotationEffect(Angle(degrees: getrotation()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // we can use it without animation
    //                        withAnimation(.spring()) {
                                offset = value.translation
    //                        }
                        }
                    
                        .onEnded { value in
                            withAnimation(.spring()) {
                            offset = .zero
                        }
                    }
            )
        }
    }
    func getScaleEffectAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        
        return 1 - min(percentage, 0.4) * 0.5
    }
    
    func getrotation() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentatge = currentAmount / max
        let percantageAsDouble = Double(percentatge)
        let maxAngle: Double = 10
        return percantageAsDouble * maxAngle
        
    }
}

struct DragGestureBoot_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBoot()
    }
}
