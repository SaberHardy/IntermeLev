//
//  MasksBootCamp.swift
//  IntermeLev
//
//  Created by MacBook on 07.07.2022.
//

import SwiftUI

struct MasksBootCamp: View {
    @State var rating: Int = 1
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1 ..< 6) { index in
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(rating >= index ? Color.yellow : Color.gray)
                    .onTapGesture {
                        withAnimation(.spring()){
                            rating = index
                        }
                        
                    }
            }
        }
    }
}

struct MasksBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        MasksBootCamp()
    }
}
