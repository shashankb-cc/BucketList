//
//  EditView.swift
//  BucketList
//
//  Created by Shashank B on 03/03/25.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: Location
    
    //we are using this in oreder to send the modoifioed tge location data object , since long press gives current location object and we modify it in editview , we have send back the edidted location object , but cant use binding it cant be done on options since selected location is optional we have to use onSave which return void in the closure of the content view we can get the new location object 
    var onSave: (Location) -> Void


    @State private var name: String
    @State private var description: String
    
    init(location: Location,onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave

        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description

                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
}

//#Preview {
//    EditView(location: .example)
//}
