package main

import (
	"github.com/gin-gonic/gin"
	"time"
	"net/http"
	"log"
	"database/sql"
	_ "github.com/mattn/go-sqlite3"
	"github.com/git-user/chapter4/dbutils"
)

func ping(c *gin.Context) {

	h := gin.H{
		"serverTime:": time.Now().UTC(),
	}

	c.JSON(200, h)

}

func main() {

	r := gin.Default()
	r.GET("/ping", ping)
	r.Run(":8080")
}
