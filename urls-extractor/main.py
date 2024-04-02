import sys
import requests
from bs4 import BeautifulSoup
import re

def extract_shorts_urls(channel_url, video_type):
    url = f'{channel_url}/{video_type}'
    ids = []
    i = 0
    # Fetch the HTML content of the channel page
    response = requests.get(url)
    if response.status_code != 200:
        print(f"Failed to fetch {url} - Status code: {response.status_code}")
        exit(1)

    # Parse the HTML content
    soup = BeautifulSoup(response.content, 'html.parser')

    if video_type == "shorts":
        pattern = r'"url":"/shorts/([^"]+)"'
    elif video_type == "videos":
        pattern = r'"url":"/watch\?v=([^"]+)"'
    else:
        print(f"Invalid video type: {video_type}")
        exit(1)

    # Find all script tags containing JSON data
    scripts = soup.find_all('script')

    # Extract JSON data containing shorts URLs
    for script in scripts:
        matches = re.findall(pattern, str(script))
        # Print the extracted shorts URLs
        for match in matches:
            # print(match)
            ids += [match]
            i += 1
    print(f"Extracted {i} {video_type} URLs")
    return ids

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 main.py <user_name>")
        sys.exit(1)

    channel_url = f'https://www.youtube.com/{sys.argv[1]}'
    video_types = [
        "shorts",
        "videos"
    ]

    extracted_urls = []

    # Extract shorts URLs from each channel
    for video_type in video_types:
        print(f"Extracting shorts URLs from {channel_url}/{video_type}")
        extracted_urls += extract_shorts_urls(channel_url, video_type)

    with open('../app-viewer/urls.txt', 'w') as f:
        for extracted_url in extracted_urls:
            f.write(extracted_url + '\n')
