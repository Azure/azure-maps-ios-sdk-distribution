Pod::Spec.new do |s|
    s.name         = "AzureMapsControl"
    s.version      = "1.0.0-pre.3"
    s.summary      = "Azure Maps iOS SDK Control"
    s.homepage     = "https://azure.microsoft.com/en-us/services/azure-maps/#azuremaps-overview"
    s.license      = "MIT"
    s.author       = "Microsoft"

    s.source       = { :git => "https://github.com/Azure/AzureMapsControl.git", :branch => "master" }
    s.vendored_frameworks = "AzureMapsControl.xcframework"

    s.platform = :ios
    s.swift_version = 5
    s.ios.deployment_target = "14.0"

    s.dependency "MSAL"
end
