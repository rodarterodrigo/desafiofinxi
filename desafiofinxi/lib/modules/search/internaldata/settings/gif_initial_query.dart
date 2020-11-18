const GifInitialQuery = """
CREATE TABLE gif (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    original_image TEXT,
    downsized_image TEXT,
  )
""";