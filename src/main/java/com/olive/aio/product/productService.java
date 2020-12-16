package com.olive.aio.product;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class productService {
    @GetMapping("/hello")
    public String hello(){
        return "Hello Test><";
    }
}
