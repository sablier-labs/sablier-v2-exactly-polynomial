import generate_schedule


def test_extract_total_amounts():
    total_amounts = generate_schedule.extract_total_amounts()
    expected_amounts = [
        202086, 150587, 34224, 18905, 6193, 37484, 25098, 33572, 9126,
        4563, 325945, 1303780, 46284, 23142, 46284, 10104, 198782
    ]

    assert len(total_amounts) == len(
        expected_amounts), "Total amounts length does not match expected length"

    for i, expected in enumerate(expected_amounts):
        assert total_amounts[i] == expected, f"Total amount at index {i} is {total_amounts[i]}, but expected {expected}"


def test_segments_amounts():
    total_amounts = generate_schedule.extract_total_amounts()
    for i in range(0, len(total_amounts)):
        segments = generate_schedule.get_user_segments(i)
        segments_amounts_sum = 0
        for j in range(0, len(segments)):
            segments_amounts_sum += segments[j]['amount']

        assert segments_amounts_sum == total_amounts[i], (
            f"For user {i}: expected total amount {total_amounts[i]}, but got {segments_amounts_sum}"
        )


test_segments_amounts()
test_extract_total_amounts()
