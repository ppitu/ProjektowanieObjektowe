package models

import "gorm.io/gorm"

type Payment struct {
	gorm.Model
	ID     uint64 `gorm:"primary_key"`
	Number string
}
