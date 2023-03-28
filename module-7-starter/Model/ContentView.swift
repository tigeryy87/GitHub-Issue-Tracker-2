//
//  ContentView.swift
//  module-7-starter
//
//  Created by Andrew Binkowski on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var githubIssues: GitHubIssues
    
    // You need to run in simulator or do a Live Preview
    // for the data to load
    var body: some View {
        // https://www.hackingwithswift.com/quick-start/swiftui/adding-tabview-and-tabitem
        TabView {
            IssueTabView(state: "Open", issues: githubIssues.openIssues, icon: "envelope.open")
                .tabItem {
                    Label("Open", systemImage: "envelope.open")
                }
            IssueTabView(state: "Closed", issues: githubIssues.closedIssues, icon: "envelope")
                .tabItem {
                    Label("Closed", systemImage: "envelope")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(githubIssues: GitHubIssues())
    }
}

