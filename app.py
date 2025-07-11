from flask import Flask, request, jsonify, make_response
from flask_cors import CORS
import tensorflow as tf
import numpy as np
from PIL import Image
import io
import base64
import logging

app = Flask(__name__)
CORS(app)  # Thêm CORS support

# Thiết lập logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Tải model AI
model = tf.keras.applications.MobileNetV2(weights='imagenet')

# Ánh xạ nhãn ImageNet sang danh mục sản phẩm
CATEGORY_MAPPING = {
    'n03000684': 'Phân bón',        # Chainsaw -> Phân bón
    'n02667093': 'Vật tư',          # Abaya -> Vật tư
    'n04604644': 'Dụng cụ làm vườn' # Fence -> Dụng cụ làm vườn
    # Thêm ánh xạ khác tại đây
}

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.get_json()
        # Kiểm tra dữ liệu đầu vào
        if not data or 'image' not in data:
            logger.error("Thiếu dữ liệu ảnh trong request")
            return make_response(jsonify({'error': 'Thiếu dữ liệu ảnh'}), 400)
            
        image_data = data['image']
        
        # Xử lý base64: bỏ phần header nếu có
        if image_data.startswith('data:image'):
            # Tách lấy phần base64 sau dấu phẩy
            image_data = image_data.split(',', 1)[1]
        
        # Giải mã base64
        try:
            img_bytes = base64.b64decode(image_data)
        except Exception as e:
            logger.error(f"Lỗi giải mã base64: {str(e)}")
            return make_response(jsonify({'error': 'Dữ liệu ảnh base64 không hợp lệ'}), 400)
        
        # Mở ảnh và tiền xử lý
        try:
            img = Image.open(io.BytesIO(img_bytes))
            if img.mode != 'RGB':
                img = img.convert('RGB')
                
            img = img.resize((224, 224))
            img_array = tf.keras.preprocessing.image.img_to_array(img)
            img_array = tf.expand_dims(img_array, axis=0)
            img_array = tf.keras.applications.mobilenet_v2.preprocess_input(img_array)
        except Exception as e:
            logger.error(f"Lỗi xử lý ảnh: {str(e)}")
            return make_response(jsonify({'error': 'Lỗi xử lý ảnh'}), 400)

        # Dự đoán
        try:
            predictions = model.predict(img_array)
            decoded = tf.keras.applications.mobilenet_v2.decode_predictions(predictions, top=1)[0]
        except Exception as e:
            logger.error(f"Lỗi dự đoán: {str(e)}")
            return make_response(jsonify({'error': 'Lỗi dự đoán'}), 500)

        # Lấy nhãn có độ tin cậy cao nhất
        if not decoded:
            logger.error("Không thể nhận diện ảnh")
            return make_response(jsonify({'error': 'Không thể nhận diện ảnh'}), 400)
            
        _, label, confidence = decoded[0]
        logger.info(f"Kết quả nhận diện: {label} ({confidence:.2f})")

        # Ánh xạ nhãn sang danh mục sản phẩm
        category = CATEGORY_MAPPING.get(label, 'Sản phẩm khác')
        
        if confidence < 0.5 or category == "Sản phẩm khác":
            # Trả về danh mục mặc định
            category = "Phân bón"
            logger.info(f"Áp dụng danh mục mặc định: {category}")

        return make_response(jsonify({
            'category': category,
            'confidence': float(confidence)
        }), 200, {'Content-Type': 'application/json'})
    except Exception as e:
        logger.error(f"Lỗi server: {str(e)}")
        return make_response(jsonify({
            'error': 'Lỗi máy chủ nội bộ',
            'message': str(e)
        }), 500)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)