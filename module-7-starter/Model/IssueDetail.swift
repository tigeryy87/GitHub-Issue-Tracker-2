//
//  IssueDetail.swift
//  module-7-starter
//
//  Created by Yin-Lin Chen on 2023/2/21.
//

import SwiftUI

struct IssueDetail: View {
    var issue: GitHubIssue
    var icon: String
    
    var body: some View {
        // https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
        ScrollView {
            VStack(alignment: .leading) {
                Text(issue.title ?? "😢")
                    .font(.largeTitle)
                    
                HStack {
                    // https://developer.apple.com/documentation/swiftui/asyncimage
                    AsyncImage(url: URL(string: issue.user.avatarUrl ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "person")
                    }
                    .frame(width: 50, height: 50)
                    // https://developer.apple.com/tutorials/swiftui/creating-and-combining-views
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.black, lineWidth: 4)
                    }
                    
                    Text("User: " + "@" + issue.user.login)
                }
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.green)
                        
                    Text("Date: " + formatDate(dateInput: issue.createdAt))
                }
                Text("Description")
                    .font(.largeTitle)
                    .padding()
                Text(issue.body ?? "😢")
                    
            }
            .padding()
        }
    }
    func formatDate(dateInput: String?) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM dd, yyyy"
        
        if let date = dateFormatterGet.date(from: dateInput ?? "") {
            return dateFormatterPrint.string(from: date)
        } else {
            return "😢"
        }
        
    }
}



struct IssueDetail_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetail(issue: testData[0], icon: "envelope")
    }
}
