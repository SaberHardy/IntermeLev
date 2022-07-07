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
        HStack {
            ForEach(1 ..< 6) { index in
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(rating >= index ? Color.yellow : Color.gray)
                    .onTapGesture {
                        rating = index
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
