import requests

files = [
    ('file', ('file', open('/home/son/Documents/fpt/iap491/k8s_cluster/export_pdf/output.pdf', 'rb'), 'application/octet-stream'))
]
headers = {
    'x-api-key': 'sec_VVXml8O4eh9QfjNbLHwXGSSe72jliRtr'
}

response = requests.post(
    'https://api.chatpdf.com/v1/sources/add-file', headers=headers, files=files)

if response.status_code == 200:
    print('Source ID:', response.json()['sourceId'])
else:
    print('Status:', response.status_code)
    print('Error:', response.text)