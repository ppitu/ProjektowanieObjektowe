package models

import "gorm.io/gorm"

type Orders struct {
	gorm.Model
	ID   uint64 `gorm:"primary_key"`
	Date string
}
