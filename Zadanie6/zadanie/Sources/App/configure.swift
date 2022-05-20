import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migration.add(CreateProduct())
    app.migration.add(CreateUser())
    app.migration.add(CreateCategory())

    app.views.use(.leaf)

    // register routes
    try routes(app)
}
