package main

import (
	"encoding/json"
	"log"
	"net/http"
)

type Comment struct {
	Author string `json:"author"`
	Text   string `json:"text"`
}

var comments = []Comment{
	Comment{"Anderson Silva", "This is a *comment*, man!"},
	Comment{"José Aldo", "And this is a **different** comment."},
}

func main() {

	addr := ":8080"

	log.SetPrefix("[tutorial] ")
	log.Printf("starting on %s\n", addr)

	http.HandleFunc("/comments", commentsRoute)
	http.Handle("/", http.FileServer(http.Dir("public")))

	err := http.ListenAndServe(addr, nil)
	if err != nil {
		log.Fatal(err)
	}
}

func commentsRoute(w http.ResponseWriter, r *http.Request) {

	if r.Method == "POST" {

		comment := Comment{r.FormValue("author"), r.FormValue("text")}
		comments = append(comments, comment)
	}

	jsonData, _ := json.Marshal(comments)
	w.Write(jsonData)
}
