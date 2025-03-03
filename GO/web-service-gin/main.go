package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

type album struct {
	ID     string  `json:"id"`
	Title  string  `json:"title"`
	Artist string  `json:"artist"`
	Price  float64 `json:"price"`
}

var albums = []album{
	{ID: "1", Title: "Album 1", Artist: "Artist 1"},
	{ID: "2", Title: "Album 2", Artist: "Artist 2"},
	{ID: "3", Title: "Album 3", Artist: "Artist 3"},
}

// * gin.Context is a pointer to a gin.Context object
//Passing it as a pointer allows modifications to persist across function calls.

func getAlbums(c *gin.Context) {

	c.IndentedJSON(http.StatusOK, albums)
}

func postAlbums(c *gin.Context) {
	var newAlbum album

	// call BindJSON to bind the recieved json to new album
	// must delacre in same block to keep scope.
	if err := c.BindJSON(&newAlbum); err != nil {
		return
	}

	// this updates the alnum
	albums = append(albums, newAlbum)
}

func getAlbumByID(c *gin.Context) {
	id := c.Param("id")

	for _, a := range albums {

		if a.ID == id {
			c.IndentedJSON(http.StatusOK, a)
			return
		}
	}
	c.IndentedJSON(http.StatusNotFound, gin.H{"message": "album not found"})
}

func main() {

	router := gin.Default()
	router.GET("/albums", getAlbums)
	router.POST("/albums", postAlbums)
	router.GET("/albums/:id", getAlbumByID)
	router.Run("localhost:8080")

	fmt.Println(albums)
}
