//
//  ContentView.swift
//  GoalsAppSwiftUI
//
//  Created by Артём Харченко on 04.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                //Slider
                
                Text("Hello")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bg").ignoresSafeArea())
            .preferredColorScheme(.dark)
            .navigationTitle("Aqua")
        }
    }
}
