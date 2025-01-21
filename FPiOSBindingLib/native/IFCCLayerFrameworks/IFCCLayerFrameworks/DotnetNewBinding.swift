//
//  DotNetBinding.swift
//  IFCCLayerFrameworks
//
//  Created by Muralidharan Sakthivel on 13/11/24.
//

import Foundation
import FPLoggerKit
import iFCCKit

@objc(DotnetNewBinding)
public class DotnetNewBinding : NSObject, iFCCInitializationDelegate, AttachDeviceDelegate, iFCCLaneDelegate, LaneStatusDelegate
{
    public func onLaneOpened(device: any iFCCKit.iFCCCardReaderDevice) {
        print("Lanopened")
    }
    
    public func onLaneClosed(laneId: String) {
        print("Lanclosed")
    }
    
    public func operationProgressUpdate(forOperationIdentifier operationIdentifier: any iFCCKit.iFCCOperationIdentifier, inLane lane: String, progressType: iFCCKit.OperationProgressType) {
        let status = OperationProgressTypeBridge.toString(progressType)
        ApplicationState.sharedInstance.operationStatus = status

    }
    
    public func operationApproved(response: any iFCCKit.POSResponse, operationIdentifier: any iFCCKit.iFCCOperationIdentifier, inLane lane: String) {
        print("Operation Aprroved")
    }
    
    public func operationDeclined(response: any iFCCKit.POSResponse, operationIdentifier: any iFCCKit.iFCCOperationIdentifier, inLane lane: String) {
        print("Operation declined")
    }
    
    public func operationFailed(forOperationIdentifier operationIdentifier: any iFCCKit.iFCCOperationIdentifier, inLane lane: String, error: any Error) {
        print("Operation failed")
    }
    
    public func operationCompleted(forOperationIdentifier operationIdentifier: any iFCCKit.iFCCOperationIdentifier, inLane lane: String) {
        print("Operation completed")
    }
    
    public func deviceReconnecting(lane: String) {
        print("deviceReconnecting")
    }
    
    public func deviceError(lane: String, error: any Error) {
        print("deviceReconnecting")
    }
    
    public func deviceDisconnected(lane: String) {
        print("deviceReconnecting")
    }
    
    public func deviceDisconnectedWhileBackgrounding(lane: String) {
        print("deviceReconnecting")
    }
    
    public func deviceConnected(lane: String) {
        print("deviceReconnecting")
    }
    
    public func requestBatteryStatusSucceeded(batteryStatus: any iFCCKit.DeviceBatteryStatus, inLane lane: String) {
        print("deviceReconnecting")
    }
    
    public func requestBatteryStatusFailed(error: any Error, inLane lane: String) {
        print("deviceReconnecting")
    }
    
    public func deviceResetSucceeded(lane: String) {
        print("deviceReconnecting")
    }
    
    public func deviceResetFailed(lane: String, error: any Error) {
        print("deviceReconnecting")
    }
    
    public func firmwareUpdateModeEntered(lane: String) {
        print("deviceReconnecting")
    }
    
    public func firmwareUpdateProgressUpdate(progressMessage: String, inLane lane: String) {
        print("deviceReconnecting")
    }
    
    public func firmwareUpdateSucceeded(lane: String) {
        print("deviceReconnecting")
    }
    
    public func firmwareUpdateFailed(inLane lane: String, error: any Error) {
        print("deviceReconnecting")
    }
    
    public func firmwareUpdateCanceled(inLane lane: String) {
        print("deviceReconnecting")
    }
    
    public func cardReadOperationResult(response: any iFCCKit.CardReadResponse, operationIdentifier: any iFCCKit.iFCCOperationIdentifier, inLane lane: String) {
        print("deviceReconnecting")
    }
    
    public func laneDelegateReleasing(lane: String) {
        print("deviceReconnecting")
    }

    public func onDeviceAttached(device: any iFCCKit.iFCCCardReaderDevice) {
        self.registerLaneDelegate()
        print("device attached")
    }
    
    public func onAttachDeviceError(deviceOptions: any iFCCKit.iFCCCardReaderDeviceOptions, error: any Error) {
        print("Getting the Error on Attach device ")
    }
    
