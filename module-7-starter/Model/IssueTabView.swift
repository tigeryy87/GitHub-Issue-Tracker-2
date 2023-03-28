//
//  IssueTabView.swift
//  module-7-starter
//
//  Created by Yin-Lin Chen on 2023/2/21.
//


import SwiftUI

struct IssueTabView: View {
    var state: String
    var issues: [GitHubIssue]
    var icon: String
    
    var body: some View {
        NavigationView {
            List (issues) { item in
                NavigationLink {
                    IssueDetail(issue: item, icon: icon)
                } label: {
                    Image(systemName: icon)
                    
                    VStack(alignment: .leading) {
                        Text(item.title ?? "😢")
                            .fontWeight(.bold)
                            .lineLimit(2)
                        Text("@" + item.user.login)
                    }
                    .padding()
                }
            }
            .navigationBarTitle(state + " Issues")
            
        }
        // https://medium.com/swlh/custom-navigationview-bar-in-swiftui-4b782eb68e94
        .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
    }
}

struct IssueTabView_Previews: PreviewProvider {
    static var previews: some View {
        IssueTabView(state: "Open", issues: testData, icon: "envelope")
        
    }
}

struct NavigationBarColor: ViewModifier {

  init(backgroundColor: UIColor, tintColor: UIColor) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
                   
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
  }

  func body(content: Content) -> some View {
    content
  }
}
extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}
