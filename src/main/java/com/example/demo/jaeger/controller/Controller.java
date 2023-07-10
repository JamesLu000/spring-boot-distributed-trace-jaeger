package com.example.demo.jaeger.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.opentelemetry.instrumentation.annotations.WithSpan;
import io.opentelemetry.instrumentation.annotations.SpanAttribute;

//import io.opentelemetry.api;
import io.opentelemetry.api.trace.Tracer;
import io.opentelemetry.api.trace.Span;

@RestController
@RequestMapping("/hello")
public class Controller {

    //Tracer tracer = openTelemetry.getTracer("instrumentation-library-name", "1.0.0");

    private static final Logger logger = LoggerFactory.getLogger(Controller.class);
    
    private RestTemplate restTemplate;

    @Value("${spring.application.name}")
    private String applicationName;

    public Controller(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @WithSpan
    public void span(@SpanAttribute("param1") String param1) {
        Span span = Span.current();
        span.addEvent("before print");
        logger.info("span param1: {}", param1);
        span.addEvent("after print");

    }

    @GetMapping("/path1")
    public ResponseEntity<String>  path1() {

        logger.info("Incoming request at {} for request /path1 ", applicationName);
        span("abc");
        String response = restTemplate.getForObject("http://localhost:8090/hello/path2", String.class);
        return ResponseEntity.ok("response from /path1 + " + response);
    }

    @GetMapping("/path2")
    public ResponseEntity<String>  path2() {
        logger.info("Incoming request at {} at /path2", applicationName);
        return ResponseEntity.ok("response from /path2 ");
    }
}
