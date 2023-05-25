//
//  ViewController.swift
//  DemoUserDefault
//
//  Created by chuottp on 19/10/2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate{
    
    let firstDefault = UserDefaults.standard
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var btnRequestLocation: UIButton!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var btnGetData: UIButton!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveUserProfile()
        locationManager.delegate = self
        locationManager.distanceFilter = 15
        locationManager.requestAlwaysAuthorization()
    }
    
    @IBAction func btnRequestLocation(_ sender: UIButton) {
       // locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
      
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        lblLocation.text = "Vi tri: \(lastLocation?.coordinate.latitude) : \(lastLocation?.coordinate.longitude)"
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
    }
    
    
    @IBAction func btnChoosePhoto(_ sender: UIButton) {
        
        let imgPickerVC = UIImagePickerController()
        imgPickerVC.sourceType = .photoLibrary
        imgPickerVC.delegate = self
        present(imgPickerVC, animated: true, completion: nil) // hiển thị ablum ảnh lên
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil) //huỷ ablum ảnh khi đã chọn xong
        
        if let image = info[.originalImage] as? UIImage {
            imgAvatar.image = image
        }
            
    }
    
    func saveUserProfile() {
        firstDefault.set("Ho Chi Minh", forKey: "name")
        firstDefault.set("19/05/1890", forKey: "date")
        firstDefault.set("0969691630", forKey: "phone")
        
    }

    @IBAction func btnGetData(_ sender: UIButton) {
        getUserProfile()
    }
    
    func getUserProfile() {
        let userName = firstDefault.string(forKey: "name")
        lblUserName.text = userName
    }
    
}


