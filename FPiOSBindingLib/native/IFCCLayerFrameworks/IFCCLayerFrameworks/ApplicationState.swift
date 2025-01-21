//
//  ApplicationState.swift
//  IFCCLayerFrameworks
//
//  Created by Muralidharan Sakthivel on 21/01/25.
//

import Foundation
import iFCCKit

import Foundation

enum FCCInitializationStatus: Int {
    case deInitialized = 0
    case initializing
    case initialized
    case deInitializing
}

enum FCCDeviceStatus: Int {
    case detached = 0
    case detaching
    case attachedLaneClosed
    case attaching
    case reattaching
    case reconnecting
    case disconnected
    case opened
    case opening
    case closing
    case setupDevice
    case resetting
}

class ApplicationState {
    static let sharedInstance = ApplicationState()

    var initializationStatus: FCCInitializationStatus
    var laneIdentifier: String?
    var binStatusText: String?
    var binDateLastUpdatedText: String?
    var dccBinStatusText: String?
    var dccBinDateLastUpdatedText: String?
    var deviceBatteryStatus: DeviceBatteryStatus?
    var settingsUpdated: Bool
    var requestInitialization: Bool
    var requestDeviceConnectionOptions: Bool
    var clientDeviceId: String?
    var defaultLocale: Locale?
    var posStoredRequest: PosStoredTransactionRequest?
    var isUsingConnectivityUtility: Bool
    var deviceStatus: FCCDeviceStatus
    var isOperationInProgress: Bool
    var operationStatus: String?
    
    var ipAddress: String?
    
    var port: Int?

    private init() {
        self.initializationStatus = FCCInitializationStatus(rawValue: 0)!
        self.settingsUpdated = false
        self.requestInitialization = false
        self.requestDeviceConnectionOptions = false
        self.isUsingConnectivityUtility = false
        self.isOperationInProgress = false
        self.deviceStatus = FCCDeviceStatus(rawValue: 0)!
    }

    func isAttached() -> Bool {
        // Implement the logic for checking if attached
        return false
    }

    func isLaneOpen() -> Bool {
        // Implement the logic for checking if the lane is open
        return false
    }
}
