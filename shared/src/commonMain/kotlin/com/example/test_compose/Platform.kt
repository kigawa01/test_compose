package com.example.test_compose

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform