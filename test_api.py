import requests
import base64

# Đọc ảnh và mã hóa base64
with open("E:\\phanBoTriBat.png", "rb") as image_file:
    base64_image = base64.b64encode(image_file.read()).decode("utf-8")

# Tạo payload
payload = {
    "image": base64_image
}

# Gửi request
response = requests.post("http://localhost:5000/predict", json=payload)

# In kết quả
print("Status Code:", response.status_code)
print("Response:", response.json())