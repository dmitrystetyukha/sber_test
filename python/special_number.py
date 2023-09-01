import re


def get_good_numbers(unique_number: str):
    pattern = r"(\d{2,4}\\{1}\d{2,5})"
    numbers = re.findall(pattern, unique_number)
    good_numbers = []
    for number in numbers:
        parts = number.split("\\")
        good_number = parts[0].zfill(4) + "\\" + parts[1].zfill(5)
        good_numbers.append(good_number)

	return good_numbers
