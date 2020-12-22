package com.olive.aio.corp;

import java.util.List;

public interface CorpService {
    List<Corp> findAll(Corp corp);

    void insertCorp(Corp corp);;

    void updateCorp(Corp corp);

    void deleteById(Corp corp);


}
