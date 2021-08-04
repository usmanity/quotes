# quotes
a way to save quotes within the repo

- Save quotes to this repo
- View quotes in your command line 
- See a quote on every new instance of your terminal

Quotes are saved to the `library/` folder, organized by author's name. 

# Usage
To save a quote, use the `quote` command as shown below:

```
quote "Spread love everywhere you go. Let no one ever come to you without leaving happier. - Mother Teresa"
```

This is the most straight-forward example but often you will not want to edit or format your quote yourself, 
to address this, the `quote` utility will try to assume everything passed in is a potential string except a few 
specific arguments.

If you'd like to be specific about an argument you can use 
`quote --author "Benjamin Franklin" --quote "Tell me and I forget. Teach me and I remember. Involve me and I learn."`. 
This will tell the tool to not do any guesswork. 

# Resetting your library
You can use the reset.rb file to start from scratch. Usually you'll want to do this after fork/cloning this repo.
