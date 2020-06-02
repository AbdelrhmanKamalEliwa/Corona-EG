//
//  AboutUsViewController.swift
//  Drinky
//
//  Created by Awady on 5/5/20.
//  Copyright © 2020 Ahmed Elawady. All rights reserved.
//

import UIKit
import MessageUI

class AboutUsViewController: UIViewController {
    
    internal var presenter: AboutUsViewControllerPresenter?
    @IBOutlet private weak var facebookButton: UIButton!
    @IBOutlet private weak var twitterButton: UIButton!
    @IBOutlet private weak var linkedinButton: UIButton!
    @IBOutlet private weak var githubButton: UIButton!
    @IBOutlet private weak var gmailButton: UIButton!
    @IBOutlet private weak var holderBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AboutUsViewControllerPresenter(view: self)
        setupCloseTouch()
        setupSocialMediaButtonsUI()
    }
    
    private func setupSocialMediaButtonsUI() {
        facebookButton.imageEdgeInsets = UIEdgeInsets(top: 42, left: 42, bottom: 42, right: 42)
        twitterButton.imageEdgeInsets = UIEdgeInsets(top: 42, left: 42, bottom: 42, right: 42)
        linkedinButton.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        githubButton.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        gmailButton.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
    }
    
    private func setupCloseTouch() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(self.closeTab(_:)))
        holderBackgroundView.addGestureRecognizer(closeTouch)
    }
    
    @objc private func closeTab(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func gotItPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func socilaMediaButtonTapped(_ sender: UIButton) {
        presenter?.goToSocialMediaAccount(sender.tag)
    }
}

// MARK: - Presenter Delegate
extension AboutUsViewController: AboutUsView {
    func openFacebook() {
        let url = URL(string: "http://facebook.com/KIMOKAMAL00")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openTwitter() {
        let url = URL(string: "https://twitter.com/KIMOKAMAL00")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openLinkedIn() {
        let url = URL(string: "https://www.linkedin.com/in/abdelrhmankamaleliwa/")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openGitHub() {
        let url = URL(string: "https://github.com/AbdelrhmanKamalEliwa")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func openGmail() {
        sendEmail()
    }
}

// MARK: - Creating Email
extension AboutUsViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        // Modify following variables with your text / recipient
        let recipientEmail = "abdelrhmankamaleliwa@email.com"
        let subject = "Corona EG Feedback"
        let body = "Write your feedback"

        // Show default mail composer
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)

            present(mail, animated: true)

        // Show third party email composer if default Mail app is not present
        } else if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
            UIApplication.shared.open(emailUrl)
        }
    }

    private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

        let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
        let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
        let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

        if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
            return gmailUrl
        } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
            return outlookUrl
        } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
            return yahooMail
        } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
            return sparkUrl
        }

        return defaultUrl
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
