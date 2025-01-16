//
//  Keychain.swift
//  MyLoginSwiftUIRootCoor
//
//  Created by Seamus O'Mahoney on 4/19/24.
//

import Foundation

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

struct Keychain {
    /**
     Begin the search by constructing a query dictionary.
     - Parameters: key (String) to store as service and account.
     - Returns: keychain search query dictionary.
     */
    private func createKeychainSearchQuery(key: String) -> [String : Any] {
        let keychainQuery: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                            kSecAttrService as String: key,
                                            kSecAttrAccount as String: key,
                                            kSecReturnAttributes as String: true,
                                            kSecReturnData as String: true
        ]
        return keychainQuery
    }
    
    /**
     Save the value in the keychain.
     - Parameters: key and value (String), the key to identified value user want to store in the keychain.
     - Returns: Bool, yes if successfully value stored in the keychain.
     */
    func saveItemInKeychain(key: String, value: String) -> Bool {
        // Encode the password into an Data object.
        guard let encodedValue = value.data(using: .utf8) else {
            
            return false
        }
        
        var keychainQuery = createKeychainSearchQuery(key: key)
        
        // Delete any existing value for key before saveing.
        _ = deleteItemFromKeychain(key: key)
        
        // Save specified a key's value in the keychain.
        keychainQuery.updateValue(encodedValue as AnyObject, forKey: kSecValueData as String)
        let status = SecItemAdd(keychainQuery as CFDictionary, nil)
        
        // Check the status of saved item, if not saved then throw an error.
        guard status == errSecSuccess else { print(status.description)
            
            return false
        }
        return true
    }
    
    /**
     Delete the value from the keychain.
     - Parameters: key (String), delete specified a key value from the keychain.
     - Returns: Bool, yes if successfully value deleted from the keychain.
     */
    func deleteItemFromKeychain(key: String) -> Bool {
        
        // Delete existing item from the keychain.
        let keychainQuery = createKeychainSearchQuery(key: key)
        let status = SecItemDelete(keychainQuery as CFDictionary)
        
        // Check the status of delete item, if not deleted then throw an error.
        guard status == errSecSuccess || status == errSecItemNotFound else { print ("Error: \(KeychainError.unhandledError(status: status))")
            return false
        }
        return true
    }
    
    /**
     Retrieve stored the value from the keychain.
     - Parameters: key (String), to find the value of the key in the keychain.
     - Returns: String to return a stored value.
     */
    func retrieveItemFromKeychain(key: String) -> String {
        
        var keychainQuery = createKeychainSearchQuery(key: key)
        keychainQuery.updateValue(kSecMatchLimitOne, forKey: kSecMatchLimit as String)
        
        var item: CFTypeRef?
        
        // Retrieve existing keychain item that matches the keychainQuery.
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &item)
        
        // Check the status of result item, if not found throw an error.
        guard status != errSecItemNotFound else { print ("Error: \(KeychainError.noPassword)")
            return "" }
        guard status == errSecSuccess else { print ("Error: \(KeychainError.unhandledError(status: status))")
            return "" }
        
        // Parse the password string from the query result.
        guard let keychainItem = item as? [String : Any],
              let storedValueData = keychainItem[kSecValueData as String] as? Data,
              let valueInString = String(data: storedValueData, encoding: String.Encoding.utf8)
        else {
            print ("Error: \(KeychainError.unexpectedPasswordData)")
            return ""
        }
        return valueInString
        
    }
}
