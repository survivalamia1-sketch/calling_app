#!/bin/bash

echo "Testing registration with the backend..."
echo ""
echo "Attempting to register osama@gmail.com..."
echo ""

curl -v http://localhost:8080/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "osama@gmail.com",
    "password": "Test123456",
    "first_name": "Osama",
    "last_name": "Test"
  }' 2>&1 | grep -A 20 "< HTTP\|{" | tail -30

echo ""
echo ""
echo "================================================"
echo "If you see a validation error above, check:"
echo "1. Password must be at least 8 characters"
echo "2. Email must be valid format"
echo "3. first_name and last_name must be provided"
echo "================================================"
