//
//  View.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 29/09/2022.
//

import UIKit
import WebKit

class WebSideView : UIViewController{
    
   override func viewDidLoad() {
         super.viewDidLoad()
         
       let webView = WKWebView(frame: view.frame)
       view.addSubview(webView)
       
         let myURL = URL(string:"https://www.apple.com")
         let myRequest = URLRequest(url: myURL!)
         webView.load(myRequest)
     }
}
