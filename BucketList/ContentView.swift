//
//  ContentView.swift
//  BucketList
//
//  Created by Shashank B on 03/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Hello".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url,options: [.atomic,.completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
