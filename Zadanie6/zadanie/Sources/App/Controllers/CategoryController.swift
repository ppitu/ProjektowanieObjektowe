import Fluent
import Vapor

let link = "/categories";

struct CategoryController: RouteController {
    /* Empty function */
    func boot(routes: RoutesBuilder) throws {
    }

    func create(req: Request) throws -> EventLoopFuture<Response> {
        return try.content.decode(Category.self).save(on: req.db).map { _ in return req.redirect(to: link)}
    }

    func readAll(_ req: Request) throws -> EventLoopFuture<View> {
        let currentCategory = Category.query(on: req.db).all()

        return currentCategoryt.flatMap {
            categories in
            let info = ["categoriesList": categories]
            return req.view.render("categories", info)
        }
    }

    func update(req: Request) throws -> EventLoopFuture<Response> {
    	let input = try req.content.decode(Category.self)
    	return Category.find(req.parameters.get("id"), on: req.db)
    		.unwrap(or: Abort(.notFound))
    		.flatMap { 
    		categories in
    		categories.name = input.name
    		categories.publisherId = input.publisherId
    		return categories.save(on: req.db).map { _ in return req.redirect(to: link)}
    		} 
    }

    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return Category.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { _ in return req.redirect(to: link)}
    }
}