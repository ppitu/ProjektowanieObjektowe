package handlers

import (
	"backend/database/models"
	"net/http"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func CreatePayment(c echo.Context) error {
	type RequestBody struct {
		Number string `json:"number"`
	}

	var body RequestBody

	if err := c.Bind(&body); err != nil {
		return c.NoContent(http.StatusNotFound)
	}

	db, _ := c.Get("db").(*gorm.DB)

	payment := models.Payment{
		Number: body.Number,
	}

	db.Create(&payment)
	return c.JSON(http.StatusOK, payment)
}
