package com.example.test

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RestController
import com.example.test.AuthService
import org.springframework.web.bind.annotation.GetMapping

@RestController
class AuthController
@Autowired constructor(
        private val authService: AuthService
)
{

 @PostMapping("/login", produces = [MediaType.TEXT_PLAIN_VALUE])
 fun login(@RequestBody loginForm: LoginForm) : ResponseEntity<String> {
     println(loginForm.username)
    return if(this.authService.login(loginForm.username, loginForm.password)) {
        ResponseEntity("Success!", HttpStatus.OK)
    } else
    {
        ResponseEntity("Failed!", HttpStatus.UNAUTHORIZED)
    }
 }

    @GetMapping("/logout")
    fun logout(): ResponseEntity<String>{
        return ResponseEntity("Success!", HttpStatus.OK)
    }
}
