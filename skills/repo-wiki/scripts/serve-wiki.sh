#!/bin/bash
WIKI_DIR="repo-wiki/wiki"

# Ensure the wiki directory exists
mkdir -p "$WIKI_DIR"

# Docsify requires a README.md as the homepage
if [ ! -f "$WIKI_DIR/README.md" ]; then
  echo "# Overview" > "$WIKI_DIR/README.md"
  echo "> This is a wiki for the project." >> "$WIKI_DIR/README.md"
fi

# Starts npx docsify-cli serve to run the web server
echo "Starting Wiki local visualization service..."

# Run docsify and capture its output to find the actual listening port
npx docsify-cli serve "$WIKI_DIR" --port 3333 2>&1 | while IFS= read -r line; do
  echo "$line"
  if [[ "$line" == *"Listening at"* ]]; then
    url=$(echo "$line" | grep -o 'http://localhost:[0-9]*')
    if [ ! -z "$url" ]; then
      echo ""
      echo -e "\033[1;32m✅ Wiki service is ready!\033[0m"
      echo -e "Please click on the browser to access: \033[1;36m$url\033[0m"
      echo ""
    fi
  fi
done
