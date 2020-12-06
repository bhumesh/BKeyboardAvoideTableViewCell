//
//  ViewController.swift
//  BKeyboardAvoideTableViewCell
//
//  Created by BhumeshwerKatre on 06/12/20.
//  Copyright © 2020 BhumeshwerKatre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textFieldsContent: [String] = ["", "", "", "", "", "", "", "", "", ""]
    @IBOutlet weak var aTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
    private func configureTableView() {
        aTableView.delegate = self
        aTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            aTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + aTableView.rowHeight, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        aTableView.contentInset = .zero
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textFieldsContent.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = aTableView.dequeueReusableCell(withIdentifier: TextFieldCell.cellID, for: indexPath) as? TextFieldCell else {
            return UITableViewCell()
        }
        cell.aTextField.delegate = self
        cell.aTextField.text = textFieldsContent[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
