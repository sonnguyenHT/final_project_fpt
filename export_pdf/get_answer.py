import requests
import sys
# Import the library

sourceId = sys.argv[1]
# print(sourceId)
headers = {
    'x-api-key': 'sec_VVXml8O4eh9QfjNbLHwXGSSe72jliRtr',
    "Content-Type": "application/json",
}

data = {
    "referenceSources": True,
    'sourceId': sourceId,
    'messages': [
        {
            'role': "user",
            'content': "phân tích biểu đồ trong trang 1 của pdf và đưa ra một report theo text, đưa ra nhận xét, kết luận, lưu ý và khuyến nghị về  CPU, memory, Disk và network",
        }
    ]
}

# print(data)
response = requests.post(
    'https://api.chatpdf.com/v1/chats/message', headers=headers, json=data)

if response.status_code == 200:
    print('Result:', response.json()['content'])
else:
    print('Status:', response.status_code)
    print('Error:', response.text)

file_name = "report.txt"
with open(file_name, "w") as f:
    data_to_write = response.json()['content']
    f.write(data_to_write)