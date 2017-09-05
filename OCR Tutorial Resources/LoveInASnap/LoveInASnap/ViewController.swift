//
//  ViewController.swift
//  LoveInASnap
//
//  Created by Lyndsey Scott on 1/11/15
//  for http://www.raywenderlich.com/
//  Copyright (c) 2015 Lyndsey Scott. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var findTextField: UITextField!
  @IBOutlet weak var replaceTextField: UITextField!
  @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
  
  var activityIndicator:UIActivityIndicatorView!
  var originalTopMargin:CGFloat!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    originalTopMargin = topMarginConstraint.constant
  }
  
  @IBAction func takePhoto(_ sender: AnyObject) {
  }
  
  @IBAction func swapText(_ sender: AnyObject) {
    
  }
  
  @IBAction func sharePoem(_ sender: AnyObject) {
    
  }
  
  
  // Activity Indicator methods
  
  func addActivityIndicator() {
    activityIndicator = UIActivityIndicatorView(frame: view.bounds)
    activityIndicator.activityIndicatorViewStyle = .whiteLarge
    activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.25)
    activityIndicator.startAnimating()
    view.addSubview(activityIndicator)
  }
  
  func removeActivityIndicator() {
    activityIndicator.removeFromSuperview()
    activityIndicator = nil
  }
  
  
  // The remaining methods handle the keyboard resignation/
  // move the view so that the first responders aren't hidden
  
  func moveViewUp() {
    if topMarginConstraint.constant != originalTopMargin {
      return
    }
    
    topMarginConstraint.constant -= 135
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })
  }
  
  func moveViewDown() {
    if topMarginConstraint.constant == originalTopMargin {
      return
    }

    topMarginConstraint.constant = originalTopMargin
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
      self.view.layoutIfNeeded()
    })

  }
  
  @IBAction func backgroundTapped(_ sender: AnyObject) {
    view.endEditing(true)
    moveViewDown()
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    moveViewUp()
  }
  
  @IBAction func textFieldEndEditing(_ sender: AnyObject) {
    view.endEditing(true)
    moveViewDown()
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    moveViewDown()
  }
}

extension ViewController: UIImagePickerControllerDelegate {

}
