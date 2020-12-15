package com.olive.aio.Employee;

import com.olive.aio.domain.Empl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Transactional
@Service
@RequiredArgsConstructor
public class EmplService implements UserDetailsService {

    private final EmplRepository emplRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Empl empl = emplRepository.findByEmplId(username);

        if(empl == null) {
            throw new UsernameNotFoundException(username);
        }

        return new UserEmpl(empl);
    }
}
