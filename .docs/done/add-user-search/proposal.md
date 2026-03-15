# Proposal: Add User Search by Email

## Why

Users need to look up accounts by email address for support cases. Currently the only lookup is by user ID, which support agents rarely have on hand.

## Scope

- Add a `GET /users?email=` query parameter to the existing users API.
- Return the same user object shape as `GET /users/:id`.
- Case-insensitive matching.

## Out of Scope

- Full-text search across multiple fields.
- Pagination (single email should return at most one result).
- Rate limiting (tracked as a follow-up).

## Success Criteria

- Support agents can search by email and get the user record.
- Existing `GET /users/:id` endpoint is unchanged.
- Query with no match returns an empty array, not an error.
