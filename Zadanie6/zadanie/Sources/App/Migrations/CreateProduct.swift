import Fluent

struct CreateProduct: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("products")
        .id()
        .field("name", .string, required)
        .field("description", .string, .required)
        .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("products").delete();
    }
}