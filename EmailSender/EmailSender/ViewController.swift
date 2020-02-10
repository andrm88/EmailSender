//
//  ViewController.swift
//  EmailSender
//
//  Created by André Miranda on 10/02/20.
//  Copyright © 2020 Miranda. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    @IBAction func emailButtonTapped(_ sender: UIButton) {
    
    showMailComposer()
    }
    
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["address@example.com"])
        composer.setSubject("Hello!")
        composer.setMessageBody("Hello from Brazil!", isHTML: false)
        
        present(composer, animated: true, completion: nil)
    }
}
    
    extension ViewController: MFMailComposeViewControllerDelegate {
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            
            if let _ = error{
                controller.dismiss(animated: true)
            }
            
            switch result {
            case .cancelled:
                print("Cancelled!")
            case .failed:
                print("Failed to Sent")
            case .saved:
                print("Saved")
            case .sent:
                print("Email Sent")
            }
            
            controller.dismiss(animated: true)
            
        }
        
    }


