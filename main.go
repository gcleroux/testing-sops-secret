package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello, "+os.Getenv("SECRET")+"!")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
