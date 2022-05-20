import Fluent
import Vapor

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
    }

    func create(req: Request) throws -> EventLoopFuture<Response> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map { _ in return req.redirect(to: "/users") }
    }

    func readAll(_ req: Request) throws -> EventLoopFuture<View> {
    	let currentusers = user.query(on: req.db).all()
    	return currentusers.flatMap { 
    		users in 
    		let info = ["usersList": users]
    		return req.view.render("users", info)
    	}
    }
    
    func update(req: Request) throws -> EventLoopFuture<Response> {
    	let input = try req.content.decode(user.self)
    	return User.find(req.parameters.get("id"), on: req.db)
    		.unwrap(or: Abort(.notFound))
    		.flatMap { 
    		user in
    		user.firstName = input.firstName
    		user.lastName = input.lastName
    		user.username = input.username
    		return user.save(on: req.db).map { _ in return req.redirect(to: "/users")}
    		} 
    }

    func delete(req: Request) throws -> EventLoopFuture<Response> {
        return User.find(req.parameters.get("id"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { _ in return req.redirect(to: "/users")
            }
    }
}