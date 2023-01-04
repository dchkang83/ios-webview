//
//  WebView.swift
//  App1
//
//  Created by 강덕준 on 1/4/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL
    @Binding var showLoading: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(didStart: {
            showLoading = true
        }, didFinish: {
            showLoading = false
        })
    }
}


// context.coordinator를 사용할 때마다 mk 탐색 위임을 수행할 것
// TODO. 이벤트 관리???
class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    var didStart: () -> Void
    var didFinish: () -> Void

    init(didStart: @escaping () -> Void, didFinish: @escaping () -> Void) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    
    // TODO. 권한 탐색을 시작될 때마다, 리소스를 로드하거나 완료할 떄마다 (다운로드가 시작될 떄마다)
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    
    // TODO. 웹 페이지가 완전히 다운로드 되고 다운로드가 완료될 때마다 (웹뷰 로딩 완료 시)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    
    // 웹뷰 로딩 실패 시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
}
