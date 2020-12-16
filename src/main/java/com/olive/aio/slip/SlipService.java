package com.olive.aio.slip;


import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class SlipService {

    private final SlipRepository repository;
    private final ModelMapper modelMapper;


    public static Slip createNewSlip(Slip map) {


        return null;
    }
}
