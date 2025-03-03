//
//  ContentView.swift
//  BucketList
//
//  Created by Shashank B on 03/03/25.
//

import SwiftUI

struct User: Identifiable ,Comparable{
    let id = UUID()
    var firstName: String
    var lastName: String
    
    
    //operator overloading,
    static func <(lhs:User,rhs:User)->Bool {
        lhs.lastName < rhs.lastName
    }

}

struct ContentView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
//        .sorted{
//            $0.lastName < $1.lastName
//        }

    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ContentView()
}