    public func initializationCompleted() {
        print("initalized completed")
        
        connectDevice()
    }
    
    public func initializationFailed(error: any Error) {
        print("initializationFailed");
    }
    
    public func deinitializationCompleted() {
        print("deinitializationCompleted");
    }
    

    @objc
    public static func getString(myString: String) -> String {
        
        //var manager = LoggerManager()
    
        return myString  + " from actuall FreedomPay swift!"
    }

    @objc
    public static func InitializeLogger(port: Int, ipAddress: String) {
        
       
        ApplicationState.sharedInstance.ipAddress = ipAddress
        
        ApplicationState.sharedInstance.port = port
        
        let iFCCLoggingConfiguration =  iFCCLoggingConfiguration(outputs: [])
        
        do {
            var result =  try iFCC.sharedInstance.initializeLibrary(appSettingsData: DotnetNewBinding.generateAppSettingsXMLData(), loggingConfiguration: iFCCLoggingConfiguration, delegate: DotnetNewBinding())
            
            
            
            print(result);
        } catch {
            print("initializeLibrary")
        }

    }
    
   
    
    static func generateAppSettingsXMLData() -> Data {
        
        let xmlString = """
<configuration>    <merchant>        <storeID>1497149018</storeID>        <terminalID>2510930010</terminalID>        <esToken>KKF9C63BQ8X6DKKT4J7H9XVRV4XKTVGC</esToken>        <clientEnvironment>FreedomPay-iFCC</clientEnvironment>        <clerkID>A1234</clerkID>        <registerID>12345678</registerID>        <merchantNameShort>ACME Goods</merchantNameShort>        <merchantName>Acme Goods & Services</merchantName>        <addressOne>123 9th Street</addressOne>        <addressTwo>Philadelphia, PA 19103</addressTwo>        <amaActivationKey></amaActivationKey>        <amaProcessTimeInterval>325</amaProcessTimeInterval>    </merchant>    <clientApplication>        <clientApplicationName>iFCC</clientApplicationName>        <clientApplicationUser>iFCC-User</clientApplicationUser>    </clientApplication>    <iFccApplication>        <emailAddress></emailAddress>        <freewayURL>https://cs.uat.freedompay.com/Fasta/</freewayURL>        <binMapURL>https://manager.uat.freedompay.com/Map/BinMap.txt</binMapURL>        <binDataExpirationTimeInHours>24</binDataExpirationTimeInHours>        <networkConnectionTimeoutInSeconds>20</networkConnectionTimeoutInSeconds>        <quickServeFloorLimit>50</quickServeFloorLimit>        <transactionTimeoutInSeconds>90</transactionTimeoutInSeconds>        <tokenType>2</tokenType>        <assetManagementURL></assetManagementURL>        <enableAssetManagement>YES</enableAssetManagement>        <enableContactEMV>YES</enableContactEMV>        <enableContactlessEMV>YES</enableContactlessEMV>        <promptForTip>NO</promptForTip>        <tipPromptPercentages></tipPromptPercentages>        <emvLocale>US/CA</emvLocale>        <dccBinRangeUrl>https://manager.uat.freedompay.com/DCC/HFEX.TXT</dccBinRangeUrl>        <dccPromptLogic>BinExclude</dccPromptLogic>        <dccLocalCurrency>USD</dccLocalCurrency>        <dccLocalCurrencyCode>840</dccLocalCurrencyCode>        <dccParagraph1>My charges will be converted using the exchange rate at the end of the hotel stay without further consultation.</dccParagraph1>        <dccParagraph2>Currency conversion is provided by [clientName].</dccParagraph2>    </iFccApplication>    <offline>        <transactionRetryCount>100</transactionRetryCount>        <retainFailedTransactionsInDays>30</retainFailedTransactionsInDays>        <failureReplayTimeInMinutes>5</failureReplayTimeInMinutes>        <declineReplayTimeInMinutes>1440</declineReplayTimeInMinutes>        <failureRetryCount>10</failureRetryCount>        <floorLimit>150</floorLimit>        <failedTransactionReversalRetryLimit>3</failedTransactionReversalRetryLimit>        <offlineCheckFrequency>5</offlineCheckFrequency>        <declineReplayForceKeyed>YES</declineReplayForceKeyed>        <declineReplayForceKeyedCount>2</declineReplayForceKeyedCount>        <transactionReplayCount>500</transactionReplayCount>        <maxNumberOfDaysOffline>30</maxNumberOfDaysOffline>        <maxNumberOfOfflineTransactions>-1</maxNumberOfOfflineTransactions>    </offline>    <receipt>        <defaultLanguage>en</defaultLanguage>        <forceReceiptLanguage>NO</forceReceiptLanguage>        <format>US</format>        <width>40</width>        <marginLeft>0</marginLeft>        <marginRight>0</marginRight>        <header></header>        <footer>I agree to the terms of my credit agreement</footer>        <signatureDisclaimer></signatureDisclaimer>        <showSignatureLine>YES</showSignatureLine>        <showTip>NO</showTip>        <enableCardNotPresentReceiptText>NO</enableCardNotPresentReceiptText>        <dccDefaultDisclaimer>DCC Disclaimer - Default</dccDefaultDisclaimer>        <dccMCDisclaimer>DCC Disclaimer for MC</dccMCDisclaimer>        <dccVSDisclaimer>DCC Disclaimer for Visa</dccVSDisclaimer>        <dccPreAuthDisclaimer>DCC Disclaimer - PreAuth</dccPreAuthDisclaimer>    </receipt>    <device>        <deviceType>UPP</deviceType>    </device>    <currencySettings>        <currencyName>United States</currencyName>        <currencyIsoCode>USD</currencyIsoCode>        <currencyAsciiSymbol>$</currencyAsciiSymbol>        <currencyUtf8Symbol>$</currencyUtf8Symbol>        <currencyAfterDecimalDigits>2</currencyAfterDecimalDigits>        <currencyGroupSeparator>,</currencyGroupSeparator>        <currencyDecimalSeparator>.</currencyDecimalSeparator>        <currencyPlacement>left</currencyPlacement>        <currencyHasSpaceBetween>NO</currencyHasSpaceBetween>        <currencyGroupingSize>3</currencyGroupingSize>    </currencySettings></configuration> 
"""
        
        return xmlString.data(using: .utf8)!
    }
    
    
    
