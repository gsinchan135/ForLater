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

    private let nameLimit = 20
    private let descriptionLimit = 100

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Name (max 20 characters)", text: $name)
                        .onChange(of: name) { newValue in
                            if newValue.count > nameLimit {
                                name = String(newValue.prefix(nameLimit))
                            }
                        }
                        .multilineTextAlignment(.leading)
                        .autocapitalization(.none)

                    TextEditor(text: $description)
                        .frame(minHeight: 100)
                        .overlay(
                            Text("\(description.count)/\(descriptionLimit)")
                            /*
                                .foregroundColor(description.count > descriptionLimit ? .red : .secondary)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(UIColor.systemBackground).opacity(0.8))
                                .cornerRadius(8)
                                .offset(x: 0, y: -24)
                             */
                                .opacity(description.count > descriptionLimit ? 1.0 : 0.0)
                        )
                        .onChange(of: description) { newValue in
                            if newValue.count > descriptionLimit {
                                description = String(newValue.prefix(descriptionLimit))
                            }
                        }
                }

                Button("Done") {
                    if !name.isEmpty {
                        addItem(UserList(name: name, description: description))
                    }
                }
                .disabled(name.isEmpty)
            }
            .navigationTitle("Add Item")
        }
    }
}




