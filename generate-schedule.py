import pandas as pd
from datetime import datetime
import time


# Load the CSV file
df = pd.read_csv('Exactly_Schedule.csv')


def get_dates():
    return df.iloc[5:50, 1].tolist()


def get_addresses():
    return df.iloc[0, 2:19].tolist()


def get_cliff_dates():
    return df.iloc[1, 2:19].tolist()


def get_cliff_timestamps():
    dates = get_cliff_dates()
    # Convert dates to UNIX timestamps
    return [int(datetime.strptime(date, "%m/%d/%Y").timestamp()) for date in dates]


def get_total_amounts():
    amounts = df.iloc[3, 2:19].map(lambda x: int(x.replace(
        ',', '')) if isinstance(x, str) and x.replace(',', '').strip() != '' else None)
    return amounts.tolist()


def get_segments_amounts():
    amounts = df.iloc[5:50, 2:19].map(lambda x: int(x.replace(',', '')) if isinstance(
        x, str) and x.replace(',', '').strip() != '' else None)
    return amounts.values.tolist()


def get_segments_milestones():
    dates = get_dates()
    # Convert dates to UNIX timestamps
    return [int(time.mktime(datetime.strptime(date, "%B %d, %Y").timetuple())) for date in dates]


# Returns the milestones and the amount for a given index from 0 to 16
def get_segments_for(index):
    milestones = get_segments_milestones()
    amounts = get_segments_amounts()
    index_row = [row[index] for row in amounts if row]
    dates = get_dates()

    segments = []
    for i in range(len(milestones)):
        if index_row[i] > 0:
            segments.append({
                'milestone': milestones[i],
                'amount': index_row[i],
                'date': dates[i]
            })

    return segments


def print_addresses():
    print(get_addresses())


def print_total_amounts():
    print(get_total_amounts())


def print_segments_amounts():
    print(get_segments_amounts())


def generate_segments_functions():
    for i in range(16):
        user_number = i + 1
        print(
            f"function getSegmentsForUser{user_number}() public pure returns (LockupDynamic.Segment[] memory)")
        print(
            "{LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36); ")
        generate_segments_for(i)
        print("return segments; }")


def generate_segments_for(index):
    segments = get_segments_for(index)
    for i, segment in enumerate(segments):
        amount = formatNumber(segment['amount'])
        milestone = segment['milestone']
        date = segment['date']
        print(
            f"segments[{i}] = getSegment({{ amount: {amount}e18, milestone: {milestone} }}); // {date} ")


def formatNumber(num):
    if num % 1 == 0:
        return int(num)
    else:
        return num


print(generate_segments_functions())
