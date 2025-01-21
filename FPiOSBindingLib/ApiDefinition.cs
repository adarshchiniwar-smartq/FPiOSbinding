using System;
using Foundation;

namespace FPiOSBindingLib {

    // The first step to creating a binding is to add your native framework ("MyLibrary.xcframework")
    // to the project.
    // Open your binding csproj and add a section like this
    // <ItemGroup>
    //   <NativeReference Include="MyLibrary.xcframework">
    //     <Kind>Framework</Kind>
    //     <Frameworks></Frameworks>
    //   </NativeReference>
    // </ItemGroup>
    //
    // Once you've added it, you will need to customize it for your specific library:
    //  - Change the Include to the correct path/name of your library
    //  - Change Kind to Static (.a) or Framework (.framework/.xcframework) based upon the library kind and extension.
    //    - Dynamic (.dylib) is a third option but rarely if ever valid, and only on macOS and Mac Catalyst
    //  - If your library depends on other frameworks, add them inside <Frameworks></Frameworks>
    // Example:
    // <NativeReference Include="libs\MyTestFramework.xcframework">
    //   <Kind>Framework</Kind>
    //   <Frameworks>CoreLocation ModelIO</Frameworks>
    // </NativeReference>
    // 
    // Once you've done that, you're ready to move on to binding the API...
    //
    // Here is where you'd define your API definition for the native Objective-C library.
    //
    // For example, to bind the following Objective-C class:
    //
    //     @interface Widget : NSObject {
    //     }
    //
    // The C# binding would look like this:
    //
    //     [BaseType (typeof (NSObject))]
    //     interface Widget {
    //     }
    //
    // To bind Objective-C properties, such as:
    //
    //     @property (nonatomic, readwrite, assign) CGPoint center;
    //
    // You would add a property definition in the C# interface like so:
    //
    //     [Export ("center")]
    //     CGPoint Center { get; set; }
    //
    // To bind an Objective-C method, such as:
    //
    //     -(void) doSomething:(NSObject *)object atIndex:(NSInteger)index;
    //
    // You would add a method definition to the C# interface like so:
    //
    //     [Export ("doSomething:atIndex:")]
    //     void DoSomething (NSObject object, nint index);
    //
    // Objective-C "constructors" such as:
    //
    //     -(id)initWithElmo:(ElmoMuppet *)elmo;
    //
    // Can be bound as:
    //
    //     [Export ("initWithElmo:")]
    //     NativeHandle Constructor (ElmoMuppet elmo);
    //
    // For more information, see https://aka.ms/ios-binding
    //
    [BaseType(typeof(NSObject))]
    //
    interface DotnetNewBinding
    {
        // -(void)onLaneOpenedWithDevice:(id<iFCCCardReaderDevice> _Nonnull)device;
        [Export("onLaneOpenedWithDevice:")]
        void OnLaneOpenedWithDevice(iFCCCardReaderDevice device);

        // -(void)onLaneClosedWithLaneId:(NSString * _Nonnull)laneId;
        [Export("onLaneClosedWithLaneId:")]
        void OnLaneClosedWithLaneId(string laneId);

        // -(void)operationProgressUpdateForOperationIdentifier:(id<iFCCOperationIdentifier> _Nonnull)operationIdentifier inLane:(NSString * _Nonnull)lane progressType:(enum OperationProgressType)progressType;
        [Export("operationProgressUpdateForOperationIdentifier:inLane:progressType:")]
        void OperationProgressUpdateForOperationIdentifier(iFCCOperationIdentifier operationIdentifier, string lane, OperationProgressType progressType);

        // -(void)operationApprovedWithResponse:(id<POSResponse> _Nonnull)response operationIdentifier:(id<iFCCOperationIdentifier> _Nonnull)operationIdentifier inLane:(NSString * _Nonnull)lane;
        [Export("operationApprovedWithResponse:operationIdentifier:inLane:")]
        void OperationApprovedWithResponse(POSResponse response, iFCCOperationIdentifier operationIdentifier, string lane);

        // -(void)operationDeclinedWithResponse:(id<POSResponse> _Nonnull)response operationIdentifier:(id<iFCCOperationIdentifier> _Nonnull)operationIdentifier inLane:(NSString * _Nonnull)lane;
        [Export("operationDeclinedWithResponse:operationIdentifier:inLane:")]
        void OperationDeclinedWithResponse(POSResponse response, iFCCOperationIdentifier operationIdentifier, string lane);

        // -(void)operationFailedForOperationIdentifier:(id<iFCCOperationIdentifier> _Nonnull)operationIdentifier inLane:(NSString * _Nonnull)lane error:(NSError * _Nonnull)error;
        [Export("operationFailedForOperationIdentifier:inLane:error:")]
        void OperationFailedForOperationIdentifier(iFCCOperationIdentifier operationIdentifier, string lane, NSError error);

        // -(void)operationCompletedForOperationIdentifier:(id<iFCCOperationIdentifier> _Nonnull)operationIdentifier inLane:(NSString * _Nonnull)lane;
        [Export("operationCompletedForOperationIdentifier:inLane:")]
        void OperationCompletedForOperationIdentifier(iFCCOperationIdentifier operationIdentifier, string lane);

        // -(void)deviceReconnectingWithLane:(NSString * _Nonnull)lane;
        [Export("deviceReconnectingWithLane:")]
        void DeviceReconnectingWithLane(string lane);

