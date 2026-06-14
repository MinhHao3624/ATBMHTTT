package com.projectttweb.webphone.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ca-proxy/*")
public class CAProxyController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final HttpClient httpClient = HttpClient.newBuilder().version(HttpClient.Version.HTTP_1_1).build();
    private static final String CA_SERVER_URL = "http://localhost:8081/api/v1/ca";

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        if (pathInfo == null) pathInfo = "";

        String targetUrl = CA_SERVER_URL + pathInfo;
        String method = request.getMethod();

        try {
            HttpRequest.Builder requestBuilder = HttpRequest.newBuilder()
                    .uri(URI.create(targetUrl))
                    .header("Content-Type", "application/json; charset=UTF-8")
                    .header("Accept", "application/json");

            if ("POST".equalsIgnoreCase(method) || "PATCH".equalsIgnoreCase(method) || "PUT".equalsIgnoreCase(method)) {
                byte[] bodyBytes = request.getInputStream().readAllBytes();
                requestBuilder.method(method, HttpRequest.BodyPublishers.ofByteArray(bodyBytes));
            } else {
                requestBuilder.method(method, HttpRequest.BodyPublishers.noBody());
            }

            HttpResponse<byte[]> targetResponse = httpClient.send(requestBuilder.build(), HttpResponse.BodyHandlers.ofByteArray());

            response.setStatus(targetResponse.statusCode());
            response.setContentType("application/json; charset=UTF-8");
            
            OutputStream out = response.getOutputStream();
            out.write(targetResponse.body());
            out.flush();

        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Proxy interrupted");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Proxy error: " + e.getMessage());
        }
    }
}
