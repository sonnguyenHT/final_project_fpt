import requests

headers = {
  'x-api-key': 'sec_VVXml8O4eh9QfjNbLHwXGSSe72jliRtr',
  'Content-Type': 'application/json',
}

data = {
  'sources': ['src_34qAZpktUC0oROPT6G9ez'],
}

try:
  response = requests.post(
    'https://api.chatpdf.com/v1/sources/delete', json=data, headers=headers)
  response.raise_for_status()
  print('Success')
except requests.exceptions.RequestException as error:
  print('Error:', error)
  print('Response:', error.response.text)