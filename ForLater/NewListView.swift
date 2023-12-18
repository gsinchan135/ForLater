//
//  NewListView.swift
//  ForLater
//
//  Created by Gregory Sin-Chan on 2023-12-17.
//

import SwiftUI

struct FormView: View {
    @State private var name = ""
    @State private var description = ""
    var addItem: (UserList) -> Void

    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $description)
            /*
             Section(header: Text("Item Details")) {
             TextField("Name", text: $name)
             TextField("Description", text: $description)
             }
             
             
             Button("Done") {
             addItem(UserList(name: name, description: description))
             }
             }
             */
            //.navigationTitle("Add Item")
        }
    }
}



