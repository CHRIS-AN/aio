package com.olive.aio.Employee;

import com.olive.aio.domain.Empl;
import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.List;

@Getter
public class UserEmpl extends User {

    private Empl empl;

    public UserEmpl(Empl empl) {
        super(empl.getEmplId(), empl.getPassword(), List.of(new SimpleGrantedAuthority("ROLE_USER")));
        this.empl = empl;
    }
}
