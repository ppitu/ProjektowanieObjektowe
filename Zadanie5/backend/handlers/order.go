package handlers

import (
	"backend/database/models"
	"net/http"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func CreateOrder(c echo.Context) error {
	type RequestBody struct {
		Date string `json:"date"`
	}

	var body RequestBody

	if err := c.Bind(&body); err != nil {
		return c.NoContent(http.StatusNotFound)
	}

	db, _ := c.Get("db").(*gorm.DB)

	order := models.Orders{
		Date: body.Date,
	}

	db.Create(&order)
	return c.JSON(http.StatusOK, order)
}
