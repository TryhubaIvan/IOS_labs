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
            Image(systemName: "global")
                .imageScale(.large)
                .foregroundStyle(.black)
            Text("Hello, world")
                .font(.subheadline)
                .bold(true)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
