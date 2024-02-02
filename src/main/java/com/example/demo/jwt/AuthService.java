package com.example.demo.jwt;

import com.example.demo.model.Customer;
import com.example.demo.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {
    private final AuthenticationManager authenticationManager;
    private final CustomerRepository customerRepository;
    private final JwtGenerator jwtGenerator;
    private final PasswordEncoder passwordEncoder;

    public String tokenlogin(String email, String password) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(email,
                        password));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        var user = customerRepository.findByEmail(email).get();
        if(user !=null){
            var token = jwtGenerator.generateToken(email);
           return token;
        }
        return null;
    }

    public String tokenRegister(Customer registerUser) {
        Customer userResponse = customerRepository.findByEmail(registerUser.getEmail()).get();
        if (userResponse!=null) {
            return null;
        }
        registerUser.setPassword(passwordEncoder.encode(registerUser.getPassword()));
        customerRepository.save(registerUser);
        var token = jwtGenerator.generateToken(registerUser.getEmail());

        return token;
    }
}

