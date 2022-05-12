package routes

import (
	"backend/handlers"

	"github.com/labstack/echo/v4"
)

type PaymentRouter struct{}

func (pr PaymentRouter) Init(g *echo.Group) {
	g.POST("", handlers.CreatePayment)
}
