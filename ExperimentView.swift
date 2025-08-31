//
//  ExperimentView.swift
//  ToDoApp
//
//  Created by Dave Cassidy on 8/31/25.
//

import SwiftUI

struct ExperimentView: View {
    var body: some View {
        VStack{
            
            Text("This is a Text view")
                .padding()
            List {
                Text("List item 1")
                Text("List item 2")
            }
            Button("Click Me"){
                print("Button Tapped!")
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
        }
    }
}

struct ExperimentView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentView()
    }
}

