//
//  UserGreetingLabel.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit

class UserGreetingLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.text = "Logged in, Hi ".localized() + (UserDefaults.standard.string(forKey: GlobalConstants.EMAIL_KEY) ?? "")
    }

}
