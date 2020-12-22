//
//  SettingsBundleHelper.swift
//  Euskadi
//
//  Created by Aitor Zubizarreta Perez on 22/12/2020.
//  Copyright © 2020 Aitor Zubizarreta. All rights reserved.
//

import Foundation

class SettingsBundleHelper {
    
    // MARK: - Properties
    
    struct SettingsBundleKeys {
        static let AppVersionKey = "version_preference"
        static let BuildVersionKey = "build_preference"
    }
    
    // MARK: - Methods
    
    ///
    /// Sets the App Version in UserDefaults so that Settings.bundle can get the value.
    ///
    func setAppVersion() {
        let appVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        UserDefaults.standard.setValue(appVersion, forKey: SettingsBundleHelper.SettingsBundleKeys.AppVersionKey)
    }
    
    ///
    /// Sets the Build Version in UserDefaults so that Settings.bundle can get the value.
    ///
    func setBuildVersion() {
        let buildVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        UserDefaults.standard.setValue(buildVersion, forKey: SettingsBundleHelper.SettingsBundleKeys.BuildVersionKey)
    }
}
