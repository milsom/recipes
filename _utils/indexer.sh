#!/bin/sh

start="# Recipes

<https://github.com/milsom/recipes>

## Categories
[Breads](#breads) &middot; [Soup](#soup) &middot; [Main courses](#main-courses) &middot; [Vegetables](#vegetables) &middot; [Sandwiches](#sandwiches) &middot; [Cocktails](#cocktails) &middot;

## Contents"

end="_Inspired by <https://github.com/chadlavi/recipes> and <https://github.com/shaniber/recipes>_"

getMarkdownLinks() {
  for file in $(find . -iname "*.md" -not -name "README.md" -not -iname "*template*"); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

filter() {
  echo "$1" | grep -E "$2"
}

markdownLinks="$(getMarkdownLinks)"
drinkLinks="$(filter "$markdownLinks" drink | sort)"
foodLinks="$(filter "$markdownLinks" food | sort)"

echo "$start

### Bread

$(filter "$foodLinks" "/bread")

### Soup

$(filter "$foodLinks" "/soup")

### Main courses

$(filter "$foodLinks" mains)

### Sandwiches

$(filter "$foodLinks" sandwiches)

### Vegetables

$(filter "$foodLinks" vegetables)

### Cocktails

$(filter "$drinkLinks" cocktails)

### Coffee

$(filter "$drinkLinks" coffee)

$end"
################################
extrastart=" [Breakfasts](#breakfasts) &middot; [Pasta](#pasta) &middot; [Pizza](#pizza) &middot; [Salads](#salads) &middot; [Coffee and tea](#coffee-and-tea) &middot; [Sides and dips](#sides-and-dips) &middot; [Snacks](#snacks) &middot; [Cured and pickled](#cured-and-pickled) &middot; [Condiments, sauces and toppings](#condiments-sauces-and-toppings) &middot;[Desserts](#desserts) &middot;"

extra="

### Pasta

$(filter "$foodLinks" pasta)

### Pizza

$(filter "$foodLinks" pizza)

### Salads

$(filter "$foodLinks" salads)
### Sides and dips

$(filter "$foodLinks" sides-dips)

### Condiments, sauces and toppings

$(filter "$foodLinks" condiments-sauces-toppings)

### Desserts

$(filter "$foodLinks" desserts)"