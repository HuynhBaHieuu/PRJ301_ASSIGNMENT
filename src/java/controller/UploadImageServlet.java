package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "UploadImageServlet", value = "/upload-image")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Đọc JSON request
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (Exception e) {
            sendError(response, "Error reading request: " + e.getMessage());
            return;
        }

        JSONObject jsonRequest;
        String imageData;
        try {
            jsonRequest = new JSONObject(sb.toString());
            imageData = jsonRequest.getString("image");
        } catch (Exception e) {
            sendError(response, "Invalid JSON format");
            return;
        }

        // Gọi API Python
        String pythonApiUrl = "http://localhost:5000/predict";
        System.out.println("Calling Python API: " + pythonApiUrl);

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(pythonApiUrl);

            // Tạo JSON body
            JSONObject jsonBody = new JSONObject();
            jsonBody.put("image", imageData);
            StringEntity entity = new StringEntity(jsonBody.toString(), "UTF-8");
            entity.setContentType("application/json");
            httpPost.setEntity(entity);

            // Gửi request và nhận response
            HttpResponse apiResponse = httpClient.execute(httpPost);
            int statusCode = apiResponse.getStatusLine().getStatusCode();
            String responseBody = EntityUtils.toString(apiResponse.getEntity());

            System.out.println("API response status: " + statusCode);
            System.out.println("API response: " + responseBody);

            // Kiểm tra nếu response không phải JSON
            if (statusCode != 200) {
                throw new IOException("API returned status: " + statusCode);
            }

            // Gửi kết quả về client
            response.setContentType("application/json");
            response.getWriter().write(responseBody);

        } catch (Exception e) {
            e.printStackTrace();
            sendError(response, "Error calling Python API: " + e.getMessage());
        }
    }

    private void sendError(HttpServletResponse response, String errorMessage) throws IOException {
        JSONObject errorJson = new JSONObject();
        errorJson.put("error", errorMessage);
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.setContentType("application/json");
        response.getWriter().write(errorJson.toString());
    }
}
