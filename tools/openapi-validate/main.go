package main

import (
	"context"
	"fmt"
	"os"

	"github.com/getkin/kin-openapi/openapi3"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Fprintf(os.Stderr, "Usage: %s <path-to-openapi.yaml>\n", os.Args[0])
		os.Exit(2)
	}

	path := os.Args[1]

	loader := openapi3.NewLoader()
	loader.IsExternalRefsAllowed = true

	doc, err := loader.LoadFromFile(path)
	if err != nil {
		fmt.Fprintf(os.Stderr, "ERROR: failed to load OpenAPI spec: %v\n", err)
		os.Exit(1)
	}

	if err := doc.Validate(context.Background()); err != nil {
		fmt.Fprintf(os.Stderr, "ERROR: OpenAPI validation failed: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("OK: OpenAPI validated: %s\n", path)
}


