//
//  ContentView.swift
//  ForLater
//
//  Created by Gregory Sin-Chan on 2023-12-16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var filter: String = ""
    @State private var myLists = [UserList]()
    @State private var isFormPresented = false


    var body: some View {

        VStack {
            Image(systemName: "book")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            HStack{
                Button("Add Item") {
                    isFormPresented.toggle()
                }
                .sheet(isPresented: $isFormPresented) {
                    FormView(addItem: { newItem in
                    myLists.append(newItem)
                    isFormPresented.toggle()
                    })
                }
                
            }
        
            
            NavigationStack{
                List{
                    Text("something")
                    Text("idk")
                }
            }.searchable(text: $filter)
            
                
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