     func generateDeviceSettingsXMLData() -> Data? {
        
        let xmlString = "<settings><tetraData><keepAliveIntervalInSeconds>10</keepAliveIntervalInSeconds></tetraData></settings>"
        return xmlString.data(using: .utf8)!
    }

    
    func deviceOptions() -> iFCCCardReaderDeviceOptions? {
        var ipAddresss = ApplicationState.sharedInstance.ipAddress ?? ""
        
        var port =  ApplicationState.sharedInstance.port ?? 0000
        
        return NetworkDeviceOptions(deviceType: iFCCDeviceType.upp , hostAddress: ipAddresss, portNumber: UInt(port) , deviceData: generateDeviceSettingsXMLData())
    }
    
    
    ///Need to call straight away
    func connectDevice() {
        
        let options = deviceOptions()
        do {
            var deviceAttaching: ()? =  try? iFCC.sharedInstance.attachDevice(deviceOptions: options!, attachDeviceDelegate: self, timeoutInSecs: 180)
            if (deviceAttaching == nil ) {
                print("Error on Setup to attaching the device")
            }
        } catch {
            print("Not working ")
        }
        
    }
    
    ///Registering the lane
    func registerLaneDelegate() {
        do {
            try iFCC.sharedInstance.registerLaneDelegate(self, inLane: "1")
            print("**** lane delegate registration succeeded for lane: [\(ApplicationState.sharedInstance.laneIdentifier)] for [].")
        } catch let error {
            print("**** lane delegate registration failed for lane: [\(ApplicationState.sharedInstance.laneIdentifier)]. Error says: [\(error.localizedDescription)] for [].")
        }
    }


    func openLane(showSpinner: Bool) throws -> Bool {
        let sharedInstance = iFCC.sharedInstance
        var error: Error?

        do {
            let result = try sharedInstance.openLane(inLane: "1", laneStatusDelegate: self)
        } catch {
            
            
        }
       
        return true
    }

}


