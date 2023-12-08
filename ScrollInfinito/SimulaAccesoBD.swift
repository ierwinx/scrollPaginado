import Foundation

public class SimulaAccesoBD {
    
    public static var arrNombres = [
        "tahini", "milk", "cheese", "hummus", "noodles",
        "Manchester", "London", "Liverpool", "Birmingham", "Leeds",
        "Carlisle", "Rocket", "Flash", "Bella", "Slugger",
        "María García",
        "Carlos Martínez",
        "Laura Rodríguez",
        "Juan López",
        "Ana Sánchez",
        "David Pérez",
        "Claudia Gómez",
        "Pedro Díaz",
        "Andrea Fernández",
        "José González",
        "Lucía Martín",
        "Alejandro Ruiz",
        "Paula Hernández",
        "Francisco Torres",
        "Natalia Jiménez",
        "Miguel López",
        "Marta Pérez",
        "Javier González",
        "Elena Ramírez",
        "Raúl Castro",
        "Sandra Navarro",
        "Daniel Soto",
        "Patricia Morales",
        "Pablo Ortega",
        "Sara Delgado",
        "Adrián Vargas",
        "Verónica Medina",
        "Marcos Molina",
        "Lorena Guerrero",
        "Sergio Reyes",
        "Beatriz Cortés",
        "Óscar Flores",
        "Silvia Blanco",
        "Raquel Herrera",
        "Guillermo Ramos",
        "Isabel Jiménez",
        "Mario Silva",
        "Estela Vázquez",
        "Álvaro Moya",
        "Cristina Rubio",
        "Víctor Montes",
        "Carla Santos",
        "Rubén Castro",
        "Olga Márquez",
        "Emilio Navarro",
        "Adriana Ríos",
        "Hugo Álvarez",
        "Miriam Espinosa",
        "Javier Mendoza",
        "Lourdes Ortiz",
        "Erwin"
    ]
    
    private static var tamanioPagina = 10
    private static var pagina = 1
    static var bCargando = false
    
    public static func paginar(completion: @escaping ([String]) -> Void) {
        bCargando = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let startIndex = (pagina - 1) * tamanioPagina
            let endIndex = min(startIndex + tamanioPagina, arrNombres.count)
            bCargando = false
            if startIndex > arrNombres.count {
                completion([])
            } else {
                let newArreglo: [String] = Array(arrNombres[startIndex..<endIndex])
                pagina += 1
                completion(newArreglo)
            }
        }
    }
    
}