        // -(void)deviceErrorWithLane:(NSString * _Nonnull)lane error:(NSError * _Nonnull)error;
        [Export("deviceErrorWithLane:error:")]
        void DeviceErrorWithLane(string lane, NSError error);

        // -(void)deviceDisconnectedWithLane:(NSString * _Nonnull)lane;
        [Export("deviceDisconnectedWithLane:")]
        void DeviceDisconnectedWithLane(string lane);

        // -(void)deviceDisconnectedWhileBackgroundingWithLane:(NSString * _Nonnull)lane;
        [Export("deviceDisconnectedWhileBackgroundingWithLane:")]
        void DeviceDisconnectedWhileBackgroundingWithLane(string lane);

        // -(void)deviceConnectedWithLane:(NSString * _Nonnull)lane;
        [Export("deviceConnectedWithLane:")]
        void DeviceConnectedWithLane(string lane);

        // -(void)requestBatteryStatusSucceededWithBatteryStatus:(id<DeviceBatteryStatus> _Nonnull)batteryStatus inLane:(NSString * _Nonnull)lane;
        [Export("requestBatteryStatusSucceededWithBatteryStatus:inLane:")]
        void RequestBatteryStatusSucceededWithBatteryStatus(DeviceBatteryStatus batteryStatus, string lane);

        // -(void)requestBatteryStatusFailedWithError:(NSError * _Nonnull)error inLane:(NSString * _Nonnull)lane;
        [Export("requestBatteryStatusFailedWithError:inLane:")]
        void RequestBatteryStatusFailedWithError(NSError error, string lane);

        // -(void)deviceResetSucceededWithLane:(NSString * _Nonnull)lane;
        [Export("deviceResetSucceededWithLane:")]
        void DeviceResetSucceededWithLane(string lane);

        // -(void)deviceResetFailedWithLane:(NSString * _Nonnull)lane error:(NSError * _Nonnull)error;
        [Export("deviceResetFailedWithLane:error:")]
        void DeviceResetFailedWithLane(string lane, NSError error);

        // -(void)firmwareUpdateModeEnteredWithLane:(NSString * _Nonnull)lane;
        [Export("firmwareUpdateModeEnteredWithLane:")]
        void FirmwareUpdateModeEnteredWithLane(string lane);

        // -(void)firmwareUpdateProgressUpdateWithProgressMessage:(NSString * _Nonnull)progressMessage inLane:(NSString * _Nonnull)lane;
        [Export("firmwareUpdateProgressUpdateWithProgressMessage:inLane:")]
        void FirmwareUpdateProgressUpdateWithProgressMessage(string progressMessage, string lane);

        // -(void)firmwareUpdateSucceededWithLane:(NSString * _Nonnull)lane;
        [Export("firmwareUpdateSucceededWithLane:")]
        void FirmwareUpdateSucceededWithLane(string lane);

        // -(void)firmwareUpdateFailedInLane:(NSString * _Nonnull)lane error:(NSError * _Nonnull)error;
        [Export("firmwareUpdateFailedInLane:error:")]
        void FirmwareUpdateFailedInLane(string lane, NSError error);

        // -(void)firmwareUpdateCanceledInLane:(NSString * _Nonnull)lane;
        [Export("firmwareUpdateCanceledInLane:")]
        void FirmwareUpdateCanceledInLane(string lane);

        // -(void)cardReadOperationResultWithResponse:(id<CardReadResponse> _Nonnull)response operationIdentifier:(id<iFCCOperationIdentifier> _Nonnull)operationIdentifier inLane:(NSString * _Nonnull)lane;
        [Export("cardReadOperationResultWithResponse:operationIdentifier:inLane:")]
        void CardReadOperationResultWithResponse(CardReadResponse response, iFCCOperationIdentifier operationIdentifier, string lane);

        // -(void)laneDelegateReleasingWithLane:(NSString * _Nonnull)lane;
        [Export("laneDelegateReleasingWithLane:")]
        void LaneDelegateReleasingWithLane(string lane);

        // -(void)onDeviceAttachedWithDevice:(id<iFCCCardReaderDevice> _Nonnull)device;
        [Export("onDeviceAttachedWithDevice:")]
        void OnDeviceAttachedWithDevice(iFCCCardReaderDevice device);

        // -(void)onAttachDeviceErrorWithDeviceOptions:(id<iFCCCardReaderDeviceOptions> _Nonnull)deviceOptions error:(NSError * _Nonnull)error;
        [Export("onAttachDeviceErrorWithDeviceOptions:error:")]
        void OnAttachDeviceErrorWithDeviceOptions(iFCCCardReaderDeviceOptions deviceOptions, NSError error);

        // -(void)initializationCompleted;
        [Export("initializationCompleted")]
        void InitializationCompleted();

        // -(void)initializationFailedWithError:(NSError * _Nonnull)error;
        [Export("initializationFailedWithError:")]
        void InitializationFailedWithError(NSError error);

        // -(void)deinitializationCompleted;
        [Export("deinitializationCompleted")]
        void DeinitializationCompleted();

        // +(NSString * _Nonnull)getStringWithMyString:(NSString * _Nonnull)myString __attribute__((warn_unused_result("")));
        [Static]
        [Export("getStringWithMyString:")]
        string GetStringWithMyString(string myString);

        // +(void)InitializeLoggerWithPort:(NSInteger)port ipAddress:(NSString * _Nonnull)ipAddress;
        [Static]
        [Export("InitializeLoggerWithPort:ipAddress:")]
        void InitializeLoggerWithPort(nint port, string ipAddress);
    }


}


