import Vapor
import Fluent

func routes(_ app: Application) throws {
    let productController = ProductController()
    let userController = UserController()
    let categoryController = CategoryController()
    
    //create
    app.post("product", "create", use: productController.create)
    app.post("user", "create", use: userController.create)
    app.post("category", "create", use: categoryController.create)
    
    
    
    //read
    app.get("products", use: productController.readAll)
    app.get("users", use: userController.readAll)
    app.get("categories", use: categoryController.readAll)
    
    
    //update
    app.post("product", "update", ":id", use: productController.update)
    app.post("users", "update", ":id", use: userController.update)
    app.post("category", "update", ":id", use: categoryController.update)
    
    
    
    //delete
    app.post("product", "delete", ":id", use: productController.delete)
      app.post("users", "delete", ":id", use: userController.delete)
      app.post("category", "delete", ":id", use: categoryController.delete)
}
