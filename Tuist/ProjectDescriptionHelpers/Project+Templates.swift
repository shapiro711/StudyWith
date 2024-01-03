import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "shapiro",
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "17.0", devices: [.iphone]),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )

        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )

        let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]

        let targets: [Target] = [appTarget, testTarget]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
    
    static func makeFeatureModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "shapiro",
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = .iOS(targetVersion: "17.0", devices: [.iphone]),
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], defaultSettings: .recommended)

        let frameworkTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            dependencies: dependencies
        )
        
        let interFaceTarget = Target(
            name: "\(name)Interface",
            platform: platform,
            product: .staticFramework,
            bundleId: "\(organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Interface/**"],
            resources: resources,
            dependencies: []
        )

        // Demo App 항상 포함
        let demoAppTarget = Target(
            name: "\(name)DemoApp",
            platform: .iOS,
            product: .app,
            bundleId: "\(organizationName).\(name)DemoApp",
            deploymentTarget: deploymentTarget,
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true),
            ]),
            sources: sources,
            resources: resources,
            dependencies: [.target(name: name)]
        )

        // Test Target 추가
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )

        // 스킴 설정 추가
        let schemes: [Scheme] = [
            .makeScheme(target: .debug, name: name),
            .makeDemoScheme(target: .debug, name: name)
        ]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: [frameworkTarget, interFaceTarget, demoAppTarget, testTarget],
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
    
    static func makeDemoScheme(target: ConfigurationName, name: String) -> Scheme {
         return Scheme(
             name: "\(name)DemoApp", // Demo 앱의 이름
             shared: true,
             buildAction: .buildAction(targets: ["\(name)DemoApp"]),
             testAction: .targets(
                 ["\(name)Tests"],
                 configuration: target,
                 options: .options(coverage: true, codeCoverageTargets: ["\(name)DemoApp"])
             ),
             runAction: .runAction(configuration: target),
             archiveAction: .archiveAction(configuration: target),
             profileAction: .profileAction(configuration: target),
             analyzeAction: .analyzeAction(configuration: target)
         )
     }
}
