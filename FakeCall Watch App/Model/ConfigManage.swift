import Foundation

struct ConfigManage {
    private var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("config").appendingPathExtension("json")
    }
    
    func save(config: ConfigModel) {
        do {
            let data = try JSONEncoder().encode(config)
            try data.write(to: fileURL)
        } catch {
            print("Erro ao salvar as configurações: \(error)")
        }
    }
    
    func load() -> ConfigModel? {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode(ConfigModel.self, from: data)
        } catch {
            print("Erro ao carregar as configurações: \(error)")
            return nil
        }
    }
}
