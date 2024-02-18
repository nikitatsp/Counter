//
//  ViewController.swift
//  Counter
//
//  Created by Никита Цепляев on 17.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var count: Int = 0
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textView.text = "История изменений: "
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
//        Выполняю расчет размера экрана, чтобы сделать нормальный размер шрифта для каждого устройства
        
        let safeAreaWidth = view.safeAreaLayoutGuide.layoutFrame.width
        print(safeAreaWidth)
        
        label.font = UIFont.systemFont(ofSize: safeAreaWidth / 15)
        textView.font = UIFont.systemFont(ofSize: safeAreaWidth / 29)
    }
    
    
    @IBAction func buttonTapPlus(_ sender: Any) {
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
    
    
    @IBAction func buttonTapMinus(_ sender: Any) {
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
    
    
    @IBAction func buttonTapZero(_ sender: Any) {
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

