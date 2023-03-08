//
//  ContentView.swift
//  ShimmerDemo
//
//  Created by Andrew Carter on 3/6/23.
//

import SwiftUI
import Shimmer

struct ContentView: View {
    
    @State var shouldRedact = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle")
                VStack {
                    Text("Here is some large text")
                        .font(.title)
                        .shimmers()
                        .redacted(reason: shouldRedact ? .placeholder : [])
                    HStack {
                        Spacer()
                        Text("Text One")
                        Spacer()
                        Text("Text Two")
                        Spacer()
                        Text("Text Three")
                        Spacer()
                    }
                }
            }
            .padding(20.0)
            .shimmers()
            .redacted(reason: shouldRedact ? .placeholder : [])
            
            Button("Redact") {
                shouldRedact.toggle()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
