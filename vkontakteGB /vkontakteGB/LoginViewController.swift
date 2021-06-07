//
//  LoginViewController.swift
//  vkontakteGB
//
//  Created by emil kurbanov on 21.04.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var logIn: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var labelVK: UILabel!
    @IBOutlet weak var lIN: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
        
        logIn.layer.cornerRadius = 7
        logIn.backgroundColor = #colorLiteral(red: 0, green: 0.5540418029, blue: 0.7768109441, alpha: 1)
        password.layer.cornerRadius = 7
        password.backgroundColor = #colorLiteral(red: 0, green: 0.5540444255, blue: 0.7768118382, alpha: 1)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "LoginSegue" else {
            return false
        }
        
        
        let isLoginPasswordCorrect =  logIn.text == "1" && password.text == "1"
        if isLoginPasswordCorrect {
            return true
        } else {
            showErrorAlert()
        }
        
        return false
    }
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { [weak self] _ in
            self?.password.text = ""
            self?.logIn.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func hideKeyboard() {
        scrollView?.endEditing(true)
    }
    @objc func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if logIn.text == "1" && password.text == "1" {
            print("Пароль верный!")
        } else {
            print("Пароль неверный! Повторите попытку.")
        }
    }
    
    func animate() {
        
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0,
                       options: [.repeat, .autoreverse],
                       animations: {
                        self.labelVK.frame.origin.x -= 100
                       })
        
        UIView.animate(withDuration: 1.5) {
            self.logIn.frame.origin.x += 100
        }
        
        UIView.animate(withDuration: 1.5) {
            self.password.frame.origin.x += 100
        }
        
        UIView.animate(withDuration: 1.5) {
            self.logIn.frame.origin.y -= 100
        }
        UIView.animate(withDuration: 1.5) {
            self.password.frame.origin.y += 100
        }
        UIView.animate(withDuration: 1.5, animations: {
            self.lIN.frame.origin.y += 100
        } ,  completion: { _ in
            UIView.animate(withDuration: 1.5) {
                self.lIN.tintColor = .magenta
            }
        })
    }
    
}




   


