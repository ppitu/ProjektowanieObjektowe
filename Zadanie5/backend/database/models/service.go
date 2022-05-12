package models

import "gorm.io/gorm"

type Service struct {
	gorm.Model
	ID          uint64 `gorm:"primary_key"`
	Name        string
	Description string
	Price       uint
}
