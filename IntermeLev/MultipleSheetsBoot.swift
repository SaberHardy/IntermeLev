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
    @State var selectedModel: NewModel = NewModel(title: "First Title")
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
//                selectedModel = NewModel(title: "One")
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet, content: {
                nextScreen(
                    selectedModel: NewModel(title: "One sheet"))
            })
            .frame(width: 150, height: 60)
            .font(.largeTitle)
            .background(.green)
            .foregroundColor(.blue)
            .cornerRadius(30)
            
            Button("Button 2") {
//                selectedModel = NewModel(title: "Two")
                
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                nextScreen(
                    selectedModel: NewModel(title: "Two sheet"))
            })
            .frame(width: 150, height: 60)
            .font(.largeTitle)
            .background(.green)
            .foregroundColor(.blue)
            .cornerRadius(30)
        }
//        .sheet(isPresented: $showSheet, content: {
//            nextScreen(selectedModel: $selectedModel)
//        })
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
