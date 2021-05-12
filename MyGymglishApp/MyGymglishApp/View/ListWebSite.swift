//
//  ListWebSite.swift
//  MyGymglishApp
//
//  Created by DAGUIN Sébastien on 12/05/2021.
//

import SwiftUI
import SafariServices
struct ListWebSite: View {
    @State var isPresented = false
    @Binding var listWebSiteisPresented : Bool
    var body: some View {
        NavigationView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                
                List(0 ..< WebSites.currentWebsites.count){ item in
                    NavigationLink(
                        destination: SafariView(url: WebSites.currentWebsites[item].urlWebsite),
                        label: {
                            HStack {
                                Image(systemName: "globe").resizable().frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text(WebSites.currentWebsites[item].urlWebsite).popover(isPresented: $isPresented, content: {
                                    SafariView(url: WebSites.currentWebsites[item].urlWebsite)
                                })
                            }
                        })
                    }
            })
            .navigationBarItems(leading: Button(action: {
                listWebSiteisPresented = false
            }, label: {
                Image(systemName: "arrow.turn.up.left").resizable().frame(width: 30, height: 30, alignment: .topLeading)
            }), trailing: HStack{
                Image("gymglishlogo").resizable().frame(width: 20, height: 20, alignment: .leading).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                Text("List website Gymglish")
            })
            
        }
    }
}

struct ListWebSite_Previews: PreviewProvider {
    static var previews: some View {
        ListWebSite(listWebSiteisPresented: .constant(true))
    }
}
struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string :url)!)
    }

    func updateUIViewController(_ safariViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}
