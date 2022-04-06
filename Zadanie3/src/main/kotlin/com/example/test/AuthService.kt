package com.example.test

import org.springframework.stereotype.Repository

@Repository
object AuthService {
    private var username = "TestUser"
    private var password = "TestPassword"

    fun login(username_: String, password_: String): Boolean {
        return ((username_ == username) && (password_ == password))
    }
}
