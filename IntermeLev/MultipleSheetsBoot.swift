//
//  MultipleSheetsBoot.swift
//  IntermeLev
//
//  Created by MacBook on 07.07.2022.
//

import SwiftUI

struct NewModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

/****
 The problem of multiple sheets is that when you try to make multiplesheets it will just upload the starting state of the sheet that added, so, to soleve this prblm we can use 3 ways:
 1 - use a binding
 2 - use multiple .sheets
 3 - use $item
 ****/
struct MultipleSheetsBoot: View {
    @State var selectedModel: NewModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = NewModel(title:"\(index)")
                    }
                    .frame(width: 150, height: 60)
                    .font(.title)
                    .background(.green)
                    .foregroundColor(.blue)
                    .cornerRadius(30)
                }
            }
            .sheet(item: $selectedModel) { model in
                nextScreen(selectedModel: model)
        }
        }
    }
}

struct nextScreen: View {
    //    @Binding var selectedModel: NewModel
    let selectedModel: NewModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBoot_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBoot()
    }
}
