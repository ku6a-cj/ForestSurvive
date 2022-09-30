//
//  News.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 30/09/2022.
//

import SwiftUI

struct News: View {
    var body: some View {
        WebView(url: URL(string: "https://www.wojsko-polskie.pl/wat/articles/list/aktualnosci-w/")!)
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        News()
    }
}
