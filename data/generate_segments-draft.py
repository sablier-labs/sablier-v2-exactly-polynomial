amounts = [
    237,
    512,
    826,
    1180,
    1570,
    2002,
    2469,
    2978,
    3527,
    4096,
    4722,
    5379,
    6082,
    6816,
    7597,
    8418,
    9267,
    10165,
    11091,
    12067,
    13083,
    14096,
    15188,
    16304,
    17474,
    18667,
    19915,
    21202,
    22510,
    23875,
    25259,
    26702,
    28184,
    29641,
    31200,
    32775,
    34224,
]

differences = [
    237,
    275,
    314,
    354,
    390,
    432,
    467,
    509,
    549,
    569,
    626,
    657,
    703,
    734,
    781,
    821,
    849,
    898,
    926,
    976,
    1016,
    1013,
    1092,
    1116,
    1170,
    1193,
    1248,
    1287,
    1308,
    1365,
    1384,
    1443,
    1482,
    1457,
    1559,
    1575,
    1449,
]

unix_timestamps = [
    1717200000,
    1719792000,
    1722470400,
    1725148800,
    1727740800,
    1730419200,
    1733011200,
    1735689600,
    1738368000,
    1740787200,
    1743465600,
    1746057600,
    1748736000,
    1751328000,
    1754006400,
    1756684800,
    1759276800,
    1761955200,
    1764547200,
    1767225600,
    1769904000,
    1772323200,
    1775001600,
    1777593600,
    1780272000,
    1782864000,
    1785542400,
    1788220800,
    1790812800,
    1793491200,
    1796083200,
    1798761600,
    1801440000,
    1803859200,
    1806537600,
    1809129600,
    1811808000,
]


def array_sum(arr):
    total = 0
    for num in arr:
        total += num
    return total


def array_diff(arr):
    differences = []
    for i in range(1, len(arr)):
        diff = arr[i] - arr[i - 1]
        differences.append(diff)
    return differences


# Iterate through both arrays and print the formatted string
def generate_segments(amounts, unix_timestamps):
    for index, (amount, timestamp) in enumerate(zip(amounts, unix_timestamps)):
        print(
            f"segments[{index}] = getSegment({{ amount: {amount}e18, milestone: {timestamp} }});"
        )


# sum = array_sum(amounts)
# print(f"The sum of all numbers in the amounts is: {sum}")

# differences = array_diff(amounts)
# print(f"The differences between consecutive numbers in the amounts are: {differences}")

print("length of differences: ", len(differences))
print("length of unix_timestamps: ", len(unix_timestamps))
generate_segments(differences, unix_timestamps)
