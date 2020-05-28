//
//  EmergencyNumbers.swift
//  Corona-EG
//
//  Created by Abdelrhman Eliwa on 5/27/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class EmergencyContacts {
    let contacts: [Contact] = [
        Contact(contactName: "contact_name_1", contactNumber: "contact_number_1"),
        Contact(contactName: "contact_name_2", contactNumber: "contact_number_2"),
        Contact(contactName: "contact_name_3", contactNumber: "contact_number_3")
    ]
}

struct Contact {
    let contactName: String
    let contactNumber: String
}
