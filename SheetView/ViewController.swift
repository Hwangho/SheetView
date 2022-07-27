//
//  ViewController.swift
//  SheetView
//
//  Created by 송황호 on 2022/07/27.
//

import UIKit


protocol SendDataDelegate {
    func reciveData(response: Int) -> Void
}

class ViewController: UIViewController, SendDataDelegate {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var sheetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    
    func setDesign() {
        sheetButton.backgroundColor = .orange
        sheetButton.tintColor = .black
        sheetButton.layer.cornerRadius = 10
        sheetButton.setTitle("Sheet!!", for: .normal)
    }

    @IBAction func tapSheetButton(_ sender: UIButton) {
        
        showSheetViewController()
    }

    
    func reciveData(response: Int) {
        mainLabel.text = "Cell\(response) 눌림"
    }
    
    
    
    func showSheetViewController() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: SheetViewController.identifier) as! SheetViewController
        
        
        vc.delegate = self
        
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .pageSheet
        
        
        /// 보여지는 sheetView를 중간 or 전체 , 아니면 중간 and 전체 다  보이게 할거냐~
        if let sheet = nvc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
           
            /// "sheet" present시 사용 가능한 Scroll을  "SheetViewController" 내부 Scroll 멈춤쇠 역할을 할 수 있는  용도로  확장할 것이냐?!?
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            
            /// 가로 화면 일 때 전체 화면 대신 Scroll 가능한 형태의 sheet로 뜨도록 설정!
            sheet.prefersEdgeAttachedInCompactHeight = true
            
            /// 처음 "sheetViewController"를 띄울 때 큰 화면으로 띄우고 싶다면!
            sheet.selectedDetentIdentifier = .large
            
            /// "sheetViewController" 밑 화면이 흐리게 띄우지 않고 싶을 때
            sheet.largestUndimmedDetentIdentifier = .medium
            
            /// 상단 -- 부여 잡는 부분 보이게 할것인지!
            sheet.prefersGrabberVisible = true
            
            /// sheet 의 cornerRadius 주기!
            sheet.preferredCornerRadius = 30
        }
        
        /// 화면 띄우기!
        self.present(nvc, animated: true)

    }

}

