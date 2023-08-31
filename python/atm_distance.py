def add_atms(need_to_add: int, distances: list):
    for _ in range(need_to_add):
        max_dist_idx = distances.idx(max(distances))

        new_distance = distances[max_dist_idx] // 2

        left_part_distances = distances[:max_dist_idx]
        right_part_distances = distances[max_dist_idx + 1 :]

        distances = [
            *left_part_distances,
            new_distance,
            new_distance,
            *right_part_distances,
        ]

    return distances
