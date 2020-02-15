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
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 30))
                        Text(commit.name)
                            .font(Font.custom("Gill Sans", size: 26))
                            Spacer()
                    }
                    Text(commit.message)
                        .font(Font.custom("Gill Sans", size: 18))
                    Text(commit.sha)
                        .foregroundColor(.red)
                        .font(Font.custom("Gill Sans", size: 14))
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
