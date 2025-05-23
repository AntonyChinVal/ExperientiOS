import Foundation

class NetworkServiceImpl: NetworkService {
    func post<T: Decodable>(
        url: URL,
        body: some Encodable,
        responseType _: T.Type
    ) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)

        NetworkLogger.log(request: request)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            NetworkLogger.log(response: response, data: data, error: nil)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                throw URLError(.badServerResponse)
            }

            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            NetworkLogger.log(response: nil, data: nil, error: error)
            throw error
        }
    }

    func get<T: Decodable>(
        url: URL,
        responseType _: T.Type
    ) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        NetworkLogger.log(request: request)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            NetworkLogger.log(response: response, data: data, error: nil)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                throw URLError(.badServerResponse)
            }

            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            NetworkLogger.log(response: nil, data: nil, error: error)
            throw error
        }
    }
}
