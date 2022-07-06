//
//  GeometryReader.swift
//  IntermeLev
//
//  Created by MacBook on 06.07.2022.
//

import SwiftUI

struct GeometryReaderBoot: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).minX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<10) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 20),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
//                    .background(.blue)
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
        
        
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(.blue)
//    // this code is not usefull, because when we use simulator the color is not looks like it tooks 60%, because of that we using Geometry reader
////                    .frame(width: UIScreen.main.bounds.width * 0.666)
//                    .frame(width: geometry.size.width * 0.6666)
//
//                Rectangle()
//                    .fill(.red)
//                    .frame(maxHeight: .infinity)
//
//            }.ignoresSafeArea()
//        }
    }
}

struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBoot()
            .previewInterfaceOrientation(.portrait)
    }
}
