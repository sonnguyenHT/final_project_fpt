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

# Define the document text
text = "This is some text content written to a docx file."

# Create a new document
document = Document()

# Add a paragraph to the document
document.add_paragraph(text)

# Save the document with a filename
document.save("System-report.docx")

print("Document created successfully!")