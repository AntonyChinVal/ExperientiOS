//
//  DIContainer.swift
//  Experient
//
//  Created by Antony Chinchay Valdivia on 23/05/25.
//

final class DIContainer {
    static let shared = DIContainer()

    private var services: [ObjectIdentifier: Any] = [:]

    private init() {}

    func register<Service>(_ type: Service.Type, factory: @escaping () -> Service) {
        let key = ObjectIdentifier(type)
        self.services[key] = factory
    }

    func resolve<Service>(_ type: Service.Type) -> Service {
        let key = ObjectIdentifier(type)
        guard let service = services[key] as? () -> Service else {
            fatalError("No registered service for type: \(type)")
        }
        return service()
    }
}
