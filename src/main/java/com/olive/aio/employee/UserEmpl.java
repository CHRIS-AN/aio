package com.olive.aio.employee;

import com.olive.aio.domain.Empl;
import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.List;

@Getter
public class UserEmpl extends User {

    private Empl empl;

    public UserEmpl(Empl empl, String role) {
        super(empl.getEmplId(), empl.getPassword(), List.of(new SimpleGrantedAuthority(role)));
        this.empl = empl;
    }
}
