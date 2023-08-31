def concatenate_max_digit(words: list):
    words.sort()
    return int("".join(words))
