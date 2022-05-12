package routes

import (
	"backend/handlers"

	"github.com/labstack/echo/v4"
)

type OrderRouter struct{}

func (or OrderRouter) Init(g *echo.Group) {
	g.POST("", handlers.CreateOrder)
}
