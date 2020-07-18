//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Scott Garvey on 7/13/20.
//  Copyright © 2020 Scott Garvey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
 
    Text("Hello World")
        .blueTitled()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct blueTitle: ViewModifier {
   
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
    
}

extension View {
    func blueTitled() -> some View {
        self.modifier(blueTitle())
    }
}
