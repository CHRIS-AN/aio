package com.olive.aio.logisticsManage.release;

import com.olive.aio.domain.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Transactional
@Service
@RequiredArgsConstructor
public class ReleaseService {

    private final RequestDummyRepository requestDummyRepository;
    private final ReleaseRepository releaseRepository;
    private final ReleaseListRepository releaseListRepository;

    public List<Requestdummy> findByRequestState(String state) {
        return requestDummyRepository.findByRequeststate(state);
    }

    public List<String> makeReqestTitleList(String state) {
        List<Requestdummy> select = requestDummyRepository.findByRequeststate(state);

        List<String> title = new ArrayList<>();
        for (Requestdummy requestD : select) {

            int reqProds = requestD.getDummyLists().size() - 1;
            String prodName = "";

            while (requestD.getDummyLists().iterator().hasNext()) {

                prodName = requestD.getDummyLists().iterator().next().getProdid().getProdName();
                break;
            }
            if (reqProds > 0)
                prodName += " 외 " + reqProds + "개";
            String reqTitle = prodName;

            title.add(reqTitle);
        }

        return title;
    }

    public List<Release> findByReleastateA(String state) {
        return releaseRepository.findByReleastateOrderByReleaidAsc(state);
    }

    public List<Release> findByReleastateD(String state) {
        return releaseRepository.findByReleastateOrderByReleaidDesc(state);
    }

    public Requestdummy reqList(Integer requestid) {
        return requestDummyRepository.findByRequestid(requestid);
    }


    public void saveReleaWait(ConfirmCntR confirmCntR, Release release, Integer requestId) throws Exception {

        int releaId = saveRelea(release, requestId);
        System.out.println("리턴 잘오냐" + releaId);

        Release releaSelect = releaseRepository.findByReleaid(releaId);

        Set<Releaselist> releaProds = new HashSet<>();
        for (Releaselist releaselist : confirmCntR.confirmCntR) {

            Releaselist prod = new Releaselist();
            prod.setReleaseid(releaSelect);
            prod.setReleaokconfirmcnt(releaselist.getReleaokconfirmcnt());
            releaProds.add(prod);
            releaseListRepository.save(prod);
        }

        releaSelect.setReleaselists(releaProds);
        releaseRepository.save(releaSelect);
    }

    public Integer saveRelea(Release release, Integer requestId) {

        Requestdummy select = requestDummyRepository.findByRequestid(requestId);

        int reqProds = select.getDummyLists().size() - 1;
        String prodName = "";

        while (select.getDummyLists().iterator().hasNext()){

            prodName = select.getDummyLists().iterator().next().getProdid().getProdName();
            break;
        }
        if (reqProds >0)
            prodName += " 외 " + reqProds + "개";
        String releaTitle = prodName;

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String releaDate = sdf.format(date);

        release.setReleatitle(releaTitle);
        release.setRelearegdate(releaDate);

        Release releaId = releaseRepository.save(release);
        return releaId.getReleaid();
    }

    public void updateReqState(Integer requestId, String state) {
        Requestdummy select = requestDummyRepository.findByRequestid(requestId);
        select.setRequeststate(state);
        requestDummyRepository.save(select);
    }

    public Release insertReleaOk(Release release){

        int releaId = release.getReleaid();
        Release select = releaseRepository.findByReleaid(releaId);

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String releaOkDate = sdf.format(date);

        select.setReleastate(release.getReleastate());
        select.setReleaokconfirmdate(releaOkDate);

        return select;
    }

    public Release releaList(Integer releaid){
        return releaseRepository.findByReleaid(releaid);
    }

    public List<Releaselist> releaOkList(Integer releaid){
        return releaseListRepository.findByReleaseid_Releaid(releaid);
    }

}
