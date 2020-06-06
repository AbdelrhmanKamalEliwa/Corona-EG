//
//  EmergencyContactsViewControllerPresenter.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

// MARK: - Emergency Contacts View Protocol
protocol EmergencyContactsView: class {
    var presenter: EmergencyContactsViewControllerPresenter? { get set }
}

// MARK: - Emergency Contacts Cell View Protocol
protocol EmergencyContactsCellView {
    func displayContactName(_ name: String)
    func displayContactNumber(_ number: String)
}

class EmergencyContactsViewControllerPresenter {
    
    // MARK: - Properties
    private weak var view: EmergencyContactsView?
    private let contacts = EmergencyContacts().contacts
    
    // MARK: - init
    init(view: EmergencyContactsView?) {
        self.view = view
    }
    
    // MARK: - Methods
    func getContactsCount() -> Int {
        contacts.count
    }
    
    func cellConfiguration(cell: EmergencyContactsCellView, for index: Int) {
        let contact = contacts[index]
        let name = contact.contactName.localizedString()
        cell.displayContactName(name)
        let number = contact.contactNumber.localizedString()
        cell.displayContactNumber(number)
    }
    
    func didSelectRow(at index: Int) -> URL {
        let contact = contacts[index]
        let number = contact.contactNumber.localizedString()
        let url = URL(string: "telprompt://\(number)")!
        return url
    }
}
