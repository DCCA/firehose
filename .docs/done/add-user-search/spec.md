# Spec: Add User Search by Email

## Requirements

### Requirement: Email Query Parameter

The system SHALL accept an optional `email` query parameter on `GET /users`.

#### Scenario: Valid email lookup

- GIVEN a user with email `alice@example.com` exists
- WHEN a client sends `GET /users?email=alice@example.com`
- THEN the response status is `200`
- AND the response body contains an array with that user's record

#### Scenario: Case-insensitive matching

- GIVEN a user with email `Alice@Example.com` exists
- WHEN a client sends `GET /users?email=alice@example.com`
- THEN the response body contains that user's record

#### Scenario: No match

- GIVEN no user with email `nobody@example.com` exists
- WHEN a client sends `GET /users?email=nobody@example.com`
- THEN the response status is `200`
- AND the response body is an empty array `[]`

### Requirement: Backward Compatibility

The system SHALL NOT change the behavior of `GET /users/:id`.

#### Scenario: Existing ID lookup still works

- GIVEN a user with ID `42` exists
- WHEN a client sends `GET /users/42`
- THEN the response is identical to before this change
