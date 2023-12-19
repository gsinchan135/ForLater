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
        
            
            NavigationStack{
                List(myLists){ UserList in
                    VStack(alignment: .leading){
                        Text(UserList.name)
                            .font(.title)
                        Text(UserList.description)
                            .font(.subheadline)
                                        }
                }
            }.searchable(text: $filter)
            
            Button("Add Item") {
                isFormPresented.toggle()
            }
            .sheet(isPresented: $isFormPresented) {
                FormView(addItem: { newItem in
                    myLists.append(newItem)
                    isFormPresented.toggle()
                }/*, onCancel: {
                    isFormPresented.toggle()
                })
              )   */)
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


