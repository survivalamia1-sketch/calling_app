#!/bin/bash

echo "======================================"
echo "Testing Registration Endpoint"
echo "======================================"

# Test with valid data
echo ""
echo "1. Testing registration with valid data..."
curl -v -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test123456",
    "first_name": "Test",
    "last_name": "User"
  }'

echo ""
echo ""
echo "======================================"
echo "2. Testing login with the registered user..."
curl -X POST http://localhost:8080/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "Test123456"
  }'

echo ""
echo ""
echo "======================================"
echo "3. Testing registration with short password (should fail)..."
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test2@example.com",
    "password": "short",
    "first_name": "Test",
    "last_name": "User"
  }'

echo ""
echo ""
echo "======================================"
echo "4. Testing registration with missing fields (should fail)..."
curl -X POST http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test3@example.com",
    "password": "Test123456"
  }'

echo ""
echo "======================================"
echo "Tests completed"
echo "======================================"
