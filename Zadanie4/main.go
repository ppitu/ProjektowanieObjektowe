package main

import (
	"io/ioutil"
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
)

func getApi() []byte {
	tr := &http.Transport{}
	client := &http.Client{Transport: tr}

	resp, err := client.Get("https://danepubliczne.imgw.pl/api/data/synop")

	if err != nil {
		log.Fatal(err)
	}

	defer resp.Body.Close()

	body, _ := ioutil.ReadAll(resp.Body)

	return body
}

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
  		return c.JSONBlob(http.StatusOK, getApi())
	})

	e.Logger.Fatal(e.Start(":1234"))
}
