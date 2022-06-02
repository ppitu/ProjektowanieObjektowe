package com.example.test

import org.springframework.stereotype.Repository

@Repository
object AuthService {
    private var username = "TestUser"
    private var password = "TestPassword"

    fun login(usernamemy: String, passwordmy: String): Boolean {
        return ((usernamemy == username) && (passwordmy == password))
    }
}
