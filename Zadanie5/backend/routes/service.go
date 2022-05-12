package routes

import (
	"backend/handlers"

	"github.com/labstack/echo/v4"
)

type ServiceRouter struct{}

func (sr ServiceRouter) Init(g *echo.Group) {
	g.GET("", handlers.GetServices)
	g.POST("", handlers.CreateService)
}
