//
//  Tab.swift
//  SwiftApi-1
//
//  Created by Sarper Kececi on 26.10.2023.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        VStack {
            TabView {
               Empty()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Add")
                    }
                
                CourseScreen()
                     .tabItem {
                         Image(systemName: "person.fill")
                         Text("Add")
                     }
                
                
                
                
                
                
                
            }
          
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
