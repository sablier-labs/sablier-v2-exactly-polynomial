import pandas as pd
from datetime import datetime
import time


# Load the CSV file
df = pd.read_csv('Exactly_Schedule.csv')


def get_dates():
    return df.iloc[5:50, 1].tolist()


def get_recipients_addresses():
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


def get_unlock_amounts():
    amounts = df.iloc[5:50, 2:19].map(lambda x: int(x.replace(',', '')) if isinstance(
        x, str) and x.replace(',', '').strip() != '' else None)
    return amounts.values.tolist()


def get_segments_milestones():
    dates = get_dates()
    # Convert dates to UNIX timestamps
    return [int(time.mktime(datetime.strptime(date, "%B %d, %Y").timetuple())) for date in dates]


# Returns the milestones and the amount for a given index from 0 to 16
def get_segments_for(index):
    dates = get_dates()
    milestones = get_segments_milestones()
    unlock_amounts = get_unlock_amounts()
    row_unlock_amounts = [row[index] for row in unlock_amounts if row]

    segments = []
    for i in range(len(milestones)):
        if row_unlock_amounts[i] > 0:
            segments.append({
                'milestone': milestones[i],
                'amount': row_unlock_amounts[i],
                'date': dates[i]
            })

    segments = convert_to_segment_amounts(segments)

    return segments


def convert_to_segment_amounts(segments):
    if len(segments) < 2:
        return segments

    # Create a new list of segment dictionaries with updated amounts
    updated_segments = [segments[0]]  # The first segment remains the same

    for i in range(1, len(segments)):
        # Calculate the difference in amounts between adjacent segments
        diff_amount = segments[i]['amount'] - segments[i - 1]['amount']

        # Create a new segment dictionary with the updated amount
        updated_segment = {
            'milestone': segments[i]['milestone'],
            'amount': diff_amount,
            'date': segments[i]['date']
        }

        # Append the updated segment to the updated_segments list
        updated_segments.append(updated_segment)

    return updated_segments


def print_recipients_addresses():
    print(get_recipients_addresses())


def print_total_amounts():
    print(get_total_amounts())


def print_unlock_amounts():
    print(get_unlock_amounts())


def generate_segments_functions():
    for i in range(16):
        user_number = i + 1
        print(
            f"function getSegmentsForUser{user_number}() public pure returns (LockupDynamic.Segment[] memory) {{")
        print(f"    LockupDynamic.Segment[] memory segments = new LockupDynamic.Segment[](36);")
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


def generate_users_functions():
    recipients_addresses = get_recipients_addresses()
    start_times = get_cliff_timestamps()
    total_amounts = get_total_amounts()

    for i in range(16):
        user_number = i + 1
        recipient_address = recipients_addresses[i]
        start_time = start_times[i]
        total_amount = formatNumber(total_amounts[i])
        print(f"""function getParamsForUser{user_number}() public view returns (LockupDynamic.CreateWithMilestones memory) {{
            return LockupDynamic.CreateWithMilestones({{
                asset: EXA,
                broker: broker,
                cancelable: true,
                recipient: {recipient_address},
                segments: getSegmentsForUser{user_number}(),
                sender: EXACTLY_PROTOCOL_OWNER,
                startTime: {start_time},
                totalAmount: {total_amount}e18
            }});
        }}""")


def formatNumber(num):
    if num % 1 == 0:
        return int(num)
    else:
        return num


generate_users_functions()
generate_segments_functions()
