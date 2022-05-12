package handlers

import (
	"backend/database/models"
	"net/http"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func GetServices(c echo.Context) error {
	var services []models.Service

	db, _ := c.Get("db").(*gorm.DB)

	if err := db.Find(&services).Error; err != nil {
		return c.NoContent(http.StatusNotFound)
	}

	return c.JSON(http.StatusOK, services)
}

func CreateService(c echo.Context) error {
	type RequestBody struct {
		Name        string `json:"name"`
		Description string `json:"description"`
		Price       uint   `json:"price"`
	}

	var body RequestBody

	if err := c.Bind(&body); err != nil {
		return c.NoContent(http.StatusNotFound)
	}

	db, _ := c.Get("db").(*gorm.DB)

	service := models.Service{
		Name:        body.Name,
		Description: body.Description,
		Price:       body.Price,
	}

	db.Create(&service)
	return c.JSON(http.StatusOK, service)
}
