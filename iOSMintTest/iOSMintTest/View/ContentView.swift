//
//  ContentView.swift
//  iOSMintTest
//
//  Created by UNION on 15/02/2020.
//  Copyright © 2020 UNION. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var commitListVM = CommitListViewModel()
    
    var body: some View {
        NavigationView {
            List(self.commitListVM.commits, id: \.id) { commit in
                VStack {
                    Text(commit.sha)
                    Text(commit.message)
                    Text(commit.name)
                }
            }
            .id(UUID())
            .navigationBarTitle(Text("Commits"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
