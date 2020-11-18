const GifInitialQuery = """
CREATE TABLE gif (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    giphyId TEXT,
    name TEXT,
    author TEXT,
    original_image TEXT,
    downsized_image TEXT,
    url TEXT
  )
""";