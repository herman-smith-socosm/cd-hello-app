package main

import (
  "strings"
	"fmt"
	"log"
	"net/http"
)

func viewHandler(w http.ResponseWriter, r *http.Request) {
	parameter := r.URL.Path[len("/hello/"):]
  change := "First"
  fmt.Fprintf(w, "<h1>Hello %s</h1><div>%s</div>", strings.Title(parameter), change)
}

func main() {
	http.HandleFunc("/hello/", viewHandler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}
