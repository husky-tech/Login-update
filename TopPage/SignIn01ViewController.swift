//
//  SignIn01ViewController.swift
//  TopPage
//
//  Created by 小田光樹 on 2018/04/05.
//  Copyright © 2018年 Koki. All rights reserved.
//

import UIKit
import Firebase

class SignIn01ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pfImage: UIImageView!
    @IBOutlet weak var pfName: UITextField!
    @IBOutlet weak var pfAge: UITextField!
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPass: UITextField!
    
    let ref = Database.database().reference()
    let storage = Storage.storage()
    
    
    
    var pickerView: UIPickerView = UIPickerView()
    var ageArray = ["15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60"]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pfAge.delegate = self
        pfName.delegate = self
        inputEmail.delegate = self
        inputPass.delegate = self
      
        pfAge.frame.size.height = 40
        pfName.frame.size.height = 40
        inputEmail.frame.size.height = 40
        inputPass.frame.size.height = 40
        
        pfAge.placeholder = "age"
        pfName.placeholder = "full Name"
        inputEmail.placeholder = "email"
        inputPass.placeholder = "password"
        
        pfImage.layer.cornerRadius = pfImage.layer.bounds.width/2
        pfImage.clipsToBounds = true
        
        //pickerView1
        pickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: pickerView.bounds.size.height)
        pickerView.tag = 1             // <<<<<<<<<<　追加
        pickerView.delegate = self
        pickerView.dataSource = self
        let vi1 = UIView(frame: pickerView.bounds)
        vi1.backgroundColor = UIColor.white
        vi1.addSubview(pickerView)
        pfAge.inputView = vi1
        
        //PickerViewの右上のDoneボタン
        let toolBar1 = UIToolbar()
        toolBar1.barStyle = UIBarStyle.default
        toolBar1.isTranslucent = true
        toolBar1.tintColor = UIColor.black
        let doneButton1   = UIBarButtonItem(title: "Done",
                                            style: UIBarButtonItemStyle.done,
                                            target: self,
                                            action: #selector(SignIn01ViewController.donePressed))
        let spaceButton1  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace,
                                            target: nil,
                                            action: nil)
        toolBar1.setItems([spaceButton1, doneButton1], animated: false)
        toolBar1.isUserInteractionEnabled = true
        toolBar1.sizeToFit()
        pfAge.inputAccessoryView = toolBar1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveAndNextButton(_ sender: Any) {
        
        let storageRef = storage.reference()
        let imageStorage = storageRef.child("ProfileImage")
        
        
    }
    
    
    func transitionToSituation() {
        performSegue(withIdentifier: "toSituation", sender: self)
    }
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        //カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //UIImagePickerControllerをインスタンス化
            let pickerView = UIImagePickerController()
            //写真の選択元をカメラロールにする
            //「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            //デリゲート
            pickerView.delegate = self
            //ビューに表示
            self.present(pickerView, animated: true, completion: nil)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func donePressed() {
        view.endEditing(true)
    }
    
}



extension SignIn01ViewController: UIImagePickerControllerDelegate {
    //写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //選択した写真を取得する
        let image = info[UIImagePickerControllerOriginalImage]as! UIImage
        let imageUrl = info[UIImagePickerControllerImageURL]as! URL
        print(imageUrl)

        //ビューに表示する
        self.pfImage.image = image
        //写真を選ぶビューを引っ込める
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SignIn01ViewController: UINavigationControllerDelegate {}

extension SignIn01ViewController:UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pfAge.text = ageArray[row]
    }
}


extension SignIn01ViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageArray.count
    }
    
}









