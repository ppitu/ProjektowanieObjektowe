import Fluent
import Vapor

struct ProductController: RouteController {
    func boot(routes: RoutesBuilder) throws {
    }

    func create(req: Request) throws -> EventLoopFuture<Response> {
        return try.content.decode(Product.self).save(on: req.db).map { _ in return req.redirect(to: "/products")}
    }

    func readAll(_ req: Request) throws -> EventLoopFuture<View> {
        let currentProduct = Product.query(on: req.db).all()

        return currentProduct.flatMap {
            products in
            let info = ["productsList": products]
            return req.view.render("products", info)
        }
    }

    func update(req: Request) throws -> EventLoopFuture<Response> {
    	let input = try req.content.decode(Product.self)
    	return Product.find(req.parameters.get("id"), on: req.db)
    		.unwrap(or: Abort(.notFound))
    		.flatMap { 
    		product in
    		product.name = input.name
    		product.publisherId = input.publisherId
    		return product.save(on: req.db).map { _ in return req.redirect(to: "/products")}
    		} 
    }

    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return Product.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { _ in return req.redirect(to: "/products")}
    }
}