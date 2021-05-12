//
//  WebSite.swift
//  MyGymglishApp
//
//  Created by DAGUIN Sébastien on 12/05/2021.
//

import Foundation
struct ListOfWebsiteGymhlish : Identifiable{
    var id  = UUID()
    var urlWebsite : String
}
struct WebSites {
    static let currentWebsites : [ListOfWebsiteGymhlish] = [ListOfWebsiteGymhlish(id: UUID(), urlWebsite: "https://www.gymglish.com/fr"),ListOfWebsiteGymhlish(id: UUID(), urlWebsite: "https://www.thewordofthemonth.com/fr/word/token"),ListOfWebsiteGymhlish(id: UUID(), urlWebsite: "https://apps.apple.com/us/developer/gymglish-a9/id513283726")]
}
