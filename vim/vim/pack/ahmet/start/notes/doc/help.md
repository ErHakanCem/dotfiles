
---

# Notes Vim Plugin — Documentation

## Introduction

This plugin provides a simple note-taking workflow inside Vim.

* Create new notes
* Link between notes using `[[ID | Title]]`
* Search notes using `fzf.vim`
* Notes use timestamp-based filenames:

```
YYYYMMDD.HHMMSS.md
Example: 20251016.145512.md
```

The first line of each note is automatically inserted as a Markdown header.

---

## Table of Contents

1. [Creating a New Note](#creating-a-new-note)
2. [Create & Link a Note From Visual Selection](#create--link-a-note-from-visual-selection)
3. [Inserting Links With `[[` in Insert Mode](#inserting-links-with--in-insert-mode)
4. [Searching Notes With FZF](#searching-notes-with-fzf)
5. [Internal Functions](#internal-functions)

---

## 1. Creating a New Note

The main function:

```vim
notes#new({title})
```

Creates a new note file with a timestamp-based name:

```
20251016.145512.md
```

The note begins with:

```
# {title}
```

This function is mostly called internally by the plugin.

---

## 2. Create & Link a Note From Visual Selection

The central user function is:

```vim
notes#make_new_note()
```

This workflow:

1. Takes visually selected text
2. Creates a new note using that text as the title
3. Generates a timestamp ID
4. Inserts a link in the original file:

```
[[20251016.145512 | Selected title]]
```

This is the main way to generate new linked notes quickly.

---

## 3. Inserting Links With `[[` in Insert Mode

Typing `[[` in Insert mode triggers the note search function automatically.

Flow:

1. User types `[[`
2. Plugin opens FZF note search
3. User selects a note
4. Plugin inserts:

```
[[ID | Note Title]]
```

Mapping responsible:

```vim
inoremap <Plug>(notes-search-note) <C-o>:call notes#search_note()<CR>
```

The plugin then restores Insert mode.

---

## 4. Searching Notes With FZF

The search function:

```vim
notes#search_note()
```

Uses `fzf.vim` to find all note titles:

```
^# <title>
```

Once the user selects a note from FZF, a handler builds the link and inserts it into the current buffer.

Internally uses:

```vim
fzf#vim#ag('^# ', '', {'sink': function('notes#link_handler')})
```

---

## 5. Internal Functions

### `notes#new(title)`

Creates a new note file with timestamp ID and inserts the title.

### `notes#make_link(id, title)`

Returns the formatted link:

```
[[id | title]]
```

### `notes#link_handler(result)`

Receives FZF output, extracts:

* ID (filename)
* title
* cursor position

And inserts formatted link into the buffer.

### `notes#link()`

Sets cursor position and triggers search.

---

## Author

Documentation generated for your custom Vim note-taking plugin.

---

If you want, I can also:

✔ Convert to **PDF**
✔ Convert to **.md + README format**
✔ Add installation + usage section
✔ Add screenshots / GIFs

Just tell me!

