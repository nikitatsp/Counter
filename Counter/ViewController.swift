//
//  ViewController.swift
//  Counter
//
//  Created by Никита Цепляев on 17.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var label: UILabel!
    var count: Int = 0
    
    
    @IBOutlet weak private var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        textView.text = "История изменений: "
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let safeAreaWidth = view.safeAreaLayoutGuide.layoutFrame.width
        
        label.font = UIFont.systemFont(ofSize: safeAreaWidth / 15)
        textView.font = UIFont.systemFont(ofSize: safeAreaWidth / 29)
    }
    
    
    @IBAction private func buttonTapPlus(_ sender: Any) {
        count += 1
        label.text = "Значение счетчика: \(count)"
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: currentDate)
        if let existingText = textView.text {
            textView.text = "\(existingText) \n\(dateString):значение изменено на +1"
        }
    }
    
    
    @IBAction private func buttonTapMinus(_ sender: Any) {
        count -= 1
        if count < 0 {
            count = 0
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: currentDate)
            if let existingText = textView.text {
                textView.text = "\(existingText) \n\(dateString):попытка уменьшить значение счётчика ниже 0"
            }
        } else {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let dateString = dateFormatter.string(from: currentDate)
            if let existingText = textView.text {
                textView.text = "\(existingText) \n\(dateString):значение изменено на -1"
            }
        }
        label.text = "Значение счетчика: \(count)"
    }
    
    
    @IBAction private func buttonTapZero(_ sender: Any) {
        count = 0
        label.text = "Значение счетчика: \(count)"
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: currentDate)
        if let existingText = textView.text {
            textView.text = "\(existingText) \n\(dateString):значение сброшено"
        }
    }
}

