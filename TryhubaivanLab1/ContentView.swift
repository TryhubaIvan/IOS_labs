//
//  ContentView.swift
//  TryhubaivanLab1
//
//  Created by stud on 10.09.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "tree")
                .imageScale(.large)
                .foregroundStyle(.black)
            Text("New TREE")
                .font(.subheadline)
                .bold(true)
            
            Button("Run Program")
                {
                    runProgram()
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
