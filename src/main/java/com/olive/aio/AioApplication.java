package com.olive.aio;

import com.olive.aio.domain.Empl;
import com.olive.aio.employee.EmplRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@RequiredArgsConstructor
@SpringBootApplication
public class AioApplication {

    private final EmplRepository repository;

    public static void main(String[] args) {

        SpringApplication.run(AioApplication.class, args);
    }

}
