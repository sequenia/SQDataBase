# SQDataBase

[![Latest release](https://badgen.net/github/release/Naereen/Strapdown.js)](https://github.com/sequenia/SQDevKit/releases)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

Основа для использования различных баз данных

## Установка

### Swift Package Manager
При установке через Swift Package Manager добавьте в ваш `Package.swift` строку:
```
.package(url: "https://github.com/sequenia/SQDataBase.git", .upToNextMajor(from: "0.1.0"))
```

## Модули

### `SQDBProtocols`
Основа для описание хранимых сущностей и репозиториев объектов

### `SQRealm`
Реализация `SQDBProtocols` для базы данных [Realm](https://github.com/realm/realm-swift)
