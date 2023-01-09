//
//  ViewController.swift
//  Storyboard1
//
//  Created by 강덕준 on 1/4/23.
//

import Lottie
import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    let titlelabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "파이팅!"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    let animationView : LottieAnimationView = {
        let animView = LottieAnimationView(name:"131859-karlitron")
        // 사각형을 만들기
        animView.frame = CGRect(x:0, y:0, width: 400, height: 400)
        
        // contentMode -> 이미지를 확대할건가 축소를 한건가?
        animView.contentMode = .scaleAspectFill
        return animView
    }()
    
    // 뷰가 생성이되었을 때를 뜻한다!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("############### ViewController")
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center

        // 애니메이션 실행--> closure를 이용하기에 self를 다 붙혀줘야된다
        animationView.play{(finish) in

            print("애니메이션이 끝났다")
            self.view.backgroundColor = .white

            // 애니메이션이 끝나면 superview에서 animainview를 제거한다.
            self.animationView.removeFromSuperview()

            self.view.addSubview(self.titlelabel)
            self.titlelabel.translatesAutoresizingMaskIntoConstraints = false
            self.titlelabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titlelabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
           
            
            if let url = URL(string: "https://www.naver.com") {
                let request = URLRequest(url: url)
                self.myWebView.load(request)
            }
        }
    }
}
