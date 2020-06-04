//
//  EmergencyContactsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

protocol EmergencyContactsView: class {
    var presenter: EmergencyContactsViewControllerPresenter? { get set }
}

protocol EmergencyContactsCellView {
    func displayContactName(_ name: String)
    func displayContactNumber(_ number: String)
}

class EmergencyContactsViewControllerPresenter {
    private weak var view: EmergencyContactsView?
    private let contacts = EmergencyContacts().contacts
    
    init(view: EmergencyContactsView?) {
        self.view = view
    }
    
    func getContactsCount() -> Int {
        contacts.count
    }
    
    func cellConfiguration(cell: EmergencyContactsCellView, for index: Int) {
        let contact = contacts[index]
        let name = LocalizationSystem.sharedInstance.localizedStringForKey(key: contact.contactName, comment: "")
        cell.displayContactName(name)
        let number = LocalizationSystem.sharedInstance.localizedStringForKey(key: contact.contactNumber, comment: "")
        cell.displayContactNumber(number)
    }
    
    func didSelectRow(at index: Int) -> URL {
        let contact = contacts[index]
        let number = LocalizationSystem.sharedInstance.localizedStringForKey(key: contact.contactNumber, comment: "")
        let url = URL(string: "telprompt://\(number)")!
        return url
    }
}
