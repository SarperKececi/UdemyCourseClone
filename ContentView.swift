//
//  ContentView.swift
//  SwiftApi-1
//
//  Created by Sarper Kececi on 25.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    var body: some View {
        NavigationView {
            VStack {
                if(isLogin == true) {
                   Tab()
                } else {
                    LoginScreen()
                }
                
               
            }
        }
      
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
