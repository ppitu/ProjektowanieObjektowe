package routes

import "github.com/labstack/echo/v4"

func Routes(g *echo.Group) {
	ServiceRouter{}.Init(g.Group("/services"))
	PaymentRouter{}.Init(g.Group("/payments"))
	OrderRouter{}.Init(g.Group("/orders"))
}
